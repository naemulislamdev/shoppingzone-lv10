<?php

namespace App\CPU;

use App\Model\Cart;
use App\Model\CartShipping;
use App\Model\Color;
use App\Model\Product;
use App\Model\Shop;
use Barryvdh\Debugbar\Twig\Extension\Debug;
use Cassandra\Collection;
use Illuminate\Support\Str;
use App\Model\ShippingType;
use App\Model\ShippingMethod;
use App\Model\CategoryShippingCost;

class CartManager
{
    public static function cart_to_db()
    {
        $user = Helpers::get_customer();
        if (session()->has('offline_cart')) {
            $cart = session('offline_cart');
            $storage = [];
            foreach ($cart as $item) {
                $db_cart = Cart::where(['customer_id' => $user->id, 'seller_id' => $item['seller_id'], 'seller_is' => $item['seller_is']])->first();
                $storage[] = [
                    'customer_id' => $user->id,
                    'cart_group_id' => isset($db_cart) ? $db_cart['cart_group_id'] : str_replace('offline', $user->id, $item['cart_group_id']),
                    'product_id' => $item['product_id'],
                    'color' => $item['color'],
                    'choices' => $item['choices'],
                    'variations' => $item['variations'],
                    'variant' => $item['variant'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price'],
                    'tax' => $item['tax'],
                    'discount' => $item['discount'],
                    'slug' => $item['slug'],
                    'name' => $item['name'],
                    'thumbnail' => $item['thumbnail'],
                    'seller_id' => ($item['seller_is'] == 'admin') ? 1 : $item['seller_id'],
                    'seller_is' => $item['seller_is'],
                    'shop_info' => $item['shop_info'],
                    'shipping_cost'=>$item['shipping_cost'],
                    'shipping_type'=>$item['shipping_type'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
            Cart::insert($storage);
            session()->put('offline_cart', collect([]));
        }
    }

    public static function getCart()
    {
        $cart = Cart::get();
        return $cart;
    }
    public static function get_cart($group_id = null)
    {
        $user = Helpers::get_customer();
        if (session()->has('offline_cart') && $user == 'offline') {
            $cart = session('offline_cart');
            if ($group_id != null) {
                return $cart->where('cart_group_id', $group_id)->get();
            } else {
                return $cart;
            }
        }

        if ($group_id == null) {
            $cart = Cart::whereIn('cart_group_id', CartManager::get_cart_group_ids())->get();
        } else {
            $cart = Cart::where('cart_group_id', $group_id)->get();
        }

        return $cart;
    }

    public static function get_cart_group_ids($request = null)
    {
        $user = Helpers::get_customer_check($request);
        if ($user == 'offline') {
            if (session()->has('offline_cart') == false) {
                session()->put('offline_cart', collect([]));
            }
            $cart = session('offline_cart');
            $cart_ids = array_unique($cart->pluck('cart_group_id')->toArray());
        } else {
            $cart_ids = Cart::where(['customer_id' => $user->id])->groupBy('cart_group_id')->pluck('cart_group_id')->toArray();
        }
        return $cart_ids;
    }

    public static function get_shipping_cost($id = null)
    {

        $cost = ShippingMethod::where('id', $id)->first()->cost;

        return $cost;
    }

    public static function cart_total($cart)
    {
        $total = 0;
        if (!empty($cart)) {
            foreach ($cart as $item) {
                $product_subtotal = $item['price'] * $item['quantity'];
                $total += $product_subtotal;
            }
        }
        return $total;
    }

    public static function cart_total_applied_discount($cart)
    {
        $total = 0;
        if (!empty($cart)) {
            foreach ($cart as $item) {
                $product_subtotal = ($item['price'] - $item['discount']) * $item['quantity'];
                $total += $product_subtotal;
            }
        }
        return $total;
    }

    public static function cart_total_with_tax($cart)
    {
        $total = 0;
        if (!empty($cart)) {
            foreach ($cart as $item) {
                $product_subtotal = ($item['price'] * $item['quantity']) + ($item['tax'] * $item['quantity']);
                $total += $product_subtotal;
            }
        }
        return $total;
    }

    public static function cart_grand_total($cart) // needed
    {
        $total = 0;
        // return response()->json(['order_id'=>$cart,translate('order_placed_successfully')], 200);
        if (!empty($cart)) {
            foreach ($cart as $item) {
                $product_subtotal = ($item['price'] * $item['quantity'])
                    + ($item['tax'] * $item['quantity'])
                    - $item['discount']* $item['quantity'];
                $total += $product_subtotal;
            }
        }
        return $total;
    }



    public static function cart_clean($request = null) // no need
    {
        $cart_ids = CartManager::get_cart_group_ids($request);
        CartShipping::whereIn('cart_group_id', $cart_ids)->delete();
        Cart::whereIn('cart_group_id', $cart_ids)->delete();

        session()->forget('coupon_code');
        session()->forget('coupon_discount');
        session()->forget('payment_method');
        session()->forget('shipping_method_id');
        session()->forget('billing_address_id');
        session()->forget('order_id');
        session()->forget('cart_group_id');
        session()->forget('order_note');
    }

    public static function add_to_cart($request) //no need
    {
        $str = '';
        $variations = [];
        $price = 0;

        $user = Helpers::get_customer($request);
        $product = Product::find($request->id);
        //  $cart['variations'] = $request['variations'];
        //check the color enabled or disabled for the product
        // if ($request->has('color')) {
        //     $str = Color::where('code', $request['color'])->first()->name;
        //     $variations['color'] = $str;
        // }

        //Gets all the choice values of customer choice option and generate a string like Black-S-Cotton
        $choices = [];
        foreach (json_decode($product->choice_options) as $key => $choice) {
            $choices[$choice->name] = $request[$choice->name];
            $variations[$choice->title] = $request[$choice->name];
            if ($str != null) {
                $str .= '-' . str_replace(' ', '', $request[$choice->name]);
            } else {
                $str .= str_replace(' ', '', $request[$choice->name]);
            }
        }

        if ($user == 'offline') {
            if (session()->has('offline_cart')) {
                $cart = session('offline_cart');
                $check = $cart->where('product_id', $request->id)->where('variant', $str)->first();
                if (isset($check) == false) {
                    $cart = collect();
                    $cart['id'] = time();
                } else {
                    return [
                        'status' => 0,
                        'message' => translate('already_added!')
                    ];
                }
            } else {
                $cart = collect();
                session()->put('offline_cart', $cart);
            }
        } else {
            $cart = Cart::where(['product_id' => $request->id, 'customer_id' => $user->id, 'variant' => $str])->first();
            if (isset($cart) == false) {
                $cart = new Cart();
            } else {
                return [
                    'status' => 0,
                    'message' => translate('already_added!')
                ];
            }
        }

        $cart['color'] = $request->has('color') ? $request['color'] : null;
        $cart['product_id'] = $product->id;
        $cart['variations'] = $request['variations'] ?? null;
        $cart['variant'] = $request['variant'] ?? null;
        $cart['choices'] = json_encode($choices);

        //chek if out of stock
        if ($product['current_stock'] < $request['quantity']) {
            return [
                'status' => 0,
                'message' => translate('out_of_stock!')
            ];
        }

        // $cart['variations'] = json_encode($variations);
        // $cart['variant'] = $str;

        //Check the string and decreases quantity for the stock
        if ($str != null) {
            $count = count(json_decode($product->variation));
            for ($i = 0; $i < $count; $i++) {
                if (json_decode($product->variation)[$i]->type == $str) {
                    $price = json_decode($product->variation)[$i]->price;
                    if (json_decode($product->variation)[$i]->qty < $request['quantity']) {
                        return [
                            'status' => 0,
                            'message' => translate('out_of_stock!')
                        ];
                    }
                }
            }
        } else {
            $price = $product->unit_price;
        }

        $tax = Helpers::tax_calculation($price, $product['tax'], 'percent');

        //generate group id
        if ($user == 'offline') {
            $check = session('offline_cart');
            $cart_check = $check->where('seller_id', ($product->added_by == 'admin') ? 1 : $product->user_id)
                ->where('seller_is', $product->added_by)->first();
        } else {
            $cart_check = Cart::where([
                'customer_id' => $user->id,
                'seller_id' => ($product->added_by == 'admin') ? 1 : $product->user_id,
                'seller_is' => $product->added_by])->first();
        }

        if (isset($cart_check)) {
            $cart['cart_group_id'] = $cart_check['cart_group_id'];
        } else {
            $cart['cart_group_id'] = ($user == 'offline' ? 'offline' : $user->id) . '-' . Str::random(5) . '-' . time();
        }
        //generate group id end

        $cart['customer_id'] = $user->id ?? 0;
        $cart['quantity'] = $request['quantity'];
        /*$data['shipping_method_id'] = $shipping_id;*/
        $cart['price'] = $price;
        $cart['tax'] = $tax;
        $cart['slug'] = $product->slug;
        $cart['name'] = $product->name;
        $cart['discount'] = Helpers::get_product_discount($product, $price);
        /*$data['shipping_cost'] = $shipping_cost;*/
        $cart['thumbnail'] = $product->thumbnail;
        $cart['seller_id'] = ($product->added_by == 'admin') ? 1 : $product->user_id;
        $cart['seller_is'] = $product->added_by;
        $cart['shipping_cost'] = CartManager::get_shipping_cost_for_product_category_wise($product,$request['quantity']);
        if ($product->added_by == 'seller') {
            $cart['shop_info'] = Shop::where(['seller_id' => $product->user_id])->first()->name;
        } else {
            $cart['shop_info'] = Helpers::get_business_settings('company_name');
        }

        $shippingMethod = Helpers::get_business_settings('shipping_method');

        if($shippingMethod == 'inhouse_shipping')
        {
            $admin_shipping = ShippingType::where('seller_id',0)->first();
            $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';

        }else{
            if($product->added_by == 'admin'){
                $admin_shipping = ShippingType::where('seller_id',0)->first();
                $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';
            }else{
                $seller_shipping = ShippingType::where('seller_id',$product->user_id)->first();
                $shipping_type = isset($seller_shipping)==true? $seller_shipping->shipping_type:'order_wise';
            }
        }
        $cart['shipping_type']=$shipping_type;

        if ($user == 'offline') {
            $offline_cart = session('offline_cart');
            $offline_cart->push($cart);
            session()->put('offline_cart', $offline_cart);
        } else {
            $cart->save();
        }

        return [
            'status' => 1,
            'message' => translate('successfully_added!')
        ];
    }


     public static function cart_to_db_api($request, $from_api = false)
    {
        $user = Helpers::get_customer($request);
        if ($request->all()) {
            $cart = $request->all();
             foreach ($cart as $item) {
                  var_dump ( $item);
             }

            // $product = Product::find($request->id);
            // $storage = [];

                $db_cart = Cart::where(['customer_id' => $user->id, 'seller_id' => $request['seller_id'], 'seller_is' => $request['seller_is']])->first();
              $data= ([
                    'customer_id' => $user->id,
                    'cart_group_id' => isset($db_cart) ? $db_cart['cart_group_id'] : str_replace('offline', $user->id, $request['cart_group_id']),
                    'product_id' => $request['product_id'],
                    'color' => $request['color'],
                    'choices' => $request['choices'],
                    'variations' => $request['variations'],
                    'variant' => $request['variant'],
                    'quantity' => $request['quantity'],
                    'price' => $request['price'],
                    'tax' => $request['tax'],
                    'discount' => $request['discount'],
                    'slug' => $request['slug'],
                    'name' => $request['name'],
                    'thumbnail' => $request['thumbnail'],
                    'seller_id' => ($request['seller_is'] == 'admin') ? 1 : $request['seller_id'],
                    'seller_is' => $request['seller_is'],
                    'shop_info' => $request['shop_info'],
                    'shipping_cost'=>$request['shipping_cost'],
                    'shipping_type'=>$request['shipping_type'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

          $data = Cart::insert($data);
            return [
                'status' => 1,
                'data' => $data,
                'message' => translate('successfully_added!')
            ];
        }
    }


    public static function update_cart_qty($request)
    {
        $user = Helpers::get_customer($request);
        $status = 1;
        $qty = 0;
        $cart = Cart::where(['id' => $request->key, 'customer_id' => $user->id])->first();

        $product = Product::find($cart['product_id']);
        $count = count(json_decode($product->variation));
        if ($count) {
            for ($i = 0; $i < $count; $i++) {
                if (json_decode($product->variation)[$i]->type == $cart['variant']) {
                    if (json_decode($product->variation)[$i]->qty < $request->quantity) {
                        $status = 0;
                        $qty = $cart['quantity'];
                    }
                }
            }
        } else if ($product['current_stock'] < $request->quantity) {
            $status = 0;
            $qty = $cart['quantity'];
        }

        if ($status) {
            $qty = $request->quantity;
            $cart['quantity'] = $request->quantity;
            $cart['shipping_cost'] =  CartManager::get_shipping_cost_for_product_category_wise($product,$request->quantity);
        }

        $cart->save();

        return [
            'status' => $status,
            'qty' => $qty,
            'message' => $status == 1 ? translate('successfully_updated!') : translate('sorry_stock_is_limited')
        ];
    }

    public static function get_shipping_cost_for_product_category_wise($product,$qty)
    {
        $shippingMethod = Helpers::get_business_settings('shipping_method');
        $cost = 0;

        if($shippingMethod == 'inhouse_shipping')
        {
            $admin_shipping = ShippingType::where('seller_id',0)->first();
            $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';

        }else{
            if($product->added_by == 'admin'){
                $admin_shipping = ShippingType::where('seller_id',0)->first();
                $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';
            }else{
                $seller_shipping = ShippingType::where('seller_id',$product->user_id)->first();
                $shipping_type = isset($seller_shipping)==true? $seller_shipping->shipping_type:'order_wise';
            }
        }

        if($shipping_type == 'category_wise')
        {
            $categoryID = 0;
            foreach(json_decode($product->category_ids) as $ct)
            {
                if($ct->position == 1)
                {
                    $categoryID = $ct->id;
                }
            }

            if ($shippingMethod == 'inhouse_shipping') {
                $category_shipping_cost = CategoryShippingCost::where('seller_id',0)->where('category_id',$categoryID)->first();
            } else {
                if($product->added_by == 'admin'){
                    $category_shipping_cost = CategoryShippingCost::where('seller_id',0)->where('category_id',$categoryID)->first();
                }else{
                    $category_shipping_cost = CategoryShippingCost::where('seller_id',$product->user_id)->where('category_id',$categoryID)->first();
                }
            }



            if($category_shipping_cost->multiply_qty == 1)
            {
                $cost = $qty * $category_shipping_cost->cost;
            }else{
                $cost = $category_shipping_cost->cost;
            }


        }else if($shipping_type == 'product_wise'){

            if($product->multiply_qty == 1)
            {
                $cost = $qty * $product->shipping_cost;
            }else{
                $cost = $product->shipping_cost;
            }
        }else{
            $cost = 0;
        }

        return $cost;
    }
}

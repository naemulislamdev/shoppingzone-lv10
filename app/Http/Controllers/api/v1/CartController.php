<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CartManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Cart;
use App\Model\CartShipping;
use App\Model\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use function App\CPU\translate;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class CartController extends Controller
{
    public function cart(Request $request)
    {
        $user = Helpers::get_customer($request);
        $cart = Cart::with('product:id,current_stock,minimum_order_qty,variation')
            ->where(['customer_id' => $user->id])
            ->get();

        if($cart) {
            foreach($cart as $key => $value){
                if(!isset($value['product'])){
                    $cart_data = Cart::find($value['id']);
                    $cart_data->delete();

                    unset($cart[$key]);
                }
            }

            $cart->map(function ($data) {
                $data['choices'] = json_decode($data['choices']);
                $data['variations'] = json_decode($data['variations']);

                $data['product']['total_current_stock'] = isset($data['product']['current_stock']) ? $data['product']['current_stock'] : 0;
                if (isset($data['product']['variation']) && !empty($data['product']['variation'])) {
                    $variants = json_decode($data['product']['variation']);
                    foreach ($variants as $var) {
                        if ($data['variant'] == $var->type) {
                            $data['product']['total_current_stock'] = $var->qty;
                        }
                    }
                }
                unset($data['product']['variation']);

                return $data;
            });
        }

        return response()->json($cart, 200);
    }
    
    public function cartGroupId(Request $request){
        $user = Helpers::get_customer($request);
        $cart = Cart::with('product:id,current_stock,minimum_order_qty,variation')
            ->where(['customer_id' => $user->id])
            ->first();

            return response()->json($cart, 200);
    }
    
    public function cartView(Request $request){
        $user = Helpers::get_customer($request);
        $cart = Cart::with('product:id,current_stock,minimum_order_qty,variation')
            ->where(['customer_id' => Auth::id()])
            ->get();

            return response()->json($cart, 200);
    }

    public function add_to_cart(Request $request)
    {
        // CartManager::cart_clean($request);
        // $cart_ids =Cart::where(['customer_id' => Auth::id()])->groupBy('cart_group_id')->pluck('cart_group_id')->toArray();
        // $cart_ids = Cart::where(['customer_id' => $request->user()->id])->first();
        // CartShipping::whereIn('cart_group_id', $cart_ids)->delete();
        // Cart::whereIn('cart_group_id', $cart_ids)->delete();
        
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'quantity' => 'required',
        ], [
            'id.required' => translate('Product ID is required!')
        ]);

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $cart = CartManager::add_to_cart($request);
        return response()->json($cart, 200);
    }
    
    public function cart_to_db_api(Request $request)
    {
            $data= $request->all();
            // dd($data)
            $groupId=Auth::id() . '-' . Str::random(5) . '-' . time();
                 $product1 = Product::find($data['ProductID'][0]);
                  $cart1 = new Cart();
                  $cart1->cart_group_id= $groupId;
                    $cart1->customer_id = Auth::id();
                    $cart1->product_id =$data['ProductID'][0]; 
                    // $cart1->quantity =$data['Qty'][0]; 
                    // $cart1->variations =$data['Size'][0]; 
                    // $cart1->variant =$data['Color'][0]; 
                    $cart1->discount =Helpers::get_product_discount($product1, $product1['unit_price']);
                    $cart1->slug =$product1['slug'];
                    $cart1->name =$product1['name'];
                    $cart1->thumbnail =$product1['thumbnail'];
                    $cart1->price =$product1['unit_price'];
                    $cart1->seller_id =$product1['user_id'];
                     $cart1->save();
                     
                     $product2 = Product::find($data['ProductID'][1]);
                  $cart2 = new Cart();
                // $db_cart = Cart::where(['customer_id' => Auth::id(), 'seller_id' => $product['seller_id'], 'seller_is' => $product['seller_is']])->first();
                    $cart2->cart_group_id= $groupId;
                    $cart2->customer_id = Auth::id();
                    $cart2->product_id =$data['ProductID'][1]; 
                    // $cart2->quantity =$data['Qty'][1]; 
                    // $cart2->variations =$data['Size'][1]; 
                    // $cart2->variant =$data['Color'][1]; 
                    $cart2->price =$product2['unit_price'];
                    $cart2->discount =Helpers::get_product_discount($product2, $product2['unit_price']);
                    $cart2->slug =$product2['slug'];
                    $cart2->name =$product2['name'];
                    $cart1->seller_id =$product1['user_id'];
                    $cart2->thumbnail =$product2['thumbnail'];
                     $cart2->save();
            
                return [
                    'status' => 1,
                    'message' => translate('successfully_added!')
                ];
    }

    public function update_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => 'required',
            'quantity' => 'required',
        ], [
            'key.required' => translate('Cart key or ID is required!')
        ]);

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $response = CartManager::update_cart_qty($request);
        return response()->json($response);
    }

    public function remove_from_cart(Request $request)
    {
        // $validator = Validator::make($request->all(), [
        //     'key' => 'required'
        // ], [
        //     'key.required' => translate('Cart key or ID is required!')
        // ]);

        // if ($validator->errors()->count() > 0) {
        //     return response()->json(['errors' => Helpers::error_processor($validator)]);
        // }

        $user = Helpers::get_customer($request);
        Cart::where(['id' => $request->id, 'customer_id' => $request->customer_id])->delete();
        return response()->json(translate('successfully_removed'));
    }
    
    public function Cartremove_from_cart($id)
    {
        Cart::where(['id'=>$id])->delete();
        return response()->json(translate('successfully_removed'));
    }
    public function remove_all_from_cart(Request $request)
    {
        // $validator = Validator::make($request->all(), [
        //     'key' => 'required'
        // ], [
        //     'key.required' => translate('Cart key or ID is required!')
        // ]);

        // if ($validator->errors()->count() > 0) {
        //     return response()->json(['errors' => Helpers::error_processor($validator)]);
        // }

        $user = Helpers::get_customer($request);
        Cart::where(['customer_id' => $user->id])->delete();
        return response()->json(translate('successfully_removed'));
    }
    
   
}

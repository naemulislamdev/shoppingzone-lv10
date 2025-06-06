<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CategoryManager;
use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\CPU\ProductManager;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\OrderDetail;
use App\Model\Product;
use App\Model\Review;
use App\Model\ShippingMethod;
use App\Model\Wishlist;
use App\Model\Color;
use App\campaing_detalie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use function App\CPU\translate;
use Carbon\Carbon;

class ProductController extends Controller
{
    public function allProducts(){
        $allProducts = Product::with(['reviews'])->active();
    }
    public function get_latest_products(Request $request)
    {
        $products = ProductManager::get_latest_products($request['limit'], $request['offset']);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }
    public function get_latestWeb_products(Request $request)
    {
        $products = Product::active()->with(['rating'])->latest()->get();
        return response()->json($products, 200);
    }

    public function get_featured_products(Request $request)
    {
        $products = ProductManager::get_featured_products($request['limit'], $request['offset']);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }
    public function get_featuredWeb_products(Request $request)
    {
        $products = Product::with(['rating'])->active()
            ->where('featured', 1)
            ->orderBy('id', 'DESC')
            ->get();
        return response()->json($products, 200);
    }

    public function get_top_rated_products(Request $request)
    {
        $products = ProductManager::get_top_rated_products($request['limit'], $request['offset']);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }

    public function get_searched_products($key)
    {

        return Product::where('name','Like',"%$key%")->get();
        // return response()->json($products, 200);
    }

    public function get_Appsearch_products(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $products = ProductManager::search_products($request['name'], $request['limit'], $request['offset']);
        if ($products['products'] == null) {
            $products = ProductManager::translated_product_search($request['name'], $request['limit'], $request['offset']);
        }
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
        // return Product::where('name','Like',"%$key%")->get();
        // return response()->json($products, 200);
    }

    public function get_product($slug)
    {
        $product = Product::with(['reviews.customer'])->where(['slug' => $slug])->first();

        if(!$product){
            $product = Product::with(['reviews.customer'])->where(['id' => $slug])->first();
        }


        if (isset($product)) {
            $product = Helpers::product_data_formatting($product, false);
        }
        return response()->json($product, 200);
    }



    public function get_product_discount($slug,$id)
    {
        $todayDate=Carbon::today()->toDateString();
        $product = Product::with(['reviews.customer'])->join('campaing_detalies', 'campaing_detalies.product_id', '=', 'products.id')->where(['slug' => $slug])->Where('campaing_detalies.id', $id)->select(['products.*','campaing_detalies.start_day', 'campaing_detalies.end_day', 'campaing_detalies.discountCam'])->first();
        $pro = campaing_detalie::where('product_id',$product->id)->get();
        if (isset($product)) {
            $product = Helpers::product_data_formatting($product, false);
        }
        return response()->json(["product"=>$product,"pro"=>$pro], 200);
    }

    public function get_best_sellings(Request $request)
    {
        $products = ProductManager::get_best_selling_products($request['limit'], $request['offset']);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);

        return response()->json($products, 200);
    }

    public function get_video_shopping(Request $request)
    {
        $products = ProductManager::get_video_shopping_products($request['limit'], $request['offset']);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);

        return response()->json($products, 200);
    }

    public function get_home_categories()
    {
        $categories = Category::where('home_status', true)->priority()->get();
        $categories->map(function ($data) {
            $data['products'] = Helpers::product_data_formatting(CategoryManager::homeProducts($data['id']), true);
            return $data;
        });
        return response()->json($categories, 200);
    }

    public function get_related_products($id)
    {
        if (Product::find($id)) {
            $products = ProductManager::get_related_products($id);
            $products = Helpers::product_data_formatting($products, true);
            return response()->json($products, 200);
        }
        return response()->json([
            'errors' => ['code' => 'product-001', 'message' => translate('Product not found!')]
        ], 404);
    }

    public function get_product_reviews($id)
    {
        $reviews = Review::with(['customer'])->where(['product_id' => $id])->get();

        $storage = [];
        foreach ($reviews as $item) {
            $item['attachment'] = json_decode($item['attachment']);
            array_push($storage, $item);
        }

        return response()->json($storage, 200);
    }

    public function get_product_rating($id)
    {
        try {
            $product = Product::find($id);
            $overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews);
            return response()->json(floatval($overallRating[0]), 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function counter($product_id)
    {
        try {
            $countOrder = OrderDetail::where('product_id', $product_id)->count();
            $countWishlist = Wishlist::where('product_id', $product_id)->count();
            return response()->json(['order_count' => $countOrder, 'wishlist_count' => $countWishlist], 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function social_share_link($product_slug)
    {
        $product = Product::where('slug', $product_slug)->first();
        $link = route('product', $product->slug);
        try {

            return response()->json($link, 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function submit_product_review(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
            'comment' => 'required',
            'rating' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $image_array = [];
        if (!empty($request->file('fileUpload'))) {
            foreach ($request->file('fileUpload') as $image) {
                if ($image != null) {
                    array_push($image_array, ImageManager::upload('review/', 'png', $image));
                }
            }
        }

        $review = new Review;
        $review->customer_id = $request->user()->id;
        $review->product_id = $request->product_id;
        $review->comment = $request->comment;
        $review->rating = $request->rating;
        $review->attachment = json_encode($image_array);
        $review->save();

        return response()->json(['message' => translate('successfully review submitted!')], 200);
    }

    public function get_shipping_methods(Request $request)
    {
        $methods = ShippingMethod::where(['status' => 1])->get();
        return response()->json($methods, 200);
    }

    public function get_shipping_methods_id(Request $request,$id)
    {
        $methods = ShippingMethod::where(['id' => $id])->get();
        return response()->json($methods, 200);
    }

    public function get_discounted_product(Request $request)
    {
        $products = ProductManager::get_discounted_product($request['limit'], $request['offset']);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }

    public function price_reanges(Request $request){
        $min_price = Product::orderBy('unit_price', 'ASC');
        $max_price = Product::orderBy('unit_price', 'DESC');
        $filter_min_price = $request->min_price;
        $filter_max_price = $request->max_price;
        $range = [$filter_min_price, $filter_max_price];
        $products = Product::whereBetween('unit_price', $range)->get();


        return response()->json($products, 200);

    }

    public function colorSearch($key){
       return Product::where('variation','Like',"%$key%")->get();

    }

    public function Color(){
        return Color::all();
    }
}

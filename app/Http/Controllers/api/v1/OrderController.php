<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CartManager;
use App\CPU\Helpers;
use App\CPU\OrderManager;
use App\Http\Controllers\Controller;
use App\Model\Admin;
use App\Model\Order;
use App\Model\OrderDetail;
use App\Model\Seller;
use App\Model\ShippingAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use function App\CPU\translate;
use App\Model\RefundRequest;
use App\CPU\ImageManager;
use App\Model\DeliveryMan;
use App\CPU\CustomerManager;

class OrderController extends Controller
{
    public function track_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'phone_number' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        return response()->json(OrderManager::track_order($request), 200);
    }
    public function order_cancel(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $order = Order::where(['id' => $request->order_id])->first();

        if ($order['payment_method'] == 'cash_on_delivery' && $order['order_status'] == 'pending') {
            OrderManager::stock_update_on_order_status_change($order, 'canceled');
            Order::where(['id' => $request->order_id])->update([
                'order_status' => 'canceled'
            ]);

            return response()->json(translate('order_canceled_successfully'), 200);
        }

        return response()->json(translate('status_not_changable_now'), 302);
    }
    public function place_order(Request $request)
    {
// $json = $request['cart'];
// return response()->json(['order_id'=>$json,translate('order_placed_successfully')], 200);
        // return response()->json([
        //     'message' => 'Order placed successfully!',
        //     'order' => $request['cart']
        // ], 200);
        // $unique_id = $request->user()->id . '-' . rand(000001, 999999) . '-' . time();
        $order_ids = [];
            $data = [
                'order_status' => 'pending',
                'order_type' => 'apps',
                'payment_status' => 'unpaid',
                'transaction_ref' => '',
                'request' => $request,
            ];


            $order_id = OrderManager::generate_order($data);

            // return response()->json($order_id, 200);
            array_push($order_ids, $order_id);
            // $url = "http://188.138.41.146:7788/sendtext";



            // $text="Your order Id  is $order_id Regards sajerbela.com";

            // $data= array(
            // 'username'=>"01977593593",
            // 'password'=>"Evertech@593",
            // 'number'=>"$number",
            // 'message'=>"$text"
            // );
            // $data= array(
            // 'apikey'=>"3d280e4da66f9c17",
            // 'secretkey'=>"b171edf5",
            // 'callerID'=>"sajerbela",
            // 'toUser'=>"01912872414",
            // 'messageContent'=>"$text"
            // );
            //  dd($data);

            // $ch = curl_init(); // Initialize cURL
            // curl_setopt($ch, CURLOPT_URL,$url);
            // curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            // $smsresult = curl_exec($ch);
            // $p = explode("|",$smsresult);
            // $sendstatus = $p[0];




        CartManager::cart_clean($request);

        return response()->json(['order_id'=>$order_id,translate('order_placed_successfully')], 200);
    }
    public function refund_request(Request $request)
    {
        $order_details = OrderDetail::find($request->order_details_id);

        $user = $request->user();


        $loyalty_point_status = Helpers::get_business_settings('loyalty_point_status');
        if($loyalty_point_status == 1)
        {
            $loyalty_point = CustomerManager::count_loyalty_point_for_amount($request->order_details_id);

            if($user->loyalty_point < $loyalty_point)
            {
                return response()->json(['message'=>translate('you have not sufficient loyalty point to refund this order!!')], 202);
            }
        }

        if($order_details->delivery_status == 'delivered')
        {
            $order = Order::find($order_details->order_id);
            $total_product_price = 0;
            $refund_amount = 0;
            $data = [];
            foreach ($order->details as $key => $or_d) {
                $total_product_price += ($or_d->qty*$or_d->price) + $or_d->tax - $or_d->discount;
            }

            $subtotal = ($order_details->price * $order_details->qty) - $order_details->discount + $order_details->tax;

            $coupon_discount = ($order->discount_amount*$subtotal)/$total_product_price;

            $refund_amount = $subtotal - $coupon_discount;

            $data['product_price'] = $order_details->price;
            $data['quntity'] = $order_details->qty;
            $data['product_total_discount'] = $order_details->discount;
            $data['product_total_tax'] = $order_details->tax;
            $data['subtotal'] = $subtotal;
            $data['coupon_discount'] = $coupon_discount;
            $data['refund_amount'] = $refund_amount;

            $refund_day_limit = Helpers::get_business_settings('refund_day_limit');
            $order_details_date = $order_details->created_at;
            $current = \Carbon\Carbon::now();
            $length = $order_details_date->diffInDays($current);
            $expired = false;
            $already_requested = false;
            if($order_details->refund_request != 0)
            {
                $already_requested = true;
            }
            if($length > $refund_day_limit )
            {
                $expired = true;
            }
            return response()->json(['already_requested'=>$already_requested,'expired'=>$expired,'refund'=>$data], 200);
        }else{
            return response()->json(['message'=>translate('You_can_request_for_refund_after_order_delivered')], 200);
        }

    }
    public function store_refund(Request $request)
    {

        $order_details = OrderDetail::find($request->order_details_id);

        $user = $request->user();


        $loyalty_point_status = Helpers::get_business_settings('loyalty_point_status');
        if($loyalty_point_status == 1)
        {
            $loyalty_point = CustomerManager::count_loyalty_point_for_amount($request->order_details_id);

            if($user->loyalty_point < $loyalty_point)
            {
                return response()->json(translate('you have not sufficient loyalty point to refund this order!!'), 200);
            }
        }

        if($order_details->refund_request == 0){

            $validator = Validator::make($request->all(), [
                'order_details_id' => 'required',
                'amount' => 'required',
                'refund_reason' => 'required'

            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => Helpers::error_processor($validator)], 403);
            }
            $refund_request = new RefundRequest;
            $refund_request->order_details_id = $request->order_details_id;
            $refund_request->customer_id = $request->user()->id;
            $refund_request->status = 'pending';
            $refund_request->amount = $request->amount;
            $refund_request->product_id = $order_details->product_id;
            $refund_request->order_id = $order_details->order_id;
            $refund_request->refund_reason = $request->refund_reason;

            if ($request->file('images')) {
                foreach ($request->file('images') as $img) {
                    $product_images[] = ImageManager::upload('refund/', 'png', $img);
                }
                $refund_request->images = json_encode($product_images);
            }
            $refund_request->save();

            $order_details->refund_request = 1;
            $order_details->save();

            return response()->json(translate('refunded_request_updated_successfully!!'), 200);
        }else{
            return response()->json(translate('already_applied_for_refund_request!!'), 302);
        }

    }
    public function refund_details(Request $request)
    {
        $order_details = OrderDetail::find($request->id);
        $refund = RefundRequest::where('customer_id',$request->user()->id)
                                ->where('order_details_id',$order_details->id )->get();
        $refund = $refund->map(function($query){
            $query['images'] = json_decode($query['images']);
            return $query;
        });

        $order = Order::find($order_details->order_id);

            $total_product_price = 0;
            $refund_amount = 0;
            $data = [];
            foreach ($order->details as $key => $or_d) {
                $total_product_price += ($or_d->qty*$or_d->price) + $or_d->tax - $or_d->discount;
            }

            $subtotal = ($order_details->price * $order_details->qty) - $order_details->discount + $order_details->tax;

            $coupon_discount = ($order->discount_amount*$subtotal)/$total_product_price;

            $refund_amount = $subtotal - $coupon_discount;

            $data['product_price'] = $order_details->price;
            $data['quntity'] = $order_details->qty;
            $data['product_total_discount'] = $order_details->discount;
            $data['product_total_tax'] = $order_details->tax;
            $data['subtotal'] = $subtotal;
            $data['coupon_discount'] = $coupon_discount;
            $data['refund_amount'] = $refund_amount;
            $data['refund_request']=$refund;

        // $refund = [
        //         "id"=> $refund->id,
        //         "order_details_id"=>$refund->order_details_id,
        //         "customer_id"=>$refund->customer_id,
        //         "status"=>$refund->status,
        //         "amount"=>$refund->amount,
        //         "product_id"=>$refund->product_id,
        //         "order_id"=>$refund->order_id,
        //         "refund_reason"=>$refund->refund_reason,
        //         "images"=>json_decode($refund->images),
        //         "created_at"=>$refund->created_at,
        //         "updated_at"=>$refund->updated_at,

        // ];
        return response()->json($data, 200);
    }
    public function getOrderDetails($order_id)
    {
        $order = Order::with('details')->find($order_id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        return response()->json([
            'order' => $order,
            'order_details' => $order->orderDetails
        ]);
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\CPU\BackEndHelper;
use App\CPU\Helpers;
use App\CPU\OrderManager;
use App\Http\Controllers\Controller;
use App\Model\Admin;
use App\Model\AdminWallet;
use App\Model\BusinessSetting;
use App\Model\DeliveryMan;
use App\Model\Order;
use App\Model\OrderDetail;
use App\Model\OrderExchange;
use App\Model\OrderExchangeDetail;
use App\Model\OrderTransaction;
use App\Model\OrderHistory;
use App\Model\Product;
use App\Model\Seller;
use App\User;
use App\Model\SellerWallet;
use App\Model\ShippingAddress;
use App\Model\ShippingMethod;
use App\Model\Courier;
use App\Model\Shop;
use Barryvdh\DomPDF\Facade as PDF;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use function App\CPU\translate;
use App\CPU\CustomerManager;
use App\CPU\Convert;
use Rap2hpoutre\FastExcel\FastExcel;

class OrderController extends Controller
{



    public function list(Request $request, $status)
    {
        $search = $request['search'];
        $from = $request['from'];
        $to = $request['to'];

        if (session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1) {
            $query = Order::whereHas('details', function ($query) {
                $query->whereHas('product', function ($query) {
                    $query->where('added_by', 'admin');
                });
            })->with(['customer']);

        if ($status != 'all') {
            $orders = Order::when(session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1,function($q){
                        $q->whereHas('details', function ($query) {
                    $query->whereHas('product', function ($query) {
                    $query->where('added_by', 'admin');
            });
        });
            })->with(['customer'])->where(function($query) use ($status){
                    $query->orWhere('order_status',$status)
                          ->orWhere('payment_status',$status);
                });
        } else {
                $orders = $query;
            }
        } else {
            if ($status != 'all') {
                $orders = Order::when(session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1,function($q){
                    $q->whereHas('details', function ($query) {
                $query->whereHas('product', function ($query) {
                $query->where('added_by', 'admin');
            });
        });
            })->with(['customer'])->where(function($query) use ($status){
                    $query->orWhere('order_status',$status)
                          ->orWhere('payment_status',$status);
                });
            } else {
                $orders = Order::with(['customer']);
            }
        }
        Order::where(['checked' => 0])->update(['checked' => 1]);

            $key = $request['search'] ? explode(' ', $request['search']) : '';
            $orders = $orders->when($request->has('search') && $search!=null,function ($q) use ($key) {
                $q->where(function($qq) use ($key){
                    foreach ($key as $value) {
                        $qq->where('id', 'like', "%{$value}%")
                            ->orWhere('order_status', 'like', "%{$value}%")
                            ->orWhere('transaction_ref', 'like', "%{$value}%");
                }});
                })->when(!empty($from) && !empty($to), function($dateQuery) use($from, $to) {
                    $dateQuery->whereDate('created_at', '>=',$from)
                                ->whereDate('created_at', '<=',$to);
                    });

        $orders = $orders->whereIn('order_type',['apps','default_type',])->orderBy('id','desc')->paginate(500)->appends(['search'=>$request['search'],'from'=>$request['from'],'to'=>$request['to']]);
        // dd($orders);
        return view('admin-views.order.list', compact('orders', 'search','from','to','status'));
    }



     public function detailsProduct($id)
    {
        $detailsProduct = OrderDetail::findOrFail($id);
        // dd($detailsProduct);
        return view('admin-views.order.order-details', compact('detailsProduct'));
    }


    public function ordersPrice(Request $request){

          $admin = Admin::find(auth('admin')->id());
        //  var_dump($orderDetailsInfo);
        //  exit();
          if($request->discount || $request->qty){

        $orderDetailsInfo = OrderDetail::findOrFail($request->id);
        $product = json_decode($orderDetailsInfo->product_details);
        $productName = $product->name;

         $oldPrice = ($orderDetailsInfo->price*$orderDetailsInfo->qty)-$orderDetailsInfo->discount;
         $newPrice = ($orderDetailsInfo->price*$request->qty)-BackEndHelper::currency_to_usd($request->discount);
         $discount = $request->discount-$orderDetailsInfo->discount;
         $orderDetailsInfo->discount = BackEndHelper::currency_to_usd($request->discount);
         $orderDetailsInfo->qty = $request->qty;
         $orderDetailsInfo->save();
         $orderInfo = Order::findOrFail($orderDetailsInfo->order_id);
         if($request->qty){
             $orderInfo->order_amount = ($orderInfo->order_amount-$oldPrice)+ $newPrice;
         }
         else{
              $orderInfo->order_amount = $orderInfo->order_amount-$discount;
         }
          $data = array(
             'order'=> $productName,
            'discount' => $discount,
        );

         $orderHistory = new OrderHistory;
         $orderHistory->order_id = $orderDetailsInfo->order_id;
         $orderHistory->created_by = $admin->name;
         $orderHistory->details = json_encode($data);
         $orderHistory->save();

         Toastr::success('Product Discount Update successfully!');

          }
        else{


              $orderInfo = Order::findOrFail($request->id);
              $orderInfo->shipping_amount = $request->shipping_amount;
               $data = array(
             'order'=> "Update Shipping Amount ".$request->shipping_amount,
            'discount' => "",
        );

         $orderHistory = new OrderHistory;
         $orderHistory->order_id = $orderInfo->id;
         $orderHistory->created_by = $admin->name;
         $orderHistory->details = json_encode($data);
         $orderHistory->save();
         Toastr::success('Shipping Amount Update successfully!');
        }


          $orderInfo->save();
        return redirect()->back();
    }


    public function Individual(Request $request,$status)
    {
         $search = $request['search'];
        $from = $request['from'];
        $to = $request['to'];

        if (session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1) {
            $query = Order::whereHas('details', function ($query) {
                $query->whereHas('product', function ($query) {
                    $query->where('added_by', 'admin');
                });
            })->with(['customer']);

        if ($status != 'all') {
            $orders = Order::when(session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1,function($q){
                        $q->whereHas('details', function ($query) {
                    $query->whereHas('product', function ($query) {
                    $query->where('added_by', 'admin');
            });
        });
            })->with(['customer'])->where(function($query) use ($status){
                    $query->orWhere('order_status',$status)
                          ->orWhere('payment_status',$status);
                });
        } else {
                $orders = $query;
            }
        } else {
            if ($status != 'all') {
                $orders = Order::when(session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1,function($q){
                    $q->whereHas('details', function ($query) {
                $query->whereHas('product', function ($query) {
                $query->where('added_by', 'admin');
            });
        });
            })->with(['customer'])->where(function($query) use ($status){
                    $query->orWhere('order_status',$status)
                          ->orWhere('payment_status',$status);
                });
            } else {
                $orders = Order::with(['customer']);
            }
        }
        Order::where(['checked' => 0])->update(['checked' => 1]);

            $key = $request['search'] ? explode(' ', $request['search']) : '';
            $orders = $orders->when($request->has('search') && $search!=null,function ($q) use ($key) {
                $q->where(function($qq) use ($key){
                    foreach ($key as $value) {
                        $qq->where('id', 'like', "%{$value}%")
                            ->orWhere('order_status', 'like', "%{$value}%")
                            ->orWhere('transaction_ref', 'like', "%{$value}%");
                }});
                })->when(!empty($from) && !empty($to), function($dateQuery) use($from, $to) {
                    $dateQuery->whereDate('created_at', '>=',$from)
                                ->whereDate('created_at', '<=',$to);
                    });

                     $OrderDetails=OrderDetail::with(['address','order'])->join('orders', 'orders.id', '=', 'order_details.order_id')->join('products', 'products.id', '=', 'order_details.product_id')->select('order_details.*','orders.customer_id','products.name','products.variation','products.purchase_price')->orderBy('id','desc')->paginate(Helpers::pagination_limit())->appends(['search'=>$request['search'],'from'=>$request['from'],'to'=>$request['to']]);

        $orders = $orders->where('order_type','default_type')->orderBy('id','desc')->paginate(Helpers::pagination_limit())->appends(['search'=>$request['search'],'from'=>$request['from'],'to'=>$request['to']]);
        // dd($OrderDetails);
        return view('admin-views.order.Individual', compact('orders','OrderDetails', 'search','from','to','status'));

    }

    public function details($id)
    {
        $order = Order::with('details', 'shipping', 'seller')->where(['id' => $id])->first();
            // dd($order);

        $shipping_method = Helpers::get_business_settings('shipping_method');
        $delivery_men = DeliveryMan::where('is_active', 1)->when($order->seller_is == 'admin', function ($query) {
            $query->where(['seller_id' => 0]);
        })->when($order->seller_is == 'seller' && $shipping_method == 'sellerwise_shipping', function ($query) use ($order) {
            $query->where(['seller_id' => $order['seller_id']]);
        })->when($order->seller_is == 'seller' && $shipping_method == 'inhouse_shipping', function ($query) use ($order) {
            $query->where(['seller_id' => 0]);
        })->get();
        $curiers = Courier::where('status',1)->get();


        $shipping_address = ShippingAddress::find($order->shipping_address);
         $orderHistories = OrderHistory::where('order_id',$id)->get();
        if($order->order_type == 'default_type' || $order->order_type == 'apps')
        {
            return view('admin-views.order.order-details', compact('shipping_address','order','delivery_men','orderHistories','curiers'));
        }else{
            return view('admin-views.pos.order.order-details', compact('order'));
        }

    }

    public function add_delivery_man($order_id, $delivery_man_id)
    {
        if ($delivery_man_id == 0) {
            return response()->json([], 401);
        }
        $order = Order::find($order_id);
        /*if($order->order_status == 'delivered' || $order->order_status == 'returned' || $order->order_status == 'failed' || $order->order_status == 'canceled' || $order->order_status == 'scheduled') {
            return response()->json(['status' => false], 200);
        }*/
        $order->delivery_man_id = $delivery_man_id;
        $order->delivery_type = 'self_delivery';
        $order->delivery_service_name = null;
        $order->third_party_delivery_tracking_id = null;
        $order->save();

        $fcm_token = $order->delivery_man->fcm_token;
        $value = Helpers::order_status_update_message('del_assign') . " ID: " . $order['id'];
        try {
            if ($value != null) {
                $data = [
                    'title' => translate('order'),
                    'description' => $value,
                    'order_id' => $order['id'],
                    'image' => '',
                ];
                Helpers::send_push_notif_to_device($fcm_token, $data);
            }
        } catch (\Exception $e) {
            Toastr::warning(\App\CPU\translate('Push notification failed for DeliveryMan!'));
        }

        return response()->json(['status' => true], 200);
    }

    public function status(Request $request)
    {
         $order = Order::with('customer')->where(['id' => $request->id])->first();

        //  return response()->json(['customer'=>$order],200);
        if(!isset($order->customer))
        {
            return response()->json(['customer_status'=>0],200);
        }

        $wallet_status = Helpers::get_business_settings('wallet_status');
        $loyalty_point_status = Helpers::get_business_settings('loyalty_point_status');

        if($request->order_status=='delivered' && $order->payment_status !='paid'){

            return response()->json(['payment_status'=>0],200);
        }
        $fcm_token = $order->customer->cm_firebase_token;
        $value = Helpers::order_status_update_message($request->order_status);
        $customerPhone =$order->customer->phone;
        $url = "http://188.138.41.146:7788/sendtext";
        if($request->order_status=='confirmed'){
            $orderAmount = BackEndHelper::usd_to_currency($order['order_amount']+$order['shipping_cost']);
            $text="Shoppingzonebd.com.bd order ".$order['id']." Confirmed Ready ".$orderAmount."Tk For Parcel Received";
            $data= array(
                'apikey'=>"1438fd77da6a0689",
                'secretkey'=>"d5ed7176",
                'callerID'=>"shoppingzonebd",
                'toUser'=>"$customerPhone",
                'messageContent'=>"$text"
                );
                //  dd($data);

                $ch = curl_init(); // Initialize cURL
                curl_setopt($ch, CURLOPT_URL,$url);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $smsresult = curl_exec($ch);
                $p = explode("|",$smsresult);
                $sendstatus = $p[0];
        }
        if($request->order_status=='canceled'){
            $hotLineNumber = Helpers::get_business_settings('company_hotline');
            $text="Your Order ".$order['id']." has been Cancelled, if you don't want to cancel then call ".$hotLineNumber." Shoppingzonebd.com.bd ";
            $data= array(
                'apikey'=>"1438fd77da6a0689",
                'secretkey'=>"d5ed7176",
                'callerID'=>"shoppingzonebd",
                'toUser'=>"$customerPhone",
                'messageContent'=>"$text"
                );
                //  dd($data);

                $ch = curl_init(); // Initialize cURL
                curl_setopt($ch, CURLOPT_URL,$url);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $smsresult = curl_exec($ch);
                $p = explode("|",$smsresult);
                $sendstatus = $p[0];
        }


        try {
            if ($value) {
                $data = [
                    'title' => translate('Order'),
                    'description' => $value,
                    'order_id' => $order['id'],
                    'image' => '',
                ];
                Helpers::send_push_notif_to_device($fcm_token, $data);
            }
        } catch (\Exception $e) {
        }


        try {
            $fcm_token_delivery_man = $order->delivery_man->fcm_token;
            if ($value != null) {
                $data = [
                    'title' => translate('order'),
                    'description' => $value,
                    'order_id' => $order['id'],
                    'image' => '',
                ];
                Helpers::send_push_notif_to_device($fcm_token_delivery_man, $data);
            }
        } catch (\Exception $e) {
        }

        $order->order_status = $request->order_status;
        $order->order_note = $request->note;

        OrderManager::stock_update_on_order_status_change($order, $request->order_status);
        $order->save();

        if($loyalty_point_status == 1)
        {
            if($request->order_status == 'delivered' && $order->payment_status =='paid'){
                CustomerManager::create_loyalty_point_transaction($order->customer_id, $order->id, Convert::default($order->order_amount-$order->shipping_cost), 'order_place');
            }
        }

        $transaction = OrderTransaction::where(['order_id' => $order['id']])->first();
        if (isset($transaction) && $transaction['status'] == 'disburse') {
            return response()->json($request->order_status);
        }

        if ($request->order_status == 'delivered' && $order['seller_id'] != null) {
            OrderManager::wallet_manage_on_order_status_change($order, 'admin');
            OrderDetail::where('order_id', $order->id)->update(
                ['delivery_status'=>'delivered']
            );
        }

        return response()->json($request->order_status);
    }

    public function payment_status(Request $request)
    {
        $order = Order::find($request->id);

            if(!isset($order->customer))
            {
                return response()->json(['customer_status'=>0],200);
            }

            $order = Order::find($request->id);
            $order->payment_status = $request->payment_status;
           $data = $order->save();
            return response()->json($data);

    }

    public function advance_payment(Request $request){
        $order = Order::findOrFail($request->id);
         $admin = Admin::findOrFail(auth('admin')->id());
        //   dd($order);
        if(BackEndHelper::usd_to_currency($order->order_amount+$order->shipping_cost)>$request->advance_payment){
            $order->advance_amount = $request->advance_payment;
         $order->advance_payment_method = $request->advance_payment_method;
         $order->save();
          $data = array(
             'order'=> 'Method:'.$request->advance_payment_method.', Advance: '.$request->advance_payment,
            'discount' => 0,
        );

         $orderHistory = new OrderHistory;
         $orderHistory->order_id = $order->id;
         $orderHistory->created_by = $admin->name;
         $orderHistory->details = json_encode($data);
         $orderHistory->save();
       Toastr::success(\App\CPU\translate('updated_successfully!'));
        }
        else{
             Toastr::warning(\App\CPU\translate('Advance Amount Not Possible yet!!!'));
        }

       return back();

    }

    public function generate_invoice($id)
    {
        $order = Order::with('seller')->with('shipping')->with('details')->where('id', $id)->first();
        $seller = Seller::find($order->details->first()->seller_id);
        $data["email"] = $order->customer !=null?$order->customer["email"]:\App\CPU\translate('email_not_found');
        $data["client_name"] = $order->customer !=null? $order->customer["f_name"] . ' ' . $order->customer["l_name"]:\App\CPU\translate('customer_not_found');
        $data["order"] = $order;
        return view('admin-views.order.invoice', compact('order'));
        $pdf = PDF::loadView('admin-views.order.invoice', $data);
        return $pdf->download($order->id . '.pdf');
        // $mpdf_view = View::make('admin-views.order.invoice')->with('order', $order)->with('seller', $seller);
        // Helpers::gen_mpdf($mpdf_view, 'order_invoice_', $order->id);
    }

    public function exchange_generate_invoice($id)
    {
        $order = OrderExchange::with('seller')->with('shipping')->with('exchangedetails')->where('id', $id)->first();
        $previousOrder = Order::with('seller')->with('shipping')->with('details')->where('id', $order->previous_order_id)->first();
        $seller = Seller::find($order->exchangedetails->first()->seller_id);
        $data["email"] = $order->customer !=null?$order->customer["email"]:\App\CPU\translate('email_not_found');
        $data["client_name"] = $order->customer !=null? $order->customer["f_name"] . ' ' . $order->customer["l_name"]:\App\CPU\translate('customer_not_found');
        $data["order"] = $order;
        $data["previousOrder"] = $previousOrder;
        return view('admin-views.order.exchange-invoice', compact('order','previousOrder'));
        $pdf = PDF::loadView('admin-views.order.exchange-invoice', $data);
        return $pdf->download($order->id . '.pdf');
        // $mpdf_view = View::make('admin-views.order.invoice')->with('order', $order)->with('seller', $seller);
        // Helpers::gen_mpdf($mpdf_view, 'order_invoice_', $order->id);
    }

    public function inhouse_order_filter()
    {
        if (session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1) {
            session()->put('show_inhouse_orders', 0);
        } else {
            session()->put('show_inhouse_orders', 1);
        }
        return back();
    }
    public function update_deliver_info(Request $request)
    {
        $order = Order::find($request->order_id);
        $order->delivery_type = 'third_party_delivery';
        $order->delivery_service_name = $request->delivery_service_name;
        $order->third_party_delivery_tracking_id = $request->third_party_delivery_tracking_id;
        $order->delivery_man_id = null;
        $order->save();

        Toastr::success(\App\CPU\translate('updated_successfully!'));
        return back();
    }

    public function bulk_export_data(Request $request, $status)
    {
        $from = $request['from'];
        $to = $request['to'];

        $orders = Order::with(['customer','shipping','shippingAddress','delivery_man','billingAddress'])
                        ->where('order_type', 'default_type')
                        ->when($status !='all', function($q) use($status){
                            $q->where(function($query) use ($status){
                                $query->orWhere('order_status',$status)
                                    ->orWhere('payment_status',$status);
                            });
                        })
                        ->when(session()->has('show_inhouse_orders') && session('show_inhouse_orders') == 1,function($q){
                            $q->whereHas('details', function ($query) {
                                $query->whereHas('product', function ($query) {
                                    $query->where('added_by', 'admin');
                                    });
                                });
                        })
                        ->when($from!=null && $to!=null,function($query) use($from,$to){
                            $query->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59']);
                        })->orderBy('id', 'DESC')->get();

        if ($orders->count()==0) {
            Toastr::warning(\App\CPU\translate('Data is Not available!!!'));
            return back();
        }

        $storage = array();

        foreach ($orders as $item) {

            $order_amount = $item->order_amount;
            $discount_amount = $item->discount_amount;
            $shipping_cost = $item->shipping_cost;
            $extra_discount = $item->extra_discount;

            $storage[] = [
                'order_id'=>$item->id,
                'Customer Id' => $item->customer_id,
                'Customer Name'=> isset($item->customer) ? $item->customer->f_name. ' '.$item->customer->l_name:'not found',
                'Order Group Id' => $item->order_group_id,
                'Order Status' => $item->order_status,
                'Order Amount' => Helpers::currency_converter($order_amount),
                'Order Type' => $item->order_type,
                'Coupon Code' => $item->coupon_code,
                'Discount Amount' => Helpers::currency_converter($discount_amount),
                'Discount Type' => $item->discount_type,
                'Extra Discount' => Helpers::currency_converter($extra_discount),
                'Extra Discount Type' => $item->extra_discount_type,
                'Payment Status' => $item->payment_status,
                'Payment Method' => $item->payment_method,
                'Transaction_ref' => $item->transaction_ref,
                'Verification Code' => $item->verification_code,
                'Billing Address' => isset($item->billingAddress)? $item->billingAddress->address:'not found',
                'Billing Address Data' => $item->billing_address_data,
                'Shipping Type' => $item->shipping_type,
                'Shipping Address' => isset($item->shippingAddress)? $item->shippingAddress->address:'not found',
                'Shipping Method Id' => $item->shipping_method_id,
                'Shipping Method Name' => isset($item->shipping)? $item->shipping->title:'not found',
                'Shipping Cost' => Helpers::currency_converter($shipping_cost),
                'Seller Id' => $item->seller_id,
                'Seller Name' => isset($item->seller)? $item->seller->f_name. ' '.$item->seller->l_name:'not found',
                'Seller Email'  => isset($item->seller)? $item->seller->email:'not found',
                'Seller Phone'  => isset($item->seller)? $item->seller->phone:'not found',
                'Seller Is' => $item->seller_is,
                'Shipping Address Data' => $item->shipping_address_data,
                'Delivery Type' => $item->delivery_type,
                'Delivery Man Id' => $item->delivery_man_id,
                'Delivery Service Name' => $item->delivery_service_name,
                'Third Party Delivery Tracking Id' => $item->third_party_delivery_tracking_id,
                'Checked' => $item->checked,

            ];
        }

        return (new FastExcel($storage))->download('Order_All_details.xlsx');


    }

}

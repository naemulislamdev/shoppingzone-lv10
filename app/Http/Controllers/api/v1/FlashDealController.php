<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\FlashDeal;
use App\Model\FlashDealProduct;
use App\Model\Product;
use App\campaing_detalie;
use Carbon\Carbon;
 

class FlashDealController extends Controller
{
    public function get_flash_deal()
    {
        try {
            $flash_deals = FlashDeal::where('deal_type','flash_deal')
                ->where(['status' => 1])
                ->whereDate('start_date', '<=', date('Y-m-d'))
                ->whereDate('end_date', '>=', date('Y-m-d'))->first();
            return response()->json($flash_deals, 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }

    }
    
     public function get_flash_deal_for_countdown()
    {
        try {
            $flash_deals = FlashDeal::where('deal_type','flash_deal')
                ->where(['status' => 1])->first();
            return response()->json($flash_deals, 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }

    }

    public function get_products($deal_id)
    {
        $p_ids = FlashDealProduct::with(['product'])
                                    ->whereHas('product',function($q){
                                        $q->active();
                                    })
                                    ->where(['flash_deal_id' => $deal_id])
                                    ->pluck('product_id')->toArray();

        if (count($p_ids) > 0) {
            return response()->json(Helpers::product_data_formatting(Product::with(['rating'])->whereIn('id', $p_ids)->get(), true), 200);
        }

        return response()->json([], 200);
    }
    
      public function get_products_for_flash_deal()
    {
        $flash_deals = FlashDeal::where('deal_type','flash_deal')
                ->where(['status' => 1])->first();
        $p_ids = FlashDealProduct::with(['product'])
                                    ->whereHas('product',function($q){
                                        $q->active();
                                    })
                                    ->where(['flash_deal_id' => $flash_deals->id])
                                    ->pluck('product_id')->toArray();

        if (count($p_ids) > 0) {
            return response()->json(Helpers::product_data_formatting(Product::with(['rating'])->whereIn('id', $p_ids)->get(), true), 200);
        }

        return response()->json([], 200);
    }
    
      public function campaing_products()
    {
        $todayDate=Carbon::today()->toDateString();
       
        $data = Product::join('campaing_detalies', 'campaing_detalies.product_id', '=', 'products.id')->where('campaing_detalies.start_day', $todayDate)
              		->select(['products.*','campaing_detalies.id', 'campaing_detalies.product_id','campaing_detalies.start_day', 'campaing_detalies.end_day', 'campaing_detalies.discountCam'])->get();
        return response()->json($data,200);
    }
      public function campaing_products_tomrrrow()
    {
         $tomrrrowDate=Carbon::tomorrow()->toDateString();
        $data = Product::join('campaing_detalies', 'campaing_detalies.product_id', '=', 'products.id')->where('campaing_detalies.start_day', $tomrrrowDate)
              		->select(['products.*','campaing_detalies.id','campaing_detalies.product_id','campaing_detalies.start_day', 'campaing_detalies.end_day', 'campaing_detalies.discountCam'])->get();
        return response()->json($data,200);
    }
}

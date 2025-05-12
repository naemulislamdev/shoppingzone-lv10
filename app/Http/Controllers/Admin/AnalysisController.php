<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class AnalysisController extends Controller
{
    public function analysisReport()
    {
        // $analysis_type = $request->get('analysis_type');
        // $data = [];

        // $apiArray = [
        //     'most_viewed_product' => 'https://ai.szbdfinancing.com/api/analysis/most-viewed/',
        //     'most_added_to_cart' => 'https://ai.szbdfinancing.com/api/analysis/most-added-to-cart/',
        //     'most_wishlisted_products' => 'https://ai.szbdfinancing.com/api/analysis/most-wishlisted/',
        //     'most_checked_out_products' => 'https://ai.szbdfinancing.com/api/analysis/most-checked-out/',
        //     'cart_abandonment_analysis' => 'https://ai.szbdfinancing.com/api/analysis/cart-abandonment/',
        //     'views_by_region' => 'https://ai.szbdfinancing.com/api/analysis/views-by-region/',
        //     'wishlist_to_purchase_conversion' => 'https://ai.szbdfinancing.com/api/analysis/wishlist-to-purchase/',
        //     'revenue_per_product' => 'https://ai.szbdfinancing.com/api/analysis/revenue-per-product/',
        //     'checkout_completion_rate' => 'https://ai.szbdfinancing.com/api/analysis/checkout-completion/',
        //     'app_vs_web' => 'https://ai.szbdfinancing.com/api/analysis/app-vs-web/',
        // ];

        // if ($analysis_type && $analysis_type !== 'all' && array_key_exists($analysis_type, $apiArray)) {
        //     $response = Http::get($apiArray[$analysis_type]);

        //     if ($response->successful()) {
        //         $data = $response->json();
        //     } else {
        //         $data['error'] = 'API request failed.';
        //     }
        // } elseif ($analysis_type && $analysis_type !== 'all') {
        //     $data['error'] = 'Invalid analysis type selected.';
        // }

        // one by one
        // $most_viewed_product = 'https://ai.szbdfinancing.com/api/analysis/most-viewed/';
        // $response = Http::get($most_viewed_product);

        // if ($response->successful()) {
        //     $data['most_viewed_product'] = $response->json()['most_viewed_product'] ?? [];
        // } else {
        //     $data['error'] = 'API request failed.';
        // }
        $most_added_to_cart = 'https://ai.szbdfinancing.com/api/analysis/most-added-to-cart/';
        $response = Http::get($most_added_to_cart);
        if ($response->successful()) {
            $data['most_added_to_cart'] = $response->json()['most_added_to_cart'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $most_wishlisted_products = 'https://ai.szbdfinancing.com/api/analysis/most-wishlisted/';
        $response = Http::get($most_wishlisted_products);
        if ($response->successful()) {
            $data['most_wishlisted_products'] = $response->json()['most_wishlisted_products'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $most_checked_out_products = 'https://ai.szbdfinancing.com/api/analysis/most-checked-out/';
        $response = Http::get($most_checked_out_products);
        if ($response->successful()) {
            $data['most_checked_out_products'] = $response->json()['most_checked_out_products'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $cart_abandonment_analysis = 'https://ai.szbdfinancing.com/api/analysis/cart-abandonment/';
        $response = Http::get($cart_abandonment_analysis);
        if ($response->successful()) {
            $data['cart_abandonment_analysis'] = $response->json()['cart_abandonment_analysis'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $views_by_region = 'https://ai.szbdfinancing.com/api/analysis/views-by-region/';
        $response = Http::get($views_by_region);
        if ($response->successful()) {
            $data['views_by_region'] = $response->json()['views_by_region'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $wishlist_to_purchase_conversion = 'https://ai.szbdfinancing.com/api/analysis/wishlist-to-purchase/';
        $response = Http::get($wishlist_to_purchase_conversion);
        if ($response->successful()) {
            $data['wishlist_to_purchase_conversion'] = $response->json()['wishlist_to_purchase_conversion'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $revenue_per_product = 'https://ai.szbdfinancing.com/api/analysis/revenue-per-product/';
        $response = Http::get($revenue_per_product);
        if ($response->successful()) {
            $data['revenue_per_product'] = $response->json()['revenue_per_product'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $checkout_completion_rate = 'https://ai.szbdfinancing.com/api/analysis/checkout-completion/';
        $response = Http::get($checkout_completion_rate);
        if ($response->successful()) {
            $data['checkout_completion_rate'] = $response->json()['checkout_completion_rate'] ?? [];
        } else {
            $data['error'] = 'API request failed.';
        }
        $app_vs_web = 'https://ai.szbdfinancing.com/api/analysis/app-vs-web/';
        $response = Http::get($app_vs_web);
        if ($response->successful()) {
            $data['app_vs_web'] = $response->json();
            //dd($data['app_vs_web']);
        } else {
            $data['error'] = 'API request failed.';
        }

        return view('admin-views.analysis-report.report', compact('data'));
    }
}

<?php

use App\Http\Controllers\api\v1\AttributeController;
use App\Http\Controllers\api\v1\auth\EmailVerificationController;
use App\Http\Controllers\api\v1\auth\ForgotPassword;
use App\Http\Controllers\api\v1\auth\PassportAuthController;
use App\Http\Controllers\api\v1\auth\PhoneVerificationController;
use App\Http\Controllers\api\v1\auth\SocialAuthController;
use App\Http\Controllers\api\v1\BannerController;
use App\Http\Controllers\api\v1\BrandController;
use App\Http\Controllers\api\v1\CartController;
use App\Http\Controllers\api\v1\CategoryController;
use App\Http\Controllers\api\v1\ChatController;
use App\Http\Controllers\api\v1\ConfigController;
use App\Http\Controllers\api\v1\CouponController;
use App\Http\Controllers\api\v1\CustomerController;
use App\Http\Controllers\api\v1\DealController;
use App\Http\Controllers\api\v1\DealOfTheDayController;
use App\Http\Controllers\api\v1\FlashDealController;
use App\Http\Controllers\api\v1\GeneralController;
use App\Http\Controllers\api\v1\LandingPagesController;
use App\Http\Controllers\api\v1\MapApiController;
use App\Http\Controllers\api\v1\NotificationController;
use App\Http\Controllers\api\v1\OrderController;
use App\Http\Controllers\api\v1\ProductController;
use App\Http\Controllers\api\v1\SellerController;
use App\Http\Controllers\api\v1\ShippingMethodController;
use App\Http\Controllers\api\v1\UserLoyaltyController;
use App\Http\Controllers\api\v1\UserWalletController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::middleware(['api_lang'])->prefix('v1')->group(function () {

    Route::prefix('auth')->group(function () {
        Route::post('register', [PassportAuthController::class, 'register']);
        Route::post('login', [PassportAuthController::class, 'login']);
        Route::post('sendOtp', [PassportAuthController::class, 'sendOtp'])->name('sendOtp');
        Route::get('recivedotp', [PassportAuthController::class, 'recivedOTP'])->name('recivedotp');

        Route::post('check-phone', [PhoneVerificationController::class, 'check_phone']);
        Route::post('verify-phone', [PhoneVerificationController::class, 'verify_phone']);

        Route::post('check-email', [EmailVerificationController::class, 'check_email']);
        Route::post('verify-email', [EmailVerificationController::class, 'verify_email']);

        Route::post('forgot-password', [ForgotPassword::class, 'reset_password_request']);
        Route::post('verify-otp', [ForgotPassword::class, 'otp_verification_submit']);
        Route::put('reset-password', [ForgotPassword::class, 'reset_password_submit']);

        Route::any('social-login', [SocialAuthController::class, 'social_login']);
        Route::post('update-phone', [SocialAuthController::class, 'update_phone']);
    });

    Route::prefix('config')->group(function () {
        Route::get('/', [ConfigController::class, 'configuration']);
    });

    Route::controller(ShippingMethodController::class)->prefix('shipping-method')->middleware(['auth:api'])->group(function () {
        Route::get('detail/{id}', 'get_shipping_method_info');
        Route::get('by-seller/{id}/{seller_is}', 'shipping_methods_by_seller');
        Route::post('choose-for-order', 'choose_for_order');
        Route::get('chosen', 'chosen_shipping_methods');
        Route::get('check-shipping-type', 'check_shipping_type');
    });

    Route::controller(CartController::class)->middleware(['auth:api'])->prefix('cart')->group(function () {
        Route::get('/', 'cart');
        Route::post('cartAdd', 'cart_to_db_api');
        Route::post('addCart', 'addCart');
        Route::get('allCart', 'cartView');
        Route::get('cart', 'cartGroupId');
        Route::post('add', 'add_to_cart');

        Route::put('update', 'update_cart');
        Route::delete('remove', 'remove_from_cart');
        Route::delete('Cartremove/{id}', 'Cartremove_from_cart');
        Route::delete('remove-all', 'remove_all_from_cart');
    });
    Route::controller(GeneralController::class)->group(function(){
        Route::get('faq', 'faq');
        Route::get('company-info', 'conpanyInfo');
        Route::get('company-phone', 'conpanyInfo1');
        Route::get('company-name', 'conpanyInfo2');
        Route::get('company-email', 'conpanyInfo3');
        Route::get('company-footer-logo', 'conpanyInfo4');
        Route::get('company-copyright-text', 'conpanyInfo5');
        Route::get('company-about', 'conpanyInfo6');
        Route::get('company-address', 'conpanyInfo7');
        Route::get('SocialMedia', 'SocialMedia1');
        Route::get('facebookPost', 'facebookPost');
        Route::get('metaTitle', 'metaTitle');
        Route::get('terms-condition', 'terms_condition');
        Route::get('privacy-policy', 'privacy_policy');
    });


    Route::controller(ProductController::class)->prefix('products')->group(function () {
        Route::get('all-products', 'allProducts');
        Route::get('latest', 'get_latest_products');
        Route::get('latestWeb', 'get_latestWeb_products');
        Route::get('featured', 'get_featured_products');
        Route::get('featuredWeb', 'get_featuredWeb_products');
        Route::get('top-rated', 'get_top_rated_products');
        Route::get('search/{key}', 'get_searched_products');
        Route::any('Appsearch', 'get_Appsearch_products');
        Route::post('searchPrice', 'price_reanges');
        Route::get('colorSearch/{key}', 'colorSearch');
        Route::get('Color', 'Color');
        Route::get('details/{slug}', 'get_product');
        Route::get('discount/details/{slug}/{id}', 'get_product_discount');
        Route::get('related-products/{product_id}', 'get_related_products');
        Route::get('reviews/{product_id}', 'get_product_reviews');
        Route::get('rating/{product_id}', 'get_product_rating');
        Route::get('counter/{product_id}', 'counter');
        Route::get('shipping-methods', 'get_shipping_methods');
        Route::get('shipping-methods/{id}', 'get_shipping_methods_id');
        Route::get('social-share-link/{product_id}', 'social_share_link');
        Route::post('reviews/submit', 'submit_product_review')->middleware('auth:api');
        Route::get('best-sellings', 'get_best_sellings');
        Route::get('video-shopping', 'get_video_shopping');
        Route::get('home-categories', 'get_home_categories');
        Route::get('discounted-product', 'get_discounted_product');
        // ProductCampaing
        Route::delete('CampaingDelete', 'CampaingDelete');
    });

    Route::prefix('notifications')->group(function () {
        Route::get('/', [NotificationController::class, 'get_notifications']);
    });

    Route::controller(BrandController::class)->prefix('brands')->group(function () {
        Route::get('/', 'get_brands');
        Route::get('products/{brand_id}', 'get_products');
    });

    Route::prefix('attributes')->group(function () {
        Route::get('/', [AttributeController::class,'get_attributes']);
    });

    Route::controller(FlashDealController::class)->prefix('flash-deals')->group(function () {
        Route::get('/', 'get_flash_deal');
        Route::get('products/{deal_id}', 'get_products');
        Route::get('flash-deal-products', 'get_products_for_flash_deal');
        Route::get('campaing-products', 'campaing_products');
        Route::get('campaing-products-tomrrrow', 'campaing_products_tomrrrow');
        Route::get('countdown', 'get_flash_deal_for_countdown');
    });

    Route::prefix('deals')->group(function () {
        Route::get('featured', [DealController::class,'get_featured_deal']);
    });

    Route::prefix('dealsoftheday')->group(function () {
        Route::get('deal-of-the-day', [DealOfTheDayController::class,'get_deal_of_the_day_product']);
    });

    Route::controller(CategoryController::class)->prefix('categories')->group(function () {
        Route::get('/', 'get_categories');
        Route::get('/{category_id}', 'get_subcategories');
        Route::get('products/{category_id}', 'get_products');
        Route::get('products_slug/{category_slug}', 'get_products_slug');
    });

    Route::middleware(['auth:api'])->prefix('customer')->group(function () {
        Route::get('info', [CustomerController::class,'info']);
        Route::put('update-profile', [CustomerController::class,'update_profile']);
        Route::put('cm-firebase-token', [CustomerController::class,'update_cm_firebase_token']);
        Route::get('account-delete/{id}', [CustomerController::class,'account_delete']);

        Route::controller(CustomerController::class)->prefix('address')->group(function () {
            Route::get('list', 'address_list');
            Route::post('add', 'add_new_address');
            Route::delete('/', 'delete_address');
        });

        Route::controller(CustomerController::class)->prefix('support-ticket')->group(function () {
            Route::post('create', 'create_support_ticket');
            Route::get('get', 'get_support_tickets');
            Route::get('conv/{ticket_id}', 'get_support_ticket_conv');
            Route::post('reply/{ticket_id}', 'reply_support_ticket');
        });

        Route::controller(CustomerController::class)->prefix('wish-list')->group(function () {
            Route::get('/', 'wish_list');
            Route::post('add', 'add_to_wishlist');
            Route::delete('remove', 'remove_from_wishlist');
        });

        Route::middleware(['auth:api'])->prefix('order')->group(function () {
            Route::get('list', [CustomerController::class,'get_order_list']);
            Route::get('list-last', [CustomerController::class,'get_order_list_last']);
            Route::get('details', [CustomerController::class,'get_order_details']);
            Route::post('place', [OrderController::class,'place_order']);
            Route::get('refund', [OrderController::class,'refund_request']);
            Route::post('refund-store', [OrderController::class,'store_refund']);
            Route::get('refund-details', [OrderController::class,'refund_details']);
        });
        Route::prefix('order')->group(function () {
            Route::get('list', [CustomerController::class,'get_order_list']);
            Route::get('list-last', [CustomerController::class,'get_order_list_last']);
            Route::get('details', [CustomerController::class,'get_order_details']);
            Route::post('place', [OrderController::class,'place_order']);
            Route::get('refund', [OrderController::class,'refund_request']);
            Route::post('refund-store', [OrderController::class,'store_refund']);
            Route::get('refund-details', [OrderController::class,'refund_details']);
        });
        // Chatting
        Route::controller(ChatController::class)->prefix('chat')->group(function () {
            Route::get('/', 'chat_with_seller');
            Route::get('messages', 'messages');
            Route::get('send-message', 'messages_store');
        });

        //wallet
        Route::prefix('wallet')->group(function () {
            Route::get('list', [UserWalletController::class,'list']);
        });
        //loyalty
        Route::controller(UserLoyaltyController::class)->prefix('loyalty')->group(function () {
            Route::get('list', 'list');
            Route::post('loyalty-exchange-currency', 'loyalty_exchange_currency');
        });
    });
    Route::prefix('order')->group(function () {
        Route::post('place', [OrderController::class,'place_order']);
    });

    Route::prefix('order')->group(function () {
        Route::get('track', [OrderController::class,'track_order']);
        Route::get('cancel-order', [OrderController::class,'order_cancel']);
    });

    Route::controller(BannerController::class)->prefix('banners')->group(function () {
        Route::get('/', 'get_banners');
        Route::get('old/', 'get_banners_old');
    });

    Route::controller(SellerController::class)->prefix('seller')->group(function () {
        Route::get('/', 'get_seller_info');
        Route::get('{seller_id}/products', 'get_seller_products');
        Route::get('{seller_id}/all-products', 'get_seller_all_products');
        Route::get('top', 'get_top_sellers');
        Route::get('all', 'get_all_sellers');
    });

    Route::middleware(['auth:api'])->prefix('coupon')->group(function () {
        Route::get('apply', [CouponController::class, 'apply']);
    });
    Route::get('coupon-list', [CouponController::class, 'couponList']);

    Route::prefix('landingpages')->group(function () {
        Route::get('landing-view', [LandingPagesController::class, 'landing_view']);
        Route::get('/{landing_slug}', [LandingPagesController::class, 'landpagesdeal']);
    });


    //map api
    Route::controller(MapApiController::class)->prefix('mapapi')->group(function () {
        Route::get('place-api-autocomplete', 'place_api_autocomplete');
        Route::get('distance-api', 'distance_api');
        Route::get('place-api-details', 'place_api_details');
        Route::get('geocode-api', 'geocode_api');
    });
});

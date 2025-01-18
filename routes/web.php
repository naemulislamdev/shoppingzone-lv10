<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

use App\Http\Controllers\ComplainController;
use App\Http\Controllers\Seller\Auth\RegisterController;
use App\Http\Controllers\Web\CartController;
use App\Http\Controllers\Web\ChattingController;
use App\Http\Controllers\Web\CouponController;
use App\Http\Controllers\Web\CurrencyController;
use App\Http\Controllers\Web\ReviewController;
use App\Http\Controllers\Web\UserLoyaltyController;
use App\Http\Controllers\Web\UserProfileController;
use App\Http\Controllers\Web\UserWalletController;
use App\Http\Controllers\Web\WebController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Mail;

//for maintenance mode
Route::get('maintenance-mode', 'Web\WebController@maintenance_mode')->name('maintenance-mode');
Route::get('/complain', [ComplainController::class,'customerComplain'])->name('customer.complain');

Route::post('/complain/store', [ComplainController::class,'customerComplainStore'])->name('customer.complain.store');

Route::middleware(['maintenance_mode'])->group(function () {

    Route::controller(WebController::class)->group(function () {
        Route::get('/', 'home')->name('home');
        Route::get('/category', 'category')->name('category');
        Route::get('/product-details', 'productDeails')->name('product.details');
        Route::get('/shop', 'shop')->name('shop');
        Route::get('/outlets', 'outlets')->name('outlets');
        Route::get('/shop-cart', 'shop_cart')->name('shop-cart');
        Route::get('/selling-product', 'sellingProducts')->name('selling.product');
        Route::post('/client-review', 'clientReview')->name('client_review');
    });

    // Route::get('quick-view', 'WebController@quick_view')->name('quick-view');
    // Route::get('searched-products', 'WebController@searched_products')->name('searched-products');

    Route::controller(WebController::class)->middleware(['customer'])->group(function () {
        Route::get('checkout-shipping', 'checkout_shipping')->name('checkout-shipping');
        Route::get('checkout-payment', 'checkout_payment')->name('checkout-payment');
        Route::get('checkout-review', 'checkout_review')->name('checkout-review');
        Route::get('checkout-complete', 'checkout_complete')->name('checkout-complete');
        Route::get('order-placed', 'order_placed')->name('order-placed');
        Route::post('order_note', 'order_note')->name('order_note');
    });

    //wallet payment
    Route::controller(WebController::class)->group(function () {
        Route::get('checkout-complete-wallet', 'checkout_complete_wallet')->name('checkout-complete-wallet');

        Route::post('subscription', 'subscription')->name('subscription');
        Route::get('search-shop', 'search_shop')->name('search-shop');

        Route::get('categories', 'all_categories')->name('categories');
        Route::get('category-ajax/{id}', 'categories_by_category')->name('category-ajax');

        Route::get('brands', 'all_brands')->name('brands');
        Route::get('sellers', 'all_sellers')->name('sellers');
        Route::get('seller-profile/{id}', 'seller_profile')->name('seller-profile');

        Route::get('flash-deals/{id}', 'flash_deals')->name('flash-deals');
        Route::get('terms', 'termsandCondition')->name('terms');
        Route::get('privacy-policy', 'privacy_policy')->name('privacy-policy');

        Route::get('/video-shopping', 'videoShopping')->name('video_shopping');
        Route::get('/campaign', 'campaing_products')->name('campain');
        Route::get('/product/{slug}', 'product')->name('product');
        Route::get('products', 'products')->name('products');
        Route::get('orderDetails', 'orderdetails')->name('orderdetails');
        Route::get('discounted-products', 'discounted_products')->name('discounted-products');
        Route::get('/product_search', 'searchProducts')->name('product_search');


        Route::post('review-list-product', 'review_list_product')->name('review-list-product');
        //Chat with seller from product details
        Route::get('chat-for-product', 'chat_for_product')->name('chat-for-product');

        Route::get('wishlists', 'viewWishlist')->name('wishlists')->middleware('customer');
        Route::post('store-wishlist', 'storeWishlist')->name('store-wishlist');
        Route::post('delete-wishlist', 'deleteWishlist')->name('delete-wishlist');
        Route::get('about-us', 'about_us')->name('about-us');
        //FAQ route
        Route::get('helpTopic', 'helpTopic')->name('helpTopic');
        //Contacts
        Route::get('contacts', 'contacts')->name('contacts');

        //sellerShop
        Route::get('shopView/{id}', 'seller_shop')->name('shopView');
        Route::post('shopView/{id}', 'seller_shop_product');

        //top Rated
        Route::get('top-rated', 'top_rated')->name('topRated');
        Route::get('best-sell', 'best_sell')->name('bestSell');
        Route::get('new-product', 'new_product')->name('newProduct');
    });

    Route::post('/currency', [CurrencyController::class,'changeCurrency'])->name('currency.change');

    //profile Route
    Route::controller(UserProfileController::class)->group(function () {
        Route::get('user-account', 'user_account')->name('user-account');
        Route::post('user-account-update', 'user_update')->name('user-update');
        Route::post('user-account-picture', 'user_picture')->name('user-picture');
        Route::get('account-address', 'account_address')->name('account-address');
        Route::post('account-address-store', 'address_store')->name('address-store');
        Route::get('account-address-delete', 'address_delete')->name('address-delete');
        ROute::get('account-address-edit/{id}', 'address_edit')->name('address-edit');
        Route::post('account-address-update', 'address_update')->name('address-update');
        Route::get('account-payment', 'account_payment')->name('account-payment');
        Route::get('account-oder', 'account_oder')->name('account-oder');
        Route::get('account-order-details', 'account_order_details')->name('account-order-details')->middleware('customer');
        Route::get('generate-invoice/{id}', 'generate_invoice')->name('generate-invoice');
        Route::get('account-wishlist', 'account_wishlist')->name('account-wishlist'); //add to card not work
        Route::get('refund-request/{id}', 'refund_request')->name('refund-request');
        Route::get('refund-details/{id}', 'refund_details')->name('refund-details');
        Route::get('submit-review/{id}', 'submit_review')->name('submit-review');
        Route::post('refund-store', 'store_refund')->name('refund-store');
        Route::get('account-tickets', 'account_tickets')->name('account-tickets');
        Route::get('order-cancel/{id}', 'order_cancel')->name('order-cancel');
        Route::post('ticket-submit', 'ticket_submit')->name('ticket-submit');
        Route::get('account-delete/{id}', 'account_delete')->name('account-delete');
        Route::get('account-logout', 'accountLogout')->name('account-logout');
    });
    // Chatting start
    Route::get('chat-with-seller', [ChattingController::class, 'chat_with_seller'])->name('chat-with-seller');
    Route::get('messages', [ChattingController::class, 'messages'])->name('messages');
    Route::post('messages-store', [ChattingController::class, 'messages_store'])->name('messages_store');
    // chatting end

    //Support Ticket
    Route::controller(UserProfileController::class)->prefix('/support-ticket')->as('support-ticket.')->group(function () {
        Route::get('{id}', 'single_ticket')->name('index');
        Route::post('{id}', 'comment_submit')->name('comment');
        Route::get('delete/{id}', 'support_ticket_delete')->name('delete');
        Route::get('close/{id}', 'support_ticket_close')->name('close');
    });

    Route::get('account-transaction', [UserProfileController::class, 'account_transaction'])->name('account-transaction');
    Route::get('account-wallet-history', [UserProfileController::class, 'account_wallet_history'])->name('account-wallet-history');

    Route::post('review', [ReviewController::class, 'store'])->name('review.store');

    Route::get('wallet', [UserWalletController::class, 'index'])->name('wallet');
    Route::get('loyalty', [UserLoyaltyController::class, 'index'])->name('loyalty');
    Route::post('loyalty-exchange-currency', [UserLoyaltyController::class, 'loyalty_exchange_currency'])->name('loyalty-exchange-currency');

    Route::controller(UserProfileController::class)->prefix('/track-order')->as('track-order.')->group(function () {
        Route::get('', 'track_order')->name('index');
        Route::get('result-view', 'track_order_result')->name('result-view');
        Route::get('last', 'track_last_order')->name('last');
        Route::any('result', 'track_order_result')->name('result');
    });


    Route::group(['prefix' => 'contact', 'as' => 'contact.'], function () {
        Route::post('store', [WebController::class,'contact_store'])->name('store');
        Route::get('/code/captcha/{tmp}', [WebController::class,'captcha'])->name('default-captcha');
    });

});

//Seller shop apply
Route::controller(RegisterController::class)->prefix('/shop')->as('shop.')->group(function () {
    Route::get('apply', 'create')->name('apply');
    Route::post('apply', 'store');
});

//check done
Route::controller(CartController::class)->prefix('/cart')->as('cart.')->group(function () {
    Route::post('variant_price', 'variant_price')->name('variant_price');
    Route::post('/add-product', 'addToCartOnSession')->name('add');
    Route::post('/remove', 'removeFromCart')->name('remove');
    Route::post('/nav-cart-items', 'updateNavCart')->name('nav_cart');
    Route::post('total-cart-count', 'totalCartCount')->name('totalCart');
    Route::post('/updateQuantity', 'updateQuantity')->name('updateQuantity');
    // In web.php
    // Route::post('/add-to-cart', 'CartController@addToCart')->name('add.to.cart');

});

//Seller shop apply
Route::controller(CouponController::class)->prefix('/coupon')->as('coupon.')->group(function () {
    Route::post('apply', 'apply')->name('apply');
});
//check done

// SSLCOMMERZ Start
/*Route::get('/example1', 'SslCommerzPaymentController@exampleEasyCheckout');
Route::get('/example2', 'SslCommerzPaymentController@exampleHostedCheckout');*/
Route::post('pay-ssl', 'SslCommerzPaymentController@index');
Route::post('/success', 'SslCommerzPaymentController@success')->name('ssl-success');
Route::post('/fail', 'SslCommerzPaymentController@fail')->name('ssl-fail');
Route::post('/cancel', 'SslCommerzPaymentController@cancel')->name('ssl-cancel');
Route::post('/ipn', 'SslCommerzPaymentController@ipn')->name('ssl-ipn');
//SSLCOMMERZ END

/*paypal*/
/*Route::get('/paypal', function (){return view('paypal-test');})->name('paypal');*/
Route::post('pay-paypal', 'PaypalPaymentController@payWithpaypal')->name('pay-paypal');
Route::get('paypal-status', 'PaypalPaymentController@getPaymentStatus')->name('paypal-status');
Route::get('paypal-success', 'PaypalPaymentController@success')->name('paypal-success');
Route::get('paypal-fail', 'PaypalPaymentController@fail')->name('paypal-fail');
/*paypal*/

/*Route::get('stripe', function (){
return view('stripe-test');
});*/
Route::get('pay-stripe', 'StripePaymentController@payment_process_3d')->name('pay-stripe');
Route::get('pay-stripe/success', 'StripePaymentController@success')->name('pay-stripe.success');
Route::get('pay-stripe/fail', 'StripePaymentController@success')->name('pay-stripe.fail');

// Get Route For Show Payment razorpay Form
Route::get('paywithrazorpay', 'RazorPayController@payWithRazorpay')->name('paywithrazorpay');
Route::post('payment-razor', 'RazorPayController@payment')->name('payment-razor');
Route::post('payment-razor/payment2', 'RazorPayController@payment_mobile')->name('payment-razor.payment2');
Route::get('payment-razor/success', 'RazorPayController@success')->name('payment-razor.success');
Route::get('payment-razor/fail', 'RazorPayController@success')->name('payment-razor.fail');

Route::get('payment-success', 'Customer\PaymentController@success')->name('payment-success');
Route::get('payment-fail', 'Customer\PaymentController@fail')->name('payment-fail');


//senang pay
Route::match(['get', 'post'], '/return-senang-pay', 'SenangPayController@return_senang_pay')->name('return-senang-pay');

//paystack
Route::post('/paystack-pay', 'PaystackController@redirectToGateway')->name('paystack-pay');
Route::get('/paystack-callback', 'PaystackController@handleGatewayCallback')->name('paystack-callback');
Route::get('/paystack', function () {
    return view('paystack');
});

// paymob
Route::post('/paymob-credit', 'PaymobController@credit')->name('paymob-credit');
Route::get('/paymob-callback', 'PaymobController@callback')->name('paymob-callback');


//paytabs
Route::any('/paytabs-payment', 'PaytabsController@payment')->name('paytabs-payment');
Route::any('/paytabs-response', 'PaytabsController@callback_response')->name('paytabs-response');

//bkash
Route::group(['prefix' => 'bkash'], function () {
    // Payment Routes for bKash
    Route::post('get-token', 'BkashPaymentController@getToken')->name('bkash-get-token');
    Route::post('create-payment', 'BkashPaymentController@createPayment')->name('bkash-create-payment');
    Route::post('execute-payment', 'BkashPaymentController@executePayment')->name('bkash-execute-payment');
    Route::get('query-payment', 'BkashPaymentController@queryPayment')->name('bkash-query-payment');
    Route::post('success', 'BkashPaymentController@bkashSuccess')->name('bkash-success');

    // Refund Routes for bKash
    Route::get('refund', 'BkashRefundController@index')->name('bkash-refund');
    Route::post('refund', 'BkashRefundController@refund')->name('bkash-refund');
});

//fawry
Route::get('/fawry', 'FawryPaymentController@index')->name('fawry');
Route::any('/fawry-payment', 'FawryPaymentController@payment')->name('fawry-payment');

// The callback url after a payment
Route::get('mercadopago/home', 'MercadoPagoController@index')->name('mercadopago.index');
Route::post('mercadopago/make-payment', 'MercadoPagoController@make_payment')->name('mercadopago.make_payment');
Route::get('mercadopago/get-user', 'MercadoPagoController@get_test_user')->name('mercadopago.get-user');

// The route that the button calls to initialize payment
Route::post('/flutterwave-pay', 'FlutterwaveController@initialize')->name('flutterwave_pay');
// The callback url after a payment
Route::get('/rave/callback', 'FlutterwaveController@callback')->name('flutterwave_callback');

// The callback url after a payment PAYTM
Route::get('paytm-payment', 'PaytmController@payment')->name('paytm-payment');
Route::any('paytm-response', 'PaytmController@callback')->name('paytm-response');

// The callback url after a payment LIQPAY
Route::get('liqpay-payment', 'LiqPayController@payment')->name('liqpay-payment');
Route::any('liqpay-callback', 'LiqPayController@callback')->name('liqpay-callback');

Route::get('/test', function () {
    $product = \App\Model\Product::find(116);
    $quantity = 6;
    return view('seller-views.product.barcode-pdf', compact('product', 'quantity'));
});

Route::get('/page/{slug}', [WebController::class,'signleProductLandingPage'])->name('signle.landing_page');
Route::get('/{slug}', [WebController::class,'landingPage'])->name('landing_page');


require __DIR__.'/auth.php';

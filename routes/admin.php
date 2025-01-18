<?php

use App\Http\Controllers\Admin\AttributeController;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\BranchController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\BusinessSettingsController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CategoryShippingCostController;
use App\Http\Controllers\Admin\ComplainAdminController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\CouponController;
use App\Http\Controllers\Admin\CourierController;
use App\Http\Controllers\Admin\CurrencyController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\CustomerLoyaltyController;
use App\Http\Controllers\Admin\CustomerWalletController;
use App\Http\Controllers\Admin\CustomRoleController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\DatabaseSettingController;
use App\Http\Controllers\Admin\DealController;
use App\Http\Controllers\Admin\DeliveryManController;
use App\Http\Controllers\Admin\EmployeeController;
use App\Http\Controllers\Admin\EnvironmentSettingsController;
use App\Http\Controllers\Admin\FileManagerController;
use App\Http\Controllers\Admin\HelpTopicController;
use App\Http\Controllers\Admin\InhouseProductSaleController;
use App\Http\Controllers\Admin\LandingPagesController;
use App\Http\Controllers\Admin\LanguageController;
use App\Http\Controllers\Admin\MailController;
use App\Http\Controllers\Admin\NotificationController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\OrderSettingsController;
use App\Http\Controllers\Admin\PaymentMethodController;
use App\Http\Controllers\Admin\POSController;
use App\Http\Controllers\Admin\PosPaymentTypeController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProductStockReportController;
use App\Http\Controllers\Admin\ProductWishlistReportController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\RefundController;
use App\Http\Controllers\Admin\RefundTransactionController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\ReviewsController;
use App\Http\Controllers\Admin\SellerController;
use App\Http\Controllers\Admin\SellerProductSaleReportController;
use App\Http\Controllers\Admin\ShippingMethodController;
use App\Http\Controllers\Admin\ShippingTypeController;
use App\Http\Controllers\Admin\ShipRocketController;
use App\Http\Controllers\Admin\SiteMapController;
use App\Http\Controllers\Admin\SMSModuleController;
use App\Http\Controllers\Admin\SocialPageController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\Admin\SubSubCategoryController;
use App\Http\Controllers\Admin\SupportTicketController;
use App\Http\Controllers\Admin\SystemController;
use App\Http\Controllers\Admin\TransactionController;
use App\Http\Controllers\Admin\WithdrawController;
use Illuminate\Support\Facades\Route;

Route::prefix('/admin')->as('admin.')->group(function () {

    Route::get('/', function () {
        return redirect()->route('admin.auth.login');
    });

    /*authentication*/
    Route::controller(LoginController::class)->prefix('/auth')->as('auth.')->group(function () {
        Route::get('/code/captcha/{tmp}', 'captcha')->name('default-captcha');
        Route::get('login', 'login')->name('login');
        Route::post('login', 'submit')->middleware('actch');
        Route::get('logout', 'logout')->name('logout');
    });

    /*authenticated*/
    Route::middleware('admin')->group(function () {

        //dashboard routes
        Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard'); //previous dashboard route
        Route::controller(DashboardController::class)->prefix('/dashboard')->as('dashboard.')->group(function () {
            Route::get('/', 'dashboard')->name('index');
            Route::post('order-stats', 'order_stats')->name('order-stats');
            Route::post('business-overview', 'business_overview')->name('business-overview');
        });
        Route::get('/complain/list', [ComplainAdminController::class,'list'])->name('complain.list');
        //system routes
        Route::get('search-function', [SystemController::class, 'search_function'])->name('search-function');
        Route::get('maintenance-mode', [SystemController::class, 'maintenance_mode'])->name('maintenance-mode');
        Route::get('/get-order-data', [SystemController::class, 'order_data'])->name('get-order-data');

        Route::controller(CustomRoleController::class)->prefix('/custom-role')->as('custom-role.')->middleware('module:employee_section')->group(function () {
            Route::get('create', 'create')->name('create');
            Route::post('create', 'store')->name('store');
            Route::get('update/{id}', 'edit')->name('update');
            Route::post('update/{id}', 'update');
            Route::post('employee-role-status', 'employee_role_status_update')->name('employee-role-status');
        });

        Route::controller(ProfileController::class)->prefix('/profile')->as('profile.')->group(function () {
            Route::get('view', 'view')->name('view');
            Route::get('update/{id}', 'edit')->name('update');
            Route::post('update/{id}', 'update');
            Route::post('settings-password', 'settings_password_update')->name('settings-password');
        });

        Route::controller(WithdrawController::class)->prefix('/withdraw')->as('withdraw.')->middleware('module:user_section')->group(function () {
            Route::post('update/{id}', 'update')->name('update');
            Route::post('request', 'w_request')->name('request');
            Route::post('status-filter', 'status_filter')->name('status-filter');
        });

        Route::controller(DealController::class)->prefix('/deal')->as('deal.')->middleware('module:marketing_section')->group(function () {
            Route::get('flash', 'flash_index')->name('flash');
            Route::post('flash', 'flash_submit');

            // feature deal
            Route::get('feature', 'feature_index')->name('feature');

            Route::get('day', 'deal_of_day')->name('day');
            Route::post('day', 'deal_of_day_submit');
            Route::post('day-status-update', 'day_status_update')->name('day-status-update');

            Route::get('day-update/{id}', 'day_edit')->name('day-update');
            Route::post('day-update/{id}', 'day_update');
            Route::post('day-delete', 'day_delete')->name('day-delete');

            Route::get('update/{id}', 'edit')->name('update');
            Route::get('edit/{id}', 'feature_edit')->name('edit');

            Route::post('update/{id}', 'update')->name('update');
            Route::post('status-update', 'status_update')->name('status-update');
            Route::post('feature-status', 'feature_status')->name('feature-status');

            Route::post('featured-update', 'featured_update')->name('featured-update');
            Route::get('add-product/{deal_id}', 'add_product')->name('add-product');
            Route::post('add-product/{deal_id}', 'add_product_submit');
            Route::post('delete-product', 'delete_product')->name('delete-product');
        });

        Route::controller(LandingPagesController::class)->prefix('/landingpages')->as('landingpages.')->middleware('module:marketing_section')->group(function () {
            Route::get('landing', 'landing_index')->name('landing');
            Route::post('landing', 'landing_submit');
            Route::get('remove-banner', 'remove_image')->name('remove-image');
            Route::post('status-update', 'status_update')->name('status-update');
            Route::get('update/{id}', 'edit')->name('update');
            Route::post('landing_pages_update/{id}', 'update')->name('landing_pages_update');
            Route::get('add-product/{landing_id}', 'add_product')->name('add-product');
            Route::post('add-product/{landing_id}', 'add_product_submit');
            Route::post('delete-product', 'delete_product')->name('delete-product');

            Route::get('/index', 'index')->name('index');
            Route::get('/create', 'create')->name('create');
            Route::post('/store', 'store')->name('store');
            Route::get('/edit{id}', 'SingleProductEdit')->name('edit');
            Route::post('/product-landing-page/update/{id}', 'SingleProductUpdate')->name('single.update');
            Route::post('status', 'LandingPageStatus')->name('status');
            Route::get('remove/slider', 'removeImage')->name('remove_image');
            Route::get('remove/feature-list', 'removeFeatureList')->name('remove_feature_list');
            Route::get('remove/landing-page/section', 'removePageSection')->name('remove_page_section');
            Route::get('remove/landing-page/{id}', 'removeLandingPage')->name('remove_landing_page');
        });

        Route::controller(EmployeeController::class)->prefix('/employee')->as('employee.')->middleware('module:employee_section')->group(function () {
            Route::get('add-new', 'add_new')->name('add-new');
            Route::post('add-new', 'store');
            Route::get('list', 'list')->name('list');
            Route::get('update/{id}', 'edit')->name('update');
            Route::post('update/{id}', 'update');
            Route::get('status/{id}/{status}', 'status')->name('status');
        });

        Route::controller(CategoryController::class)->as('category.')->middleware('module:product_management')->group(function () {
            Route::get('/category/view', 'index')->name('view');
            Route::get('/category/fetch', 'fetch')->name('fetch');
            Route::post('/category/store', 'store')->name('store');
            Route::get('/category/edit/{id}', 'edit')->name('edit');
            Route::post('/category/update/{id}', 'update')->name('update');
            Route::post('/category/delete', 'delete')->name('delete');
            Route::post('/category/status', 'status')->name('status');
        });

        Route::controller(SubCategoryController::class)->as('sub-category.')->middleware('module:product_management')->group(function () {
            Route::get('/sub-category/view', 'index')->name('view');
            Route::get('/sub-category/fetch', 'fetch')->name('fetch');
            Route::post('/sub-category/store', 'store')->name('store');
            Route::post('/sub-category/edit', 'edit')->name('edit');
            Route::post('/sub-category/update', 'update')->name('update');
            Route::post('/sub-category/delete', 'delete')->name('delete');
        });

        Route::controller(SubSubCategoryController::class)->prefix('/sub-sub-category')->as('sub-sub-category.')->middleware('module:product_management')->group(function () {
            Route::get('view', 'index')->name('view');
            Route::get('fetch', 'fetch')->name('fetch');
            Route::post('store', 'store')->name('store');
            Route::post('edit', 'edit')->name('edit');
            Route::post('update', 'update')->name('update');
            Route::post('delete', 'delete')->name('delete');
            Route::post('get-sub-category', 'getSubCategory')->name('getSubCategory');
            Route::post('get-category-id', 'getCategoryId')->name('getCategoryId');
        });

        Route::controller(BrandController::class)->prefix('/brand')->as('brand.')->middleware('module:product_management')->group(function () {
            Route::get('add-new', 'add_new')->name('add-new');
            Route::post('add-new', 'store');
            Route::get('list', 'list')->name('list');
            Route::get('update/{id}', 'edit')->name('update');
            Route::post('update/{id}', 'update');
            Route::post('delete', 'delete')->name('delete');
            Route::get('export', 'export')->name('export');
            Route::post('status-update', 'status_update')->name('status-update');
        });

        Route::controller(BannerController::class)->prefix('/banner')->as('banner.')->middleware('module:marketing_section')->group(function () {
            Route::post('add-new', 'store')->name('store');
            Route::get('list', 'list')->name('list');
            Route::post('delete', 'delete')->name('delete');
            Route::post('status', 'status')->name('status');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::put('update/{id}', 'update')->name('update');
        });

        Route::controller(AttributeController::class)->prefix('/attribute')->as('attribute.')->middleware('module:product_management')->group(function () {
            Route::get('view', 'index')->name('view');
            Route::get('fetch', 'fetch')->name('fetch');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
            Route::post('delete', 'delete')->name('delete');
        });

        Route::controller(PosPaymentTypeController::class)->prefix('/pospaymenttype')->as('pospaymenttype.')->middleware('module:pos_management')->group(function () {
            Route::get('view', 'index')->name('view');
            Route::get('fetch', 'fetch')->name('fetch');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
            Route::post('delete', 'delete')->name('delete');
        });

        Route::controller(CouponController::class)->prefix('/coupon')->as('coupon.')->middleware('module:marketing_section')->group(function () {
            Route::get('add-new', 'add_new')->name('add-new')->middleware('actch');;
            Route::post('store-coupon', 'store')->name('store-coupon');
            Route::get('update/{id}', 'edit')->name('update')->middleware('actch');
            Route::post('update/{id}', 'update');
            Route::get('status/{id}/{status}', 'status')->name('status');
            Route::delete('delete/{id}', 'delete')->name('delete');
        });

        Route::controller(ShipRocketController::class)->prefix('/shiprocket')->as('shiprocket.')->group(function () {
            Route::post('login', 'login')->name('login');
            Route::get('dashboard', 'index')->name('index');
        });

        Route::controller(BusinessSettingsController::class)->prefix('/social-login')->as('social-login.')->middleware('module:business_settings')->group(function () {
            Route::get('view', 'viewSocialLogin')->name('view');
            Route::post('update/{service}', 'updateSocialLogin')->name('update');
        });

        Route::controller(CurrencyController::class)->prefix('/currency')->as('currency.')->middleware('module:business_settings')->group(function () {
            Route::get('view', 'index')->name('view')->middleware('actch');;
            Route::get('fetch', 'fetch')->name('fetch');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
            Route::post('delete', 'delete')->name('delete');
            Route::post('status', 'status')->name('status');
            Route::post('system-currency-update', 'systemCurrencyUpdate')->name('system-currency-update');
        });

        Route::controller(SupportTicketController::class)->prefix('/support-ticket')->as('support-ticket.')->middleware('module:support_section')->group(function () {
            Route::get('view', 'index')->name('view');
            Route::post('status', 'status')->name('status');
            Route::get('single-ticket/{id}', 'single_ticket')->name('singleTicket');
            Route::post('single-ticket/{id}', 'replay_submit')->name('replay');
        });
        Route::controller(NotificationController::class)->prefix('/notification')->as('notification.')->middleware('module:marketing_section')->group(function () {
            Route::get('add-new', 'index')->name('add-new');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
            Route::post('status', 'status')->name('status');
            Route::post('resend-notification', 'resendNotification')->name('resend-notification');
            Route::post('delete', 'delete')->name('delete');
        });
        Route::controller(ReviewsController::class)->prefix('/reviews')->as('reviews.')->middleware('module:business_section')->group(function () {
            Route::get('list', 'list')->name('list')->middleware('actch');
            Route::get('customer-list', 'clientList')->name('clientList')->middleware('actch');
            Route::get('export', 'export')->name('export')->middleware('actch');
            //Route::get('export', 'export')->name('export')->middleware('actch');
            Route::get('status/{id}/{status}', 'status')->name('status');
            Route::get('reviewstatus/{id}/{status}', 'reviewstatus')->name('reviewstatus');
        });

        Route::controller(CustomerController::class)->prefix('/customer')->as('customer.')->middleware('module:user_section')->group(function () {
            Route::get('list', 'customer_list')->name('list');
            Route::get('intialCustomerList', 'intialCustomerList')->name('intialCustomerList');
            Route::post('status-update', 'status_update')->name('status-update');
            Route::get('view/{user_id}', 'view')->name('view');
            Route::delete('delete/{id}', 'delete')->name('delete');
            Route::get('subscriber-list', 'subscriber_list')->name('subscriber-list');
            Route::get('customer-settings', 'customer_settings')->name('customer-settings');
            Route::post('customer-settings-update', 'customer_update_settings')->name('customer-settings-update');
            Route::get('customer-list-search', 'get_customers')->name('customer-list-search');

            Route::controller(CustomerWalletController::class)->prefix('/wallet')->as('wallet.')->group(function () {
                Route::get('add-fund', 'add_fund_view')->name('add-fund');
                Route::post('add-fund', 'add_fund');
                Route::get('report', 'report')->name('report');
            });
            Route::prefix('/loyalty')->as('loyalty.')->group(function () {
                Route::get('report', [CustomerLoyaltyController::class, 'report'])->name('report');
            });
        });


        ///Report
        Route::prefix('/report')->as('report.')->middleware('module:report')->group(function () {
            Route::get('order', [ReportController::class, 'order_index'])->name('order');
            Route::get('earning', [ReportController::class, 'earning_index'])->name('earning');
            Route::any('set-date', [ReportController::class, 'set_date'])->name('set-date');
            //sale report inhouse
            Route::get('inhoue-product-sale', [InhouseProductSaleController::class, 'index'])->name('inhoue-product-sale');
            Route::get('seller-product-sale', [SellerProductSaleReportController::class, 'index'])->name('seller-product-sale');
        });
        Route::prefix('/stock')->as('stock.')->middleware('module:business_section')->group(function () {
            //product stock report
            Route::get('product-stock', [ProductStockReportController::class, 'index'])->name('product-stock');
            Route::get('product-stock-export', [ProductStockReportController::class, 'export'])->name('product-stock-export');
            Route::post('ps-filter', [ProductStockReportController::class, 'filter'])->name('ps-filter');
            //product in wishlist report
            Route::get('product-in-wishlist', [ProductWishlistReportController::class, 'index'])->name('product-in-wishlist');
            Route::get('wishlist-product-export', [ProductWishlistReportController::class, 'export'])->name('wishlist-product-export');
        });
        Route::controller(SellerController::class)->prefix('/sellers')->as('sellers.')->middleware('module:user_section')->group(function () {
            Route::get('seller-add', 'add_seller')->name('seller-add');
            Route::get('seller-list', 'index')->name('seller-list');
            Route::get('order-list/{seller_id}', 'order_list')->name('order-list');
            Route::get('product-list/{seller_id}', 'product_list')->name('product-list');

            Route::get('order-details/{order_id}/{seller_id}', 'order_details')->name('order-details');
            Route::get('verification/{id}', 'view')->name('verification');
            Route::get('view/{id}/{tab?}', 'view')->name('view');
            Route::post('update-status', 'updateStatus')->name('updateStatus');
            Route::post('withdraw-status/{id}', 'withdrawStatus')->name('withdraw_status');
            Route::get('withdraw_list', 'withdraw')->name('withdraw_list');
            Route::get('withdraw-view/{withdraw_id}/{seller_id}', 'withdraw_view')->name('withdraw_view');

            Route::post('sales-commission-update/{id}', 'sales_commission_update')->name('sales-commission-update');
        });

        Route::controller(BranchController::class)->prefix('/branches')->as('branches.')->middleware('module:business_settings')->group(function () {
            Route::get('branch-list', 'index')->name('branch-list');
            Route::get('create', 'create')->name('create');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
        });
        Route::controller(CourierController::class)->prefix('/couriers')->as('couriers.')->middleware('module:business_settings')->group(function () {
            Route::get('courier-list', 'index')->name('courier-list');
            Route::get('create', 'create')->name('create');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
        });

        Route::controller(SocialPageController::class)->prefix('/social-page')->as('social-page.')->middleware('module:business_settings')->group(function () {
            Route::get('social-page-list', 'index')->name('social-page-list');
            Route::get('create', 'create')->name('create');
            Route::post('store', 'store')->name('store');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
        });

        Route::controller(ProductController::class)->prefix('/product')->as('product.')->middleware('module:product_management')->group(function () {
            Route::get('add-new', 'add_new')->name('add-new');
            Route::post('store', 'store')->name('store');
            Route::get('remove-image', 'remove_image')->name('remove-image');
            Route::post('status-update', 'status_update')->name('status-update');
            Route::get('list/{type}', 'list')->name('list');
            Route::get('stock-limit-list/{type}', 'stock_limit_list')->name('stock-limit-list');
            Route::get('get-variations', 'get_variations')->name('get-variations');
            Route::post('update-quantity', 'update_quantity')->name('update-quantity');
            //Route::get('list/{type}/{slug}', 'list')->name('list');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
            Route::post('featured-status', 'featured_status')->name('featured-status');
            Route::get('approve-status', 'approve_status')->name('approve-status');
            Route::post('deny', 'deny')->name('deny');
            Route::post('sku-combination', 'sku_combination')->name('sku-combination');
            Route::post('color-combination', 'color_combination')->name('color-combination');
            Route::get('get-categories', 'get_categories')->name('get-categories');
            Route::delete('delete/{id}', 'delete')->name('delete');
            Route::get('updated-product-list', 'updated_product_list')->name('updated-product-list');
            Route::post('updated-shipping', 'updated_shipping')->name('updated-shipping');
            Route::post('add-color','addColor')->name('add.color');

            Route::get('view/{id}', 'view')->name('view');
            Route::get('bulk-import', 'bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'bulk_import_data');
            Route::get('bulk-export', 'bulk_export_data')->name('bulk-export');
            Route::get('barcode/{id}', 'barcode')->name('barcode');
            Route::get('barcode/generate', 'barcode_generate')->name('barcode.generate');
            Route::get('CampaingDelete/{id}', 'CampaingDelete')->name('CampaingDelete');
            Route::get('productsearch', 'productsearch')->name('productsearch');
        });

        Route::controller(TransactionController::class)->prefix('/transaction')->as('transaction.')->middleware('module:business_section')->group(function () {
            Route::get('list', 'list')->name('list');
            Route::get('transaction-export', 'export')->name('transaction-export');
        });

        Route::prefix('/refund-section')->as('refund-section.')->middleware('module:business_section')->group(function () {
            Route::get('refund-list', [RefundTransactionController::class, 'list'])->name('refund-list');

            //refund request
            Route::controller(RefundController::class)->prefix('/refund')->as('refund.')->group(function () {
                Route::get('list/{status}', 'list')->name('list');
                Route::get('details/{id}', 'details')->name('details');
                Route::get('inhouse-order-filter', 'inhouse_order_filter')->name('inhouse-order-filter');
                Route::post('refund-status-update', 'refund_status_update')->name('refund-status-update');
            });

            Route::get('refund-index', [RefundController::class, 'index'])->name('refund-index');
            Route::post('refund-update', [RefundController::class, 'update'])->name('refund-update');
        });


        Route::prefix('/business-settings')->as('business-settings.')->group(function () {
            Route::middleware('module:business_settings')->group(function () {

                Route::get('sms-module', [SMSModuleController::class,'sms_index'])->name('sms-module');
                Route::post('sms-module-update/{sms_module}', [SMSModuleController::class,'sms_update'])->name('sms-module-update');
            });


            Route::controller(ShippingMethodController::class)->prefix('/shipping-method')->as('shipping-method.')->middleware('module:business_settings')->group(function () {
                Route::get('by/admin', 'index_admin')->name('by.admin');
                //Route::get('by/seller', 'index_seller')->name('by.seller');
                Route::post('add', 'store')->name('add');
                Route::get('edit/{id}', 'edit')->name('edit');
                Route::put('update/{id}', 'update')->name('update');
                Route::post('delete', 'delete')->name('delete');
                Route::post('status-update', 'status_update')->name('status-update');
                Route::get('setting', 'setting')->name('setting');
                Route::post('shipping-store', 'shippingStore')->name('shipping-store');
            });

            Route::prefix('/shipping-type')->as('shipping-type.')->middleware('module:business_settings')->group(function () {
                Route::post('store', [ShippingTypeController::class,'store'])->name('store');
            });

            Route::prefix('/category-shipping-cost')->as('category-shipping-cost.')->middleware('module:business_settings')->group(function () {
                Route::post('store', [CategoryShippingCostController::class,'store'])->name('store');
            });

            Route::controller(LanguageController::class)->prefix('/language')->as('language.')->middleware('module:business_settings')->group(function () {
                Route::get('', 'index')->name('index');
                //                Route::get('app', 'index_app')->name('index-app');
                Route::post('add-new', 'store')->name('add-new');
                Route::get('update-status', 'update_status')->name('update-status');
                Route::get('update-default-status', 'update_default_status')->name('update-default-status');
                Route::post('update', 'update')->name('update');
                Route::get('translate/{lang}', 'translate')->name('translate');
                Route::post('translate-submit/{lang}', 'translate_submit')->name('translate-submit');
                Route::post('remove-key/{lang}', 'translate_key_remove')->name('remove-key');
                Route::get('delete/{lang}', 'delete')->name('delete');
            });

            Route::controller(MailController::class)->prefix('/mail')->as('mail.')->middleware('module:web_&_app_settings')->group(function () {
                Route::get('', 'index')->name('index')->middleware('actch');
                Route::post('update', 'update')->name('update');
                Route::post('update-sendgrid', 'update_sendgrid')->name('update-sendgrid');
                Route::post('send', 'send')->name('send');
            });

            Route::prefix('/web-config')->as('web-config.')->middleware('module:web_&_app_settings')->group(function () {
                Route::get('/', [BusinessSettingsController::class,'companyInfo'])->name('index')->middleware('actch');
                Route::post('update-colors', [BusinessSettingsController::class,'update_colors'])->name('update-colors');
                Route::post('update-language', [BusinessSettingsController::class,'update_language'])->name('update-language');
                Route::post('update-company', [BusinessSettingsController::class,'updateCompany'])->name('company-update');
                Route::post('update-company-email', [BusinessSettingsController::class,'updateCompanyEmail'])->name('company-email-update');
                Route::post('update-company-phone', [BusinessSettingsController::class,'updateCompanyPhone'])->name('company-phone-update');
                Route::post('upload-web-logo', [BusinessSettingsController::class,'uploadWebLogo'])->name('company-web-logo-upload');
                Route::post('upload-mobile-logo', [BusinessSettingsController::class,'uploadMobileLogo'])->name('company-mobile-logo-upload');
                Route::post('upload-footer-log', [BusinessSettingsController::class,'uploadFooterLog'])->name('company-footer-logo-upload');
                Route::post('upload-fav-icon', [BusinessSettingsController::class,'uploadFavIcon'])->name('company-fav-icon');
                Route::post('update-company-copyRight-text', [BusinessSettingsController::class,'updateCompanyCopyRight'])->name('company-copy-right-update');
                Route::post('app-store/{name}', [BusinessSettingsController::class,'update'])->name('app-store-update');
                Route::get('currency-symbol-position/{side}', [BusinessSettingsController::class,'currency_symbol_position'])->name('currency-symbol-position');
                Route::post('shop-banner', [BusinessSettingsController::class,'shop_banner'])->name('shop-banner');

                Route::get('db-index', [DatabaseSettingController::class,'db_index'])->name('db-index');
                Route::post('db-clean', [DatabaseSettingController::class,'clean_db'])->name('clean-db');

                Route::get('environment-setup', [EnvironmentSettingsController::class,'environment_index'])->name('environment-setup');
                Route::post('update-environment', [EnvironmentSettingsController::class,'environment_setup'])->name('update-environment');

                //sitemap generate
                Route::get('mysitemap', [SiteMapController::class,'index'])->name('mysitemap');
                Route::get('mysitemap-download', [SiteMapController::class,'download'])->name('mysitemap-download');
            });

            Route::prefix('/order-settings')->as('order-settings.')->middleware('module:business_settings')->group(function () {
                Route::get('index', [OrderSettingsController::class,'order_settings'])->name('index');
                Route::post('update-order-settings', [OrderSettingsController::class,'update_order_settings'])->name('update-order-settings');
            });

            Route::controller(BusinessSettingsController::class)->prefix('/seller-settings')->as('seller-settings.')->middleware('module:business_settings')->group(function () {
                Route::get('/', 'seller_settings')->name('index')->middleware('actch');
                Route::post('update-seller-settings', 'sales_commission')->name('update-seller-settings');
                Route::post('update-seller-registration', 'seller_registration')->name('update-seller-registration');
                Route::post('seller-pos-settings', 'seller_pos_settings')->name('seller-pos-settings');
                Route::get('business-mode-settings/{mode}', 'business_mode_settings')->name('business-mode-settings');
                Route::post('product-approval', 'product_approval')->name('product-approval');
            });

            Route::prefix('/payment-method')->as('payment-method.')->middleware('module:business_settings')->group(function () {
                Route::get('/', [PaymentMethodController::class,'index'])->name('index')->middleware('actch');
                Route::post('{name}', [PaymentMethodController::class,'update'])->name('update');
            });

            Route::controller(BusinessSettingsController::class)->middleware('module:web_&_app_settings')->group(function () {
                Route::get('general-settings', 'index')->name('general-settings')->middleware('actch');
                Route::get('update-language', 'update_language')->name('update-language');
                Route::get('about-us', 'about_us')->name('about-us');
                Route::post('about-us', 'about_usUpdate')->name('about-update');
                Route::post('update-info', 'updateInfo')->name('update-info');
                //Social Icon
                Route::get('social-media', 'social_media')->name('social-media');
                Route::get('fetch', 'fetch')->name('fetch');
                Route::post('social-media-store', 'social_media_store')->name('social-media-store');
                Route::post('social-media-edit', 'social_media_edit')->name('social-media-edit');
                Route::post('social-media-update', 'social_media_update')->name('social-media-update');
                Route::post('social-media-delete', 'social_media_delete')->name('social-media-delete');
                Route::post('social-media-status-update', 'social_media_status_update')->name('social-media-status-update');


                //meta
                Route::get('meta', 'meta')->name('meta');
                Route::get('meta-post', 'meta_post')->name('meta-post');
                Route::post('meta-post-edit', 'meta_post_edit')->name('meta-post-edit');
                Route::post('meta-post-update', 'meta_post_update')->name('meta-post-update');
                //facebook-post

                Route::get('facebook-post', 'facebook_post')->name('facebook-post');
                Route::post('facebook-post-status', 'facebook_status_update')->name('facebook-post-status');

                Route::post('facebook-media-store', 'facebook_media_store')->name('facebook-media-store');
                Route::get('facebookget', 'facebookget')->name('facebookget');
                Route::post('facebook-media-delete', 'facebook_media_delete')->name('facebook-media-delete');

                Route::get('terms-condition', 'terms_condition')->name('terms-condition');
                Route::post('terms-condition', 'updateTermsCondition')->name('update-terms');
                Route::get('privacy-policy', 'privacy_policy')->name('privacy-policy');
                Route::post('privacy-policy', 'privacy_policy_update')->name('privacy-policy');

                Route::get('fcm-index', 'fcm_index')->name('fcm-index');
                Route::post('update-fcm', 'update_fcm')->name('update-fcm');

                //captcha
                Route::get('captcha', 'recaptcha_index')->name('captcha');
                Route::post('recaptcha-update', 'recaptcha_update')->name('recaptcha_update');
                //google map api
                Route::get('map-api', 'map_api')->name('map-api');
                Route::post('map-api-update', 'map_api_update')->name('map-api-update');

                Route::post('update-fcm-messages', 'update_fcm_messages')->name('update-fcm-messages');


                //analytics
                Route::get('analytics-index', 'analytics_index')->name('analytics-index');
                Route::post('analytics-update', 'analytics_update')->name('analytics-update');
                Route::post('analytics-update-google-tag', 'google_tag_analytics_update')->name('analytics-update-google-tag');
            });
        });
        //order management
        Route::controller(OrderController::class)->prefix('/orders')->as('orders.')->middleware('module:order_management')->group(function () {
            Route::get('list/{status}', 'list')->name('list');
            Route::get('Individual/{status}', 'Individual')->name('Individual');
            Route::post('ordersPrice/{id}', 'ordersPrice')->name('ordersPrice');
            Route::get('detailsProduct/{product_id}', 'detailsProduct')->name('detailsProduct');
            Route::get('details/{id}', 'details')->name('details');
            Route::post('status', 'status')->name('status');
            Route::post('payment-status', 'payment_status')->name('payment-status');
            Route::post('advance-payment/{id}', 'advance_payment')->name('advance-payment');
            Route::post('productStatus', 'productStatus')->name('productStatus');
            Route::get('generate-invoice/{id}', 'generate_invoice')->name('generate-invoice')->withoutMiddleware(['module:order_management']);
            Route::get('exchange-generate-invoice/{id}', 'exchange_generate_invoice')->name('exchange-generate-invoice')->withoutMiddleware(['module:order_management']);
            Route::get('inhouse-order-filter', 'inhouse_order_filter')->name('inhouse-order-filter');

            Route::post('update-deliver-info', 'update_deliver_info')->name('update-deliver-info');
            Route::get('add-delivery-man/{order_id}/{d_man_id}', 'add_delivery_man')->name('add-delivery-man');

            Route::get('export-order-data/{status}', 'bulk_export_data')->name('order-bulk-export');
        });

        //pos management
        Route::controller(POSController::class)->prefix('/pos')->as('pos.')->middleware('module:pos_management')->group(function () {
            Route::get('/', 'index')->name('index');
            Route::get('exchange/{id}', 'posExchange')->name('exchange');
            Route::get('quick-view', 'quick_view')->name('quick-view');
            Route::post('variant_price', 'variant_price')->name('variant_price');
            Route::post('add-to-cart', 'addToCart')->name('add-to-cart');
            Route::post('remove-from-cart', 'removeFromCart')->name('remove-from-cart');
            Route::post('cart-items', 'cart_items')->name('cart_items');
            Route::post('update-quantity', 'updateQuantity')->name('updateQuantity');
            Route::post('empty-cart', 'emptyCart')->name('emptyCart');
            Route::post('tax', 'update_tax')->name('tax');
            Route::post('discount', 'update_discount')->name('discount');
            Route::get('customers', 'get_customers')->name('customers');
            Route::post('order', 'place_order')->name('order');
            Route::post('exchange-order', 'exchange_place_order')->name('exchange-order');
            Route::get('orders', 'order_list')->name('orders');
            Route::get('exchange-orders', 'order_exchange_list')->name('exchange-orders');
            Route::get('order-details/{id}', 'order_details')->name('order-details');
            Route::get('order-exchange-details/{id}', 'order_exchange_details')->name('order-exchange-details');
            Route::get('invoice/{id}', 'generate_invoice');
            Route::any('store-keys', 'store_keys')->name('store-keys');
            Route::get('search-products', 'search_product')->name('search-products');
            Route::get('order-bulk-export', 'bulk_export_data')->name('order-bulk-export');


            Route::post('coupon-discount', 'coupon_discount')->name('coupon-discount');
            Route::get('change-cart', 'change_cart')->name('change-cart');
            Route::get('new-cart-id', 'new_cart_id')->name('new-cart-id');
            Route::post('remove-discount', 'remove_discount')->name('remove-discount');
            Route::get('clear-cart-ids', 'clear_cart_ids')->name('clear-cart-ids');
            Route::get('get-cart-ids', 'get_cart_ids')->name('get-cart-ids');
            Route::get('exchange-get-cart-ids', 'exchange_get_cart_ids')->name('exchange-get-cart-ids');

            Route::post('customer-store', 'customer_store')->name('customer-store');
        });

        Route::controller(HelpTopicController::class)->prefix('/helpTopic')->as('helpTopic.')->middleware('module:web_&_app_settings')->group(function () {
            Route::get('list', 'list')->name('list');
            Route::post('add-new', 'store')->name('add-new');
            Route::get('status/{id}', 'status');
            Route::get('edit/{id}', 'edit');
            Route::post('update/{id}', 'update');
            Route::post('delete', 'destroy')->name('delete');
        });

        Route::controller(ContactController::class)->prefix('/contact')->as('contact.')->middleware('module:support_section')->group(function () {
            Route::post('contact-store', 'store')->name('store');
            Route::get('list', 'list')->name('list');
            Route::post('delete', 'destroy')->name('delete');
            Route::get('view/{id}', 'view')->name('view');
            Route::post('update/{id}', 'update')->name('update');
            Route::post('send-mail/{id}', 'send_mail')->name('send-mail');
        });

        Route::controller(DeliveryManController::class)->prefix('/delivery-man')->as('delivery-man.')->group(function () {
            Route::get('add', 'index')->name('add');
            Route::post('store', 'store')->name('store');
            Route::get('list', 'list')->name('list');
            Route::get('preview/{id}', 'preview')->name('preview');
            Route::get('edit/{id}', 'edit')->name('edit');
            Route::post('update/{id}', 'update')->name('update');
            Route::delete('delete/{id}', 'delete')->name('delete');
            Route::post('search', 'search')->name('search');
            Route::post('status-update', 'status')->name('status-update');
        });

        Route::controller(FileManagerController::class)->prefix('/file-manager')->as('file-manager.')->group(function () {
            Route::get('/download/{file_name}', 'download')->name('download');
            Route::get('/index/{folder_path?}', 'index')->name('index');
            Route::post('/image-upload', 'upload')->name('image-upload');
            Route::delete('/delete/{file_path}', 'destroy')->name('destroy');
        });
    });

    //for test

    /*Route::get('login', 'testController@login')->name('login');*/
});

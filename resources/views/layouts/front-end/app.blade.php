<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <title>
        @yield('title')
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <link rel="apple-touch-icon" sizes="180x180"
        href="{{ asset('storage/company') }}/{{ $web_config['fav_icon']->value }}">
    <link rel="icon" type="image/png" sizes="32x32"
        href="{{ asset('storage/company') }}/{{ $web_config['fav_icon']->value }}">

    <!-- Font Awesome cdn link -->
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/font-awesome.min.css" />
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/animate.min.css" />
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/xzoom.min.css" />
    <!-- Owl-carosul css cdn link -->
    <link rel="stylesheet" href="{{ asset('assets/back-end') }}/css/toastr.css" />
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/owl.carousel.min.css" />

    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/owl.theme.default.min.css" />
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/bootstrap_v4.min.css">
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/simple-lightbox.min.css" />
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/bs_customize.css">
    <link rel="stylesheet" href="{{ asset('assets/front-end/css/user_account.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/front-end/css/custome.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/responsive.css">
    {{-- dont touch this --}}
    @stack('css_or_js')
    <meta name="_token" content="{{ csrf_token() }}">
    <style>
        .v-color-box input,
        .v-size-box input {
            display: none;
        }

        .v-color-box,
        .v-size-box {
            display: flex;
            align-items: center;
            width: 70px;
            height: 30px !important;
            margin-top: 0px;
            margin-right: 10px;
        }
        .v-color-box>.color-label, .v-size-box>.size-label {
    cursor: pointer;
    border: 2px solid #ccc;
    padding: 2px 6px !important;
    border-radius: 5px;
    width: 100%;
    text-align: center;
    height: 30px !important;
    position: relative;
}
.v-color-box>input:checked+.color-label,.v-size-box>input:checked+.size-label {
    border: 2px solid #02ab16 !important;
}

.v-size-box>input:checked+.size-label::after {
    content: '✔';
    color: white;
    font-size: 12px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.cs_header_number_wrap {
    position: relative;
    padding-left: 50px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    color: #f26d21;
}
.cs_header_number_wrap svg {
    position: absolute;
    left: 0;
    width: 40px;
    height: 40px;
    top: 3px;
}
.cs_header_number_wrap .cs_header_number {
    font-weight: 600;
    font-family: var(--primary-font);
    font-size: 26px;
    line-height: 1.1em;
}
.cs_header_number_wrap .cs_header_number_text {
    font-size: 12px;
    line-height: 1.5em;
    color: #636363;
}
    </style>
    @php
        $request = request()->route()->getName();
    @endphp
    @if ($request != 'home')
        <style>
            .menu-area>ul>li>a {
                color: #1a1919;
            }

            .header-icon>a>.fa {
                color: #1a1919;
            }
        </style>
    @endif

    @php($google_tag_manager_id = \App\CPU\Helpers::get_business_settings('google_tag_manager_id'))
    @if ($google_tag_manager_id)
        <!-- Google Tag Manager -->
        <script>
            (function(w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({
                    'gtm.start': new Date().getTime(),
                    event: 'gtm.js'
                });
                var f = d.getElementsByTagName(s)[0],
                    j = d.createElement(s),
                    dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', '{{ $google_tag_manager_id }}');
        </script>
        <!-- End Google Tag Manager -->
    @endif

    @php($pixel_analytices_user_code = \App\CPU\Helpers::get_business_settings('pixel_analytics'))
    @if ($pixel_analytices_user_code)
        <!-- Facebook Pixel Code -->
        <script>
            ! function(f, b, e, v, n, t, s) {
                if (f.fbq) return;
                n = f.fbq = function() {
                    n.callMethod ?
                        n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                };
                if (!f._fbq) f._fbq = n;
                n.push = n;
                n.loaded = !0;
                n.version = '2.0';
                n.queue = [];
                t = b.createElement(e);
                t.async = !0;
                t.src = v;
                s = b.getElementsByTagName(e)[0];
                s.parentNode.insertBefore(t, s)
            }(window, document, 'script',
                'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '{your-pixel-id-goes-here}');
            fbq('track', 'PageView');
        </script>
        <noscript>
            <img height="1" width="1" style="display:none"
                src="https://www.facebook.com/tr?id={your-pixel-id-goes-here}&ev=PageView&noscript=1" />
        </noscript>
        <!-- End Facebook Pixel Code -->
    @endif

</head>
<!-- Body-->

<body class="toolbar-enabled">
    <section class="topbar-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <a href="tel:{{ \App\CPU\Helpers::get_business_settings('company_hotline') }}" class="cs_header_number_wrap float-right">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.35" stroke-linecap="round"
                            stroke-linejoin="round" class="lucide lucide-headset">
                            <path
                                d="M3 11h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-5Zm0 0a9 9 0 1 1 18 0m0 0v5a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3Z" />
                            <path d="M21 16v2a4 4 0 0 1-4 4h-5"/>
                        </svg>
                        <span class="cs_accent_color cs_fs_24 cs_header_number">{{ \App\CPU\Helpers::get_business_settings('company_hotline') }}</span>
                        <span class="cs_header_number_text">24/7 Support Center</span>
                    </a>
                    {{-- <div>
                        <span class="topbar-contact">{{ \App\CPU\translate('Hotline') }}: <a
                                href="tel:{{ \App\CPU\Helpers::get_business_settings('company_hotline') }}">{{ \App\CPU\Helpers::get_business_settings('company_hotline') }}</a></span>
                    </div> --}}
                </div>
                <div class="col-md-6">
                    <div class="topbar-left">
                        <div class="topbar-box mt-2">
                            <ul>
                                <!-- Dropdown -->
                                <li class="nav-item dropdown">
                                    @php($local = session()->has('local') ? session('local') : 'en')
                                    @php($lang = \App\Model\BusinessSetting::where('type', 'language')->first())
                                    <a href="#" id="navbardrop" data-toggle="dropdown">
                                        @foreach (json_decode($lang['value'], true) as $data)
                                            @if ($data['code'] == $local)
                                                <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                    width="20"
                                                    src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                                    alt="Eng">
                                                <span style="text-transform: capitalize">{{ $data['name'] }}</span>
                                            @endif
                                        @endforeach
                                    </a>
                                    <div class="dropdown-menu" style="z-index: 999999">
                                        @foreach (json_decode($lang['value'], true) as $key => $data)
                                            @if ($data['status'] == 1)
                                                <a class="dropdown-item pb-1"
                                                    href="{{ route('lang', [$data['code']]) }}">
                                                    <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                        width="20"
                                                        src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                                        alt="{{ $data['name'] }}" />
                                                    <span style="text-transform: capitalize">{{ $data['name'] }}</span>
                                                </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </li>

                                <li class="nav-item"><a class="btn btn-sm btn-warning text-white" href="{{ route('customer.complain') }}">
                                        {{ \App\CPU\translate('Complain') }}</a></li>
                                <li class="nav-item"><a href="{{ route('track-order.index') }}">
                                        {{ \App\CPU\translate('Order Track') }}</a></li>
                                @if (auth('customer')->check())
                                    <li class="nav-item"><a
                                            href="{{ route('user-account') }}">{{ \App\CPU\translate('Profile') }}</a>
                                    </li>
                                @else
                                    <li class="nav-item"><a
                                            href="{{ route('customer.auth.login') }}">{{ \App\CPU\translate('Login') }}</a>
                                    </li>
                                @endif

                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Navbar Electronics Store-->
    @include('layouts.front-end.partials._header')
    <!-- Page title-->
    <!------Search canva-->
    @include('layouts.front-end.partials.offcanvas')
    <!------End shopping cart canva-->
    <!------shopping cart shopping cart canva-->
    <!------shopping cart canva-->

    <div class="offcanvas offcanvas-end" tabindex="-1" id="shoppingCartOffcanvas"
        aria-labelledby="offcanvaShoppingCard">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvaShoppingCard">{{ \App\CPU\translate('SHOPPING CART') }}</h5>
            <i class="fa fa-close offcanvasClose" data-bs-dismiss="offcanvas" aria-label="Close"></i>
        </div>
        <div class="offcanvas-body">
            <div class="row mb-3">
                <div class="col">
                    <div class="offcanva-search-title" id="cart_items">
                        @include('layouts.front-end.partials.cart')
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!------shopping cart shopping cart canva-->

    {{-- loader --}}
    <div class="row">
        <div class="col-12" style="margin-top:10rem;position: fixed;z-index: 9999;">
            <div id="loading" style="display: none;">
                <center>
                    <img width="200"
                        src="{{ asset('storage/company') }}/{{ \App\CPU\Helpers::get_business_settings('loader_gif') }}"
                        onerror="this.src='{{ asset('assets/front-end/img/loader.gif') }}'">
                </center>
            </div>
        </div>
    </div>
    {{-- loader --}}

    <!-- Page Content-->
    @yield('content')

    <!-- Footer-->
    <!-- Footer-->
    @include('layouts.front-end.partials._footer')

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/bootstrap_v4.min.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/bs_v5.js"></script>
    <!-- Owl-carosul js file cdn link -->
    <script src="{{ asset('assets/front-end') }}/js/owl.carousel.min.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/owl-extra-code.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/wow.min.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/xzoom.min.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/xzoom_setup.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/spartan-multi-image-picker-min.js"></script>
    <script src="{{ asset('assets/front-end') }}/js/scrolltotop.js"></script>

    <script src="{{ asset('assets/front-end') }}/js/sweet_alert.js"></script>
    {{-- Toastr --}}
    <script src={{ asset('assets/back-end/js/toastr.js') }}></script>
    {!! Toastr::message() !!}
    @if (Session::has('success'))
    <script>
        toastr.success("{{ Session::get('success') }}")
    </script>
@endif
@if (Session::has('error'))
    <script>
        toastr.error("{{ Session::get('error') }}")
    </script>
@endif
@if (Session::has('info'))
    <script>
        toastr.info("{{ Session::get('info') }}")
    </script>
@endif
@if (Session::has('warning'))
    <script>
        toastr.warning("{{ Session::get('warning') }}")
    </script>
@endif
    <script>
        $(document).ready(function() {
            /*mobile menu*/
            $('.menu-icon').on('click', function() {
                $('.mobile-menu').toggleClass('mobile-menu-active');
            });
            $('.mm-ci').on('click', function() {
                $('.mobile-menu').toggleClass('mobile-menu-active');
            });


        });
    </script>
    <script>
        // Store the original title
        let originalTitle = document.title;
        let scrollTitle = "We miss you! Please come back soon.";
        let timeout;
        let scrollTimeout;
        let position = 0;

        // Function to scroll the title
        function scrollText() {
            document.title = scrollTitle.substring(position) + " " + scrollTitle.substring(0, position);
            position++;
            if (position > scrollTitle.length) {
                position = 0;
            }
            scrollTimeout = setTimeout(scrollText, 200); // Adjust the speed by changing the timeout
        }
        document.addEventListener('visibilitychange', function() {
            if (document.hidden) {
                // When the user leaves the tab, wait for 10 seconds before changing the title
                timeout = setTimeout(function() {
                    scrollText(); // Start scrolling the text
                }, 2000); // 10-second delay
            } else {
                // When the user comes back, clear the timeouts and revert to the original title
                clearTimeout(timeout);
                clearTimeout(scrollTimeout);
                document.title = originalTitle;
                position = 0;
            }
        });
    </script>
    <script>
        $(document).ready(function() {
            // Add minus icon for collapse element which is open by default
            $(".collapse.show").each(function() {
                $(this).prev(".menu-link").find(".fa-minus").addClass("fa-minus").removeClass("fa-plus");
            });

            // Toggle plus minus icon on show hide of collapse element
            $(".collapse").on('show.bs.collapse', function() {
                $(this).prev(".menu-link").find(".fa-plus").removeClass("fa-plus").addClass("fa-minus");
            }).on('hide.bs.collapse', function() {
                $(this).prev(".menu-link").find(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
            });
            /*mobile-menu-click*/
            $('.mmenu-btn').click(function() {
                $(this).toggleClass("menu-link-active");

            });
        });
    </script>
    <script>
        // Product price filter input in min and max
        const rangeInput = document.querySelectorAll(".range-input input"),
            priceInput = document.querySelectorAll(".price-input input"),
            range = document.querySelector(".slider .progress");
        let priceGap = 1000;

        priceInput.forEach((input) => {
            input.addEventListener("input", (e) => {
                let minPrice = parseInt(priceInput[0].value),
                    maxPrice = parseInt(priceInput[1].value);

                if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput[1].max) {
                    if (e.target.className === "input-min") {
                        rangeInput[0].value = minPrice;
                        range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
                    } else {
                        rangeInput[1].value = maxPrice;
                        range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                    }
                }
            });
        });

        rangeInput.forEach((input) => {
            input.addEventListener("input", (e) => {
                let minVal = parseInt(rangeInput[0].value),
                    maxVal = parseInt(rangeInput[1].value);

                if (maxVal - minVal < priceGap) {
                    if (e.target.className === "range-min") {
                        rangeInput[0].value = maxVal - priceGap;
                    } else {
                        rangeInput[1].value = minVal + priceGap;
                    }
                } else {
                    priceInput[0].value = minVal;
                    priceInput[1].value = maxVal;
                    range.style.left = (minVal / rangeInput[0].max) * 100 + "%";
                    range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
                }
            });
        });
    </script>
    <script>
        new WOW().init();
    </script>
    <script>
        //Grid view system on product
        $(document).ready(function() {
            $('.grid-btn').on('click', function() {
                var columns = $(this).data('columns');
                var category = $(this).data('category');
                // console.log(columns);
                $('.product-column[data-category="' + category + '"]')
                    .removeClass('col-md-2 col-md-3 col-md-4 col-md-5 col-md-6')
                    .addClass('col-md-' + columns);

                $('.grid-btn[data-category="' + category + '"]').removeClass('active');
                $(this).addClass('active');
                // Apply fixed dimensions to images
                $('.product-box[data-category="' + category + '"]')
                    .removeClass('product-box-col-2 product-box-col-3 product-box-col-4 product-box-col-6')
                    .addClass('product-box-col-' + columns);
                $('.product-image2[data-category="' + category + '"]')
                    .removeClass(
                        'product-image2-col-2 product-image2-col-3 product-image2-col-4 product-image2-col-6'
                    )
                    .addClass('product-image2-col-' + columns);
            });
        });
    </script>
    <script>
        //Grid view system on product in mobile responsive
        $(document).ready(function() {
            $('.grid-btn-mobile').on('click', function() {
                var columns = $(this).data('columns');
                var category = $(this).data('category');
                // console.log(columns);
                $('.product-column[data-category="' + category + '"]')
                    .removeClass('col-md-2 col-md-3 col-md-4 col-md-5 col-md-6 col-sm-12 col-sm-6')
                    .addClass('col-sm-' + columns);

                $('.grid-btn-mobile[data-category="' + category + '"]').removeClass('active');
                $(this).addClass('active');
                // Apply fixed dimensions to images
                $('.product-box[data-category="' + category + '"]')
                    .removeClass(
                        'product-box-col-2 product-box-col-3 product-box-col-4 product-box-col-6 product-box-col-sm-12 product-box-col-sm-6'
                    )
                    .addClass('product-box-col-sm-' + columns);

                $('.product-image2[data-category="' + category + '"]')
                    .removeClass(
                        'product-image2-col-2 product-image2-col-3 product-image2-col-4 product-image2-col-6 product-image2-col-sm-12 product-image2-col-sm-6'
                    )
                    .addClass('product-image2-col-sm-' + columns);
            });
        });
    </script>
    <script>
        //When scroll on window
        window.addEventListener('scroll', function() {
            const header = document.getElementById('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    </script>
    <script>
        //When scroll display block in filter section other wise display none
        // window.addEventListener('scroll', function() {
        //     const header = document.getElementById('filter-box');
        //     if (window.scrollY > 750) {
        //         header.classList.add('scrolled');
        //     } else {
        //         header.classList.remove('scrolled');
        //     }
        // });
    </script>
    <script>
        //category filter category show and hide
        $(document).ready(function() {
            $('.category-header').on('click', function() {
                var toggleId = $(this).find('.toggle-icon').data('toggle');
                $('#' + toggleId).slideToggle();
                var icon = $(this).find('.toggle-icon');
                icon.text(icon.text() === '+' ? '-' : '+');
            });

            $('.sub-category-header').on('click', function() {
                var toggleId = $(this).find('.toggle-icon').data('toggle');
                if (toggleId) {
                    $('#' + toggleId).slideToggle();
                    var icon = $(this).find('.toggle-icon');
                    icon.text(icon.text() === '+' ? '-' : '+');
                }
            });
        });
    </script>
    <script>
        function addWishlist(product_id) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{ route('store-wishlist') }}",
                method: 'POST',
                data: {
                    product_id: product_id
                },
                success: function(data) {
                    if (data.value == 1) {
                        Swal.fire({
                            position: 'top-end',
                            type: 'success',
                            title: data.success,
                            showConfirmButton: false,
                            timer: 1500
                        });
                        $('.countWishlist').html(data.count);
                        $('.countWishlist-' + product_id).text(data.product_count);
                        $('.tooltip').html('');
                        /*$('.wishlist' + data.id).html('<button type="button" class="btn" title="Add to wishlist" onclick="addWishlist(' + data.id + ')" style="background-color: transparent ;font-size: 18px; height: 45px; color: #9E9E9E; border: 2px solid #9E9E9E;">' +
                            '                       <i class="fa fa-heart-o mr-2" aria-hidden="true"></i>' +
                            '                   </button>');*/

                    } else if (data.value == 2) {
                        Swal.fire({
                            type: 'info',
                            title: 'WishList',
                            text: data.error
                        });
                    } else {
                        Swal.fire({
                            type: 'error',
                            title: 'WishList',
                            text: data.error
                        });
                    }
                }
            });
        }

        function removeWishlist(product_id) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{ route('delete-wishlist') }}",
                method: 'POST',
                data: {
                    id: product_id
                },
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    Swal.fire({
                        type: 'success',
                        title: 'WishList',
                        text: data.success
                    });
                    $('.countWishlist').html(data.count);
                    $('#set-wish-list').html(data.wishlist);
                    $('.tooltip').html('');
                    /*$('.wishlist' + data.id).html('<button type="button" class="btn" title="Add to wishlist" onclick="addWishlist(' + data.id + ')" style="background-color: transparent ;font-size: 18px; height: 45px; color: #9E9E9E; border: 2px solid #9E9E9E;">' +
                        '                       <i class="fa fa-heart-o mr-2" aria-hidden="true"></i>' +
                        '                   </button>');*/
                },
                complete: function() {
                    $('#loading').hide();
                },
            });
        }

        function addToCart(form_id, redirect_to_checkout = false) {
            if (form_id) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });

                $.post({
                    url: '{{ route('cart.add') }}',
                    data: $('#' + form_id).serializeArray(),
                    beforeSend: function() {
                        $('#loading').show();
                    },
                    success: function(data) {
                        if (data.data == 1) {
                            Swal.fire({
                                icon: 'info',
                                title: 'Cart',
                                text: "Product already added in cart"
                            });
                            return false;
                        } else if (data.data == 0) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Cart',
                                text: 'Sorry, product out of stock.'
                            });
                            return false;
                        }

                        toastr.success('Item has been added in your cart!', {
                            CloseButton: true,
                            ProgressBar: true
                        });

                        // Remove any backdrop that might still be visible
                        // $('.modal-backdrop').remove();
                        // $('.modal').hide();

                        $('#total_cart_count').text(data.count);
                        updateNavCart();
                        if (redirect_to_checkout) {
                            location.href = "{{ route('shop-cart') }}";
                        }
                    },
                    complete: function() {
                        $('#loading').hide();
                    }
                });
            } else {
                Swal.fire({
                    type: 'info',
                    title: 'Cart',
                    text: 'Something want wrong!'
                });
            }
        }

        function buy_now(form_id) {
            addToCart(form_id, true);
            // location.href = "{{ route('shop-cart') }}";
        }

        function currency_change(currency_code) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                type: 'POST',
                url: '{{ route('currency.change') }}',
                data: {
                    currency_code: currency_code
                },
                success: function(data) {
                    toastr.success('Currency changed to' + data.name);
                    location.reload();
                }
            });
        }

        function removeFromCart(key) {

            $.post('{{ route('cart.remove') }}', {
                _token: '{{ csrf_token() }}',
                key: key
            }, function(data) {
                updateTotalCart();
                updateNavCart();
                $('#cart-summary').empty().html(data);
                toastr.info('Item has been removed from cart', {
                    CloseButton: true,
                    ProgressBar: true
                });
            });
        }

        function updateTotalCart() {
            $.post('<?php echo e(route('cart.totalCart')); ?>', {
                _token: '<?php echo e(csrf_token()); ?>'
            }, function(data) {
                $('#total_cart_count').text(data);
            });
        }

        function updateNavCart() {
            $.post('<?php echo e(route('cart.nav_cart')); ?>', {
                _token: '<?php echo e(csrf_token()); ?>'
            }, function(data) {
                $('#cart_items').html(data);
            });
        }

        function cartQuantityInitialize() {
            $('.btn-number').click(function(e) {
                // console.log("Ok");
                e.preventDefault();

                fieldName = $(this).attr('data-field');
                type = $(this).attr('data-type');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());

                if (!isNaN(currentVal)) {
                    if (type == 'minus') {

                        if (currentVal > input.attr('min')) {
                            input.val(currentVal - 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('min')) {
                            $(this).attr('disabled', true);
                        }

                    } else if (type == 'plus') {

                        if (currentVal < input.attr('max')) {
                            input.val(currentVal + 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('max')) {
                            $(this).attr('disabled', true);
                        }

                    }
                } else {
                    input.val(0);
                }
            });

            $('.input-number').focusin(function() {
                $(this).data('oldValue', $(this).val());
            });

            $('.input-number').change(function() {

                minValue = parseInt($(this).attr('min'));
                maxValue = parseInt($(this).attr('max'));
                valueCurrent = parseInt($(this).val());

                var name = $(this).attr('name');
                if (valueCurrent >= minValue) {
                    $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cart',
                        text: 'Sorry, the minimum value was reached'
                    });
                    $(this).val($(this).data('oldValue'));
                }
                if (valueCurrent <= maxValue) {
                    $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cart',
                        text: 'Sorry, stock limit exceeded.'
                    });
                    $(this).val($(this).data('oldValue'));
                }


            });
            $(".input-number").keydown(function(e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                    // Allow: Ctrl+A
                    (e.keyCode == 65 && e.ctrlKey === true) ||
                    // Allow: home, end, left, right
                    (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
        }

        function updateQuantity(key, element) {
            $.post('<?php echo e(route('cart.updateQuantity')); ?>', {
                _token: '<?php echo e(csrf_token()); ?>',
                key: key,
                quantity: element.value
            }, function(data) {
                updateNavCart();
                $('#cart-summary').empty().html(data);
            });
        }

        function updateCartQuantity(key) {
            var quantity = $("#cartQuantity" + key).children("option:selected").val();
            $.post('<?php echo e(route('cart.updateQuantity')); ?>', {
                _token: '<?php echo e(csrf_token()); ?>',
                key: key,
                quantity: quantity
            }, function(data) {
                // console.log(data);
                if (data['data'] == 0) {
                    toastr.error('Sorry, stock limit exceeded.', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    $("#cartQuantity" + key).val(data['qty']);
                } else {
                    toastr.info('Quantity updated!', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    updateNavCart();

                    $('#cart-summary').empty().html(data);
                }


            });
        }

        $('#add-to-cart-form input').on('change', function() {
            getVariantPrice();
        });

        function getVariantPrice() {
            if ($('#add-to-cart-form input[name=quantity]').val() > 0) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });
                $.ajax({
                    type: "POST",
                    url: '{{ route('cart.variant_price') }}',
                    data: $('#add-to-cart-form').serializeArray(),
                    success: function(data) {
                        $('#add-to-cart-form #chosen_price_div').removeClass('d-none');
                        $('#add-to-cart-form #chosen_price_div #chosen_price').html(data.price);
                        $('#available-quantity').html(data.quantity);
                        $('.cart-qty-field').attr('max', data.quantity);
                    }
                });
            }
        }

        @if (Request::is('/') && \Illuminate\Support\Facades\Cookie::has('popup_banner') == false)
            $(document).ready(function() {
                $('#popup-modal').appendTo("body").modal('show');
            });
            @php(\Illuminate\Support\Facades\Cookie::queue('popup_banner', 'off', 1))
        @endif
    </script>

    @if ($errors->any())
        <script>
            @foreach ($errors->all() as $error)
                toastr.error('{{ $error }}', Error, {
                    CloseButton: true,
                    ProgressBar: true
                });
            @endforeach
        </script>
    @endif

    <script>
        function couponCode() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: '{{ route('coupon.apply') }}',
                data: $('#coupon-code-ajax').serializeArray(),
                success: function(data) {
                    if (data.status == 1) {
                        let ms = data.messages;
                        ms.forEach(
                            function(m, index) {
                                toastr.success(m, index, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        );
                    } else {
                        let ms = data.messages;
                        ms.forEach(
                            function(m, index) {
                                toastr.error(m, index, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        );
                    }
                    setInterval(function() {
                        location.reload();
                    }, 2000);
                }
            });
        }
    </script>
    <script>
        $('.inline_product').click(function() {
            window.location.href = $(this).data('href');
        })
    </script>
    <script>
        jQuery(".search-bar-input").keyup(function() {
            $(".search-card").css("display", "block");
            let name = $(".search-bar-input").val();
            if (name.length > 0) {
                $.get({
                    url: '{{ url('/') }}/searched-products',
                    dataType: 'json',
                    data: {
                        name: name
                    },
                    beforeSend: function() {
                        $('#loading').show();
                    },
                    success: function(data) {
                        $('.search-result-box').empty().html(data.result)
                    },
                    complete: function() {
                        $('#loading').hide();
                    },
                });
            } else {
                $('.search-result-box').empty();
            }
        });

        jQuery(".search-bar-input-mobile").keyup(function() {
            $(".search-card").css("display", "block");
            let name = $(".search-bar-input-mobile").val();
            if (name.length > 0) {
                $.get({
                    url: '{{ url('/') }}/searched-products',
                    dataType: 'json',
                    data: {
                        name: name
                    },
                    beforeSend: function() {
                        $('#loading').show();
                    },
                    success: function(data) {
                        $('.search-result-box').empty().html(data.result)
                    },
                    complete: function() {
                        $('#loading').hide();
                    },
                });
            } else {
                $('.search-result-box').empty();
            }
        });

        jQuery(document).mouseup(function(e) {
            var container = $(".search-card");
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                container.hide();
            }
        });
    </script>
    {{-- products search --}}
    <script>
        $(document).ready(function() {
            $('#searchInput').on('keyup', function() {
                var query = $(this).val();
                if (query.length >= 2) { // Start searching after 2 characters
                    $.ajax({
                        url: "{{ route('product_search') }}", // The route that handles search
                        type: "GET",
                        data: {
                            'query': query
                        },
                        success: function(data) {
                            // console.log(data);
                            if (data.products) {

                                $('#searchResultProducts').html(data
                                    .products); // Display the results
                            } else {
                                $('#searchResultProducts').html('');
                            }
                            if (data.categories) {
                                $('#searchResultCategories').html(data.categories);
                            } else {
                                $('#searchResultCategories').html('');
                            }

                        }
                    });
                }
            });
        });
    </script>
    @stack('scripts')
</body>

</html>

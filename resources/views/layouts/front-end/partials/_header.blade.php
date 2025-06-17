<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <!-- <a class="navbar-brand" href="index.html">Shopping Zone BD</a> -->
                <a href="{{ route('home') }}">
                    <img class="header-logo" src="{{ asset('storage/company') . '/' . $web_config['web_logo']->value }}"
                        onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                        alt="{{ $web_config['name']->value }}">
                </a>
            </div>
            <div class="col-md-8">
                @php($categories = \App\CPU\CategoryManager::parents())
                <nav class="navbar">
                    <div class="menu-area">
                        <ul>
                            <li><a href="{{ route('home') }}">{{ \App\CPU\translate('Home') }}</a></li>

                            <li class="dd-btn1"><a href="#">{{ \App\CPU\translate('Categories') }} <i
                                        class="fa fa-angle-down"></i></a>
                                <div class="dropdown-menu1">
                                    <div class="row">
                                        @foreach ($categories as $category)
                                            <div class="col-md-4 mb-2">
                                                <div class="m-category-box">
                                                    <a
                                                        href="{{ route('products', ['id' => $category['id'], 'data_from' => 'category', 'page' => 1]) }}">
                                                        <img src="{{ asset("storage/category/$category->icon") }}"
                                                            onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'">
                                                        {{ $category['name'] }} <i
                                                            class="fa fa-angle-right float-right mt-1"></i></a>
                                                </div>
                                                @if ($category->childes->count() > 0)
                                                    <div class="s-category-box">
                                                        <ul class="w-nav-list level_3 ml-4">
                                                            @foreach ($category['childes'] as $subCategory)
                                                                <li class="s-category"><a
                                                                        href="{{ route('products', ['id' => $subCategory['id'], 'data_from' => 'category', 'page' => 1]) }}">{{ $subCategory['name'] }}
                                                                    </a>
                                                                    @if ($subCategory->childes->count() > 0)
                                                                        <div class="dropdown-menuc">
                                                                            <ul class="w-nav-list level_3 ml-3">
                                                                                @foreach ($subCategory['childes'] as $subSubCategory)
                                                                                    <li><a
                                                                                            href="{{ route('products', ['id' => $subSubCategory['id'], 'data_from' => 'category', 'page' => 1]) }}">{{ $subSubCategory['name'] }}</a>
                                                                                    </li>
                                                                                @endforeach
                                                                            </ul>
                                                                        </div>
                                                                    @endif
                                                                </li>
                                                            @endforeach
                                                        </ul>
                                                    </div>
                                                @endif
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </li>
                            <li><a href="{{ route('shop') }}">{{ \App\CPU\translate('Shop') }}</a>
                            </li>
                            <li><a href="{{ route('video_shopping') }}">{{ \App\CPU\translate('video shopping') }}</a>
                            </li>
                            {{-- <li><a href="{{ route('campain') }}">{{\App\CPU\translate('Campaign')}}</i></a> --}}
                            <li class="dd-btn1"><a href="#">{{ \App\CPU\translate('Offer') }} <i
                                        class="fa fa-angle-down"></i></a>
                                @php($landingPages = \App\Model\LandingPages::where('status', 1)->get())
                                <div class="dropdown-menu1 offer-dropdown">
                                    <ul>
                                        <li>
                                            <a
                                                href="{{ route('campain') }}">{{ \App\CPU\translate('Campaign') }}</i></a>
                                        </li>
                                        @foreach ($landingPages as $landingPage)
                                            <li><a
                                                    href="{{ route('landing_page', $landingPage->slug) }}">{{ $landingPage->title }}</i></a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </li>

                            <li><a
                                    href="{{ route('selling.product') }}">{{ \App\CPU\translate('Selling product') }}</a>
                            </li>
                            <li><a href="{{ route('outlets') }}">{{ \App\CPU\translate('Our outlets') }}</a></li>
                        </ul>
                    </div>

                    <i class="fa fa-bars menu-icon"></i>
                </nav>
            </div>
            <div class="col-md-2">
                <div class="header-icon">
                    <a data-bs-toggle="offcanvas" href="#searchOffcanvas" role="button"
                        aria-controls="searchOffcanvas"><i class="fa fa-search" aria-hidden="true"></i></a>
                    <a href="{{ route('wishlists') }}"><i class="fa fa-heart-o" aria-hidden="true"></i>
                        <span
                            class="badge badge-danger countWishlist">{{ session()->has('wish_list') ? count(session('wish_list')) : 0 }}</span></a>
                    <a data-bs-toggle="offcanvas" href="#shoppingCartOffcanvas" role="button"
                        aria-controls="shoppingCartOffcanvas"><i class="fa fa-shopping-cart"
                            aria-hidden="true"></i><span class="badge badge-danger" id="total_cart_count">
                            {{ session()->has('cart') ? count(session()->get('cart')) : 0 }}
                        </span></a>
                    @if (auth('customer')->check())
                        <a href="{{ route('user-account') }}" class="d-lg-none"><i class="fa fa-user" aria-hidden="true"></i></a>
                    @else
                        <a href="{{ route('customer.auth.login') }}" class="d-lg-none"><i class="fa fa-user" aria-hidden="true"></i></a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</header>


<?php
$company_mobile_logo = \App\Model\BusinessSetting::where('type', 'company_mobile_logo')->first()->value;
?>

<!--end header-->
<!--start mobile menu-->
<div class="mobile-menu">
    <div class="mm-logo" style="background: #fff; padding: 11px 18px;">
        <a href="{{ route('home') }}">
            <img style="width:220px;" src="{{ asset("storage/company/$company_mobile_logo") }}"
                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'" alt="">
        </a>
        <div class="mm-cross-icon">
            <i class="fa fa-times mm-ci"></i>
        </div>
    </div>
    <div class="mm-menu">
        <div class="accordion" id="accordionExample">
            <div class="menu-box">
                <div class="menu-link">
                    <a href="{{ route('home') }}"><i class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Home') }}</a>
                </div>
            </div>
            <div class="menu-box">
                <div class="menu-link" id="headingOne">
                    <a class="mmenu-btn menu-link-active" type="button" data-toggle="collapse"
                        data-target="#categories" aria-expanded="true"><i
                            class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Categories') }}<i
                            class="fa fa-plus"></i></a>
                </div>
                <div id="categories" class="menu-body collapse" aria-labelledby="headingOne"
                    data-parent="#accordionExample">
                    <div class="card-body">
                        <ul>
                            @foreach ($categories as $category)
                                <li class="mega-dd-btn-2">
                                    <div class="menu-link d-flex justify-content-between">
                                        <a
                                            href="{{ route('products', ['id' => $category['id'], 'data_from' => 'category', 'page' => 1]) }}">{{ $category['name'] }}</a>
                                        <a data-toggle="collapse" type="button"
                                            data-target="#category__{{ $category['id'] }}" aria-expanded="true"><i
                                                class="fa fa-plus"></i></a>
                                    </div>
                                    @if ($category->childes->count() > 0)
                                        <div class="collapse" id="category__{{ $category['id'] }}">
                                            <div class="card card-body">
                                                <ul class="mega-item">
                                                    @foreach ($category['childes'] as $subCategory)
                                                        <li class="mega-dd-btn-2">
                                                            <div class="menu-link d-flex justify-content-between">
                                                                <a
                                                                    href="{{ route('products', ['id' => $subCategory['id'], 'data_from' => 'category', 'page' => 1]) }}">{{ $subCategory['name'] }}</a>
                                                                <a type="button" data-toggle="collapse"
                                                                    data-target="#subCategory__{{ $subCategory['id'] }}"
                                                                    aria-expanded="true"><i
                                                                        class="fa fa-plus"></i></a>
                                                            </div>
                                                            <div class="collapse"
                                                                id="subCategory__{{ $subCategory['id'] }}">
                                                                <div class="card card-body">
                                                                    <ul class="mega-item">
                                                                        @foreach ($subCategory['childes'] as $subSubCategory)
                                                                            <li><a
                                                                                    href="{{ route('products', ['id' => $subSubCategory['id'], 'data_from' => 'category', 'page' => 1]) }}">{{ $subSubCategory['name'] }}</a>
                                                                            </li>
                                                                        @endforeach
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        </div>
                                    @endif
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-box">
                <div class="menu-link">
                    <a href="{{ route('shop') }}"><i class="fa fa-ptab3 mr-2"></i>
                        {{ \App\CPU\translate('Shop') }}</a>
                </div>
            </div>
            <div class="menu-box">
                <div class="menu-link">
                    <a href="{{ route('video_shopping') }}"><i class="fa fa-ptab3 mr-2"></i>
                        {{ \App\CPU\translate('Video Shopping') }}</a>
                </div>
            </div>
            <div class="menu-box">
                <div class="menu-link" id="headingTwo">
                    <a class="mmenu-btn menu-link-active" type="button" data-toggle="collapse"
                        data-target="#offers" aria-expanded="true"><i
                            class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Offer') }}<i
                            class="fa fa-plus"></i></a>
                </div>
                <div id="offers" class="menu-body collapse" aria-labelledby="headingTwo"
                    data-parent="#accordionExample">
                    <div class="card-body">
                        <ul>
                            <li>
                                <a href="{{ route('campain') }}"><i
                                        class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Campaign') }}</i></a>
                            </li>
                            @foreach ($landingPages as $landingPage)
                                <li><a href="{{ route('landing_page', $landingPage->slug) }}"><i
                                            class="fa fa-ptab3 mr-2"></i>{{ $landingPage->title }}</i></a></li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-box">
                <div class="menu-link">
                    <a href="{{ route('selling.product') }}"><i
                            class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Selling Product') }}</a>
                </div>
            </div>
            <div class="menu-box">
                <div class="menu-link">
                    <a href="{{ route('outlets') }}"><i
                            class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Our outlets') }}</a>
                </div>
            </div>
            <div class="menu-box mt-2 text-white">
                <div class="menu-link">
                    @if (auth('customer')->check())
                        <a href="{{ route('user-account') }}" class="btn btn-primary"><i class="fa fa-ptab3 mr-2"></i>
                            {{ \App\CPU\translate('User Dashboard') }}</a>
                            @else
                        <a href="{{ route('customer.auth.login') }}" class="btn btn-primary"><i
                                class="fa fa-ptab3 mr-2"></i>{{ \App\CPU\translate('Login') }}</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

@extends('layouts.front-end.app')
@section('title', \App\CPU\translate('Welcome To') . ' ' . $web_config['name']->value)

@push('css_or_js')
    <meta property="og:image" content="{{ asset('storage/company') }}/{{ $web_config['web_logo']->value }}" />
    <meta property="og:title" content="Best Online Marketplace In Bangladesh {{ $web_config['name']->value }} Home" />
    <meta property="og:url" content="{{ env('APP_URL') }}">
    <meta property="og:description" content="{!! substr($web_config['about']->value, 0, 100) !!}">

    <meta property="twitter:card" content="{{ asset('storage/company') }}/{{ $web_config['web_logo']->value }}" />
    <meta property="twitter:title" content="Welcome To {{ $web_config['name']->value }} Home" />
    <meta property="twitter:url" content="{{ env('APP_URL') }}">
    <meta property="twitter:description" content="{!! substr($web_config['about']->value, 0, 100) !!}">
    {{-- <link rel="stylesheet" href="{{ asset('assets/front-end/css/bangla-font.css') }}"> --}}
    <link href="https://fonts.maateen.me/solaiman-lipi/font.css" rel="stylesheet">
    <style>
        /*---End Bangla fonts*/
        body {
            font-family: 'SolaimanLipi', sans-serif !important;
        }

        p,
        span,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        label {
            font-family: 'SolaimanLipi', sans-serif !important;
            font-weight: 400
        }

        .product-image {
            width: 100%;
            max-width: 300px;
            margin: 0 auto;
        }

        .video-section,
        .benefit-section,
        .use-section {
            margin-top: 40px;
        }

        .benefit-list li {
            list-style: none;
            border-bottom: 1px solid #ddd;
            line-height: 34px;
        }

        .benefit-list li i {
            color: #0bc508;
            margin-right: 10px;
        }

        .order-btn {
            background: #f26d21;
            display: block;
            padding: 15px 20px;
            border-radius: 7px;
            color: #fff;
            text-align: center;
            font-weight: 700;
            font-size: 20px;
            transition: 0.3s;
            font-family: 'SolaimanLipi', sans-serif !important;
        }

        .order-btn:hover {
            background: #ac4103;
            color: #fff;
            text-decoration: none;
        }

        .slider-img {
            height: 550px;
        }

        .slider-img>img {
            width: 100%;
            height: 100%;
        }

        .section-title {
            background: #f26d21;
            padding: 7px 7px;
            border-radius: 7px;
            margin-bottom: 10px;
        }

        .section-title>h4 {
            color: #fff;
            font-size: 30px;
            font-family: 'SolaimanLipi', sans-serif !important;
        }

        .name-price {
            background: #fffdfd;
            padding: 11px 13px;
            border-radius: 7px;
            border: 2px dashed #f26d21;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        .name-price>.title-box {
            border-bottom: 2px solid #fff;
        }

        .p-data-box>p {
            font-weight: 500;
        }

        .p-data-box>img {
            width: 200px;
        }

        .order-box {
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        .sp-right-img {
            width: 100px;
        }

        .p-dtls-box>table>tbody>tr {
            display: flex;
            justify-content: space-between;
            border: 1px solid #ddd;
        }

        .p-type-box {
            background: #f4f4f4;
            padding: 10px 10px;
            margin-bottom: 7px;
            border-radius: 7px;
        }

        .p-type-box>h4 {
            font-size: 16px;
            font-weight: 600;
        }

        .p-type-box>p {
            margin: 0;
            background: #ddd;
            padding: 8px 8px;
        }

        #preloader img {
            vertical-align: middle;
        }

        #preloader {
            display: inline-block;
            margin-left: 10px;
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

        .v-color-box>.color-label,
        .v-size-box>.size-label {
            cursor: pointer;
            border: 2px solid #ccc;
            padding: 2px 6px !important;
            border-radius: 5px;
            width: 100%;
            text-align: center;
            height: 30px !important;
            position: relative;
        }

        .v-color-box>input:checked+.color-label {
            border: 2px solid #02ab16 !important;
        }

        .v-color-box>input:checked+.color-label::after {
            content: '✔';
            color: white;
            font-size: 12px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .sp-price {
            font-size: 20px;
            font-weight: 600;
            color: #f26d21;
            font-family: 'Jost';
        }

        .discount-price {
            font-size: 16px;
            font-weight: 600;
            color: #909090;
            font-family: 'Jost';
        }

        .table td,
        .table th {
            font-family: 'Jost', sans-serif !important;
        }

        .shipping-title {
            font-size: 16px;
            font-weight: 700;
            font-family: 'Jost' !important;
        }
    </style>
@endpush
@section('content')
    <!-- Header Section -->
    @php
        $decimal_point_settings = \App\CPU\Helpers::get_business_settings('decimal_point_settings');
    @endphp
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mx-auto">
                    <div class="lt-slider">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                @foreach (json_decode($productLandingPage->slider_img) as $key => $image)
                                    <li data-target="#carouselExampleIndicators" data-slide-to="{{ $key }}"
                                        class="{{ $key == 0 ? 'active' : '' }}"></li>
                                @endforeach
                            </ol>
                            <div class="carousel-inner">
                                @foreach (json_decode($productLandingPage->slider_img) as $key => $image)
                                    <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                                        <div class="slider-img">
                                            <img class="d-block w-100"
                                                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/landingpage/slider') }}/{{ $image }}"
                                                alt="">
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Offer Section -->
    <section class="p-details">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="p-name">
                        <h3 class="mb-2">{{ $productLandingPage->product->name }}</h3>
                    </div>
                    <div class="p-short-details">
                        <p>{!! $productLandingPage->description !!}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @php
        $videoUrl = $productLandingPage->video_url;
        $embedUrl = '';
        $width = '100%'; // Default width
        $height = '530'; // Default height
        $col = '6'; // Default col

        if (strpos($videoUrl, 'facebook.com') !== false) {
            if (strpos($videoUrl, '/reel/') !== false) {
                // Facebook Reel URL
                $videoId = explode('/reel/', $videoUrl)[1];
                $videoId = explode('?', $videoId)[0];
                $embedUrl = "https://www.facebook.com/plugins/video.php?href=https://www.facebook.com/watch/?v={$videoId}";
                $height = '800'; // Facebook Reel height
                $col = '4';
            } elseif (strpos($videoUrl, 'watch?v=') !== false || strpos($videoUrl, '/watch/') !== false) {
                // Facebook Watch Video URL
                if (strpos($videoUrl, 'v=') !== false) {
                    $videoId = explode('v=', $videoUrl)[1];
                } else {
                    $videoId = explode('/watch/', $videoUrl)[1];
                }
                $videoId = explode('&', $videoId)[0]; // Remove trailing query parameters
                $embedUrl = "https://www.facebook.com/plugins/video.php?href=https://www.facebook.com/watch/?v={$videoId}";
                $height = '530'; // Facebook Watch video height
            }
        } elseif (strpos($videoUrl, 'youtube.com') !== false || strpos($videoUrl, 'youtu.be') !== false) {
            if (strpos($videoUrl, 'youtube.com/watch') !== false) {
                // Standard YouTube Video URL
                $videoId = explode('v=', $videoUrl)[1];
                $videoId = explode('&', $videoId)[0];
                $embedUrl = "https://www.youtube.com/embed/{$videoId}";
            } elseif (strpos($videoUrl, 'youtu.be') !== false) {
                // Shortened YouTube URL
                $videoId = explode('/', $videoUrl)[3];
                $videoId = explode('?', $videoId)[0];
                $embedUrl = "https://www.youtube.com/embed/{$videoId}";
            } elseif (strpos($videoUrl, '/embed/') !== false) {
                // YouTube Embed URL
                $embedUrl = $videoUrl;
            }
            // Adjust height for YouTube Shorts
            if (strpos($videoUrl, 'shorts') !== false) {
                $height = '700'; // YouTube Shorts height
                $col = '4';
            }
        }
    @endphp

    <!-- Video Section -->
    <div class="container video-section">
        <div class="row justify-content-center">
            <div class="col-md-{{ $col }}"> <!-- Adjust column width if needed -->
                <div style="position: relative; width: {{ $width }}; height: {{ $height }}px;">
                    <iframe style="width: 100%; height: 100%;" src="{{ $embedUrl }}" title="Video Player"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
                    </iframe>
                </div>
            </div>
        </div>
    </div>


    <!-- Benefit Section -->
    <section class="benefit-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="section-title">
                        <h4 class="text-center" style="font-family: 'SolaimanLipi', sans-serif;">এই পণ্যের বৈশিষ্ট্য</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-6 mb-3">
                            @if (json_decode($productLandingPage->feature_list) != null)
                                <ul class="benefit-list">
                                    @foreach (json_decode($productLandingPage->feature_list) as $title)
                                        <li><i class="fa fa-check-square-o"></i>{{ $title }}</li>
                                    @endforeach
                                </ul>
                            @endif

                            <a href="#orderPlace" class="w-100 order-btn">অর্ডার করতে চাই</a>
                        </div>
                        <div class="col-md-6 mb-3">
                            <div class="benefit-img">
                                {{-- <img src="{{ asset('landingpage/') }}"
                                    style="width: 100%; height:500px;" alt=""> --}}
                                <img src="{{ asset('storage/landingpage/' . $productLandingPage->feature_img) }}"
                                    style="width: 100%; height:560px;" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    {{-- Multiple section --}}
    @if ($productLandingPage->landingPageSection)
        @foreach ($productLandingPage->landingPageSection as $key => $section)
            <section class="benefit-section my-4">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="section-title">
                                <h4 class="text-center">{{ $section->section_title }}</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <div class="row align-items-center justify-content-center">
                                @if ($section->section_direction == 'left')
                                    <div class="col-md-6 mb-3">
                                        <div class="section-dtls">
                                            <p>{{ $section->section_description }}</p>
                                        </div>
                                        @if ($section->order_button == 1)
                                            <a href="#orderPlace" class="w-100 order-btn">অর্ডার করতে চাই</a>
                                        @endif
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <div class="benefit-img">
                                            <img onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/landingpage/' . $section->section_img) }}"
                                                style="width: 100%; height:560px;" alt="">
                                        </div>
                                    </div>
                                @elseif ($section->section_direction == 'right')
                                    <div class="col-md-6 mb-3">
                                        <div class="benefit-img">
                                            <img onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/landingpage/' . $section->section_img) }}"
                                                style="width: 100%; height:560px;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="section-dtls">
                                            <p>{{ $section->section_description }}</p>
                                        </div>
                                        @if ($section->order_button == 1)
                                            <a href="#orderPlace" class="w-100 order-btn">অর্ডার করতে চাই</a>
                                        @endif
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        @endforeach
    @endif

    <!-- Form Section -->
    <section id="orderPlace" class="my-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="section-title">
                                        <h4 class="text-center">অর্ডার করতে নিচের ফর্মটি সঠিক ভাবে পুরন করুন।</h4>
                                    </div>
                                </div>
                            </div>
                            <form action="{{ route('customer.sproduct.checkout') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="order-box">
                                            <div class="card-body">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <h4 class="">Billing details</h4>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <div class="form-group">
                                                            <label>Name <span class="text-danger">*</span></label>
                                                            <input type="text" class="form-control"
                                                                placeholder="Enter your name" name="name"
                                                                value="{{ old('name') }}">
                                                            @error('name')
                                                                <span class="text-danger">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <div class="form-group">
                                                            <label for="phone">@lang('Phone Number') <span
                                                                    class="text-danger">*</span></label>
                                                            <input type="number" class="form-control" id="phone"
                                                                name="phone" placeholder="@lang('Enter your phone number')" required
                                                                value="{{ old('phone') }}">
                                                            <span id="phoneFeedback" class="small text-danger"></span>
                                                            @error('phone')
                                                                <span class="text-danger">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mb-3">
                                                        <div class="form-group">
                                                            <label>Email </label>
                                                            <input type="email" class="form-control"
                                                                placeholder="Enter your email" name="email"
                                                                value="{{ old('email') }}">
                                                            @error('email')
                                                                <span class="text-danger">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 mb-3">
                                                        <div class="form-group">
                                                            <label>Shipping Address <span
                                                                    class="text-danger">*</span></label>
                                                            <textarea class="form-control" placeholder="Enter your shipping address" name="address">{{ old('address') }}</textarea>
                                                            @error('address')
                                                                <span class="text-danger">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Note </label>
                                                            <textarea class="form-control" placeholder="Enter your Note" name="order_note">{{ old('order_note') }}</textarea>
                                                            @error('order_note')
                                                                <span class="text-danger">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="size-chart">
                                                    @if ($productLandingPage->product->size_chart)
                                                        <img class="w-100"
                                                            src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $productLandingPage->product['size_chart'] }}"
                                                            class="img-fluid" alt="Product size chart image">
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="order-box">
                                            <div class="card-body">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <h4 class="">Your Product</h4>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-md-12">
                                                        <div class="name-price">
                                                            <div class="title-box">
                                                                <h4>Product</h4>
                                                            </div>
                                                            <div class="p-data-box d-flex mb-2">
                                                                <div class="mr-2">
                                                                    <img class="sp-right-img"
                                                                        src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $productLandingPage->product->thumbnail }}">
                                                                </div>
                                                                <div>
                                                                    <p class="m-0">
                                                                        {{ $productLandingPage->product->name }} <i
                                                                            class="fa fa-close"></i> 1</p>
                                                                    <div>
                                                                        <span class="sp-price">৳
                                                                            {{ \App\CPU\Helpers::get_price_range($productLandingPage->product) }}</span>
                                                                    </div>
                                                                    @if ($productLandingPage->product->discount > 0)
                                                                        <span class="discount-price">
                                                                            <del>৳
                                                                                {{ \App\CPU\Helpers::currency_converter($productLandingPage->product->unit_price) }}
                                                                            </del> -
                                                                            @if ($productLandingPage->product->discount_type == 'percent')
                                                                                {{ round($productLandingPage->product->discount, $decimal_point_settings) }}%
                                                                            @elseif($productLandingPage->product->discount_type == 'flat')
                                                                                {{ \App\CPU\Helpers::currency_converter($productLandingPage->product->discount) }}
                                                                            @endif
                                                                        </span>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                            <div class="p-variant">
                                                                @if (count(json_decode($productLandingPage->product->colors)) > 0)
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <h4 style="font-size: 18px;">Color
                                                                            </h4>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <div class="d-flex">
                                                                                @foreach (json_decode($productLandingPage->product->colors) as $key => $color)
                                                                                    <div class="v-color-box">
                                                                                        <input type="radio"
                                                                                            id="{{ $productLandingPage->product->id }}-color-{{ $key }}"
                                                                                            checked name="color"
                                                                                            value="{{ $color }}"
                                                                                            @if ($key == 0) checked @endif>
                                                                                        <label
                                                                                            style="background: {{ $color }}"
                                                                                            for="{{ $productLandingPage->product->id }}-color-{{ $key }}"
                                                                                            class="color-label"></label>
                                                                                    </div>
                                                                                @endforeach
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                                @php
                                                                    $qty = 0;
                                                                    if (!empty($productLandingPage->product)) {
                                                                        foreach (
                                                                            json_decode(
                                                                                $productLandingPage->product->variation,
                                                                            )
                                                                            as $key => $variation
                                                                        ) {
                                                                            $qty += $variation->qty;
                                                                        }
                                                                    }
                                                                @endphp
                                                                @foreach (json_decode($productLandingPage->product->choice_options) as $key => $choice)
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <h4 style="font-size: 18px; margin:5px;">
                                                                                {{ $choice->title }}</h4>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <div class="d-flex">
                                                                                @foreach ($choice->options as $key => $option)
                                                                                    <div class="v-size-box">
                                                                                        <input type="radio"
                                                                                            id="{{ $choice->name }}-{{ $option }}"
                                                                                            name="{{ $choice->name }}"
                                                                                            value="{{ $option }}"
                                                                                            @if ($key == 0) checked @endif>
                                                                                        <label
                                                                                            for="{{ $choice->name }}-{{ $option }}"
                                                                                            class="size-label">{{ $option }}</label>
                                                                                    </div>
                                                                                @endforeach
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <input type="hidden" name="price"
                                                        value="{{ $productLandingPage->product->unit_price }}">
                                                    <input type="hidden" name="quantity" value="1">
                                                    <input type="hidden" name="tax"
                                                        value="{{ $productLandingPage->product->tax }}">
                                                    <input type="hidden" name="discount"
                                                        value="{{ $productLandingPage->product->discount }}">
                                                    <input type="hidden" name="product_id"
                                                        value="{{ $productLandingPage->product->id }}">
                                                    <div class="col-md-12">
                                                        <div class="name-price mb-3">
                                                            <div class="title-box">
                                                                <h4>Your order</h4>
                                                            </div>
                                                            <div class="p-dtls-box">
                                                                <table class="mt-4 table">
                                                                    <tr>
                                                                        <th>Subtotal :</th>
                                                                        <td id="subtotal">
                                                                            {{ \App\CPU\Helpers::get_price_range($productLandingPage->product) }}
                                                                            <span>৳</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>

                                                                        <td>
                                                                            <h5 class="shipping-title">Shipping :</h5>
                                                                            <ul class="p-0 m-0">
                                                                                @foreach (\App\Model\ShippingMethod::where(['status' => 1])->get() as $shipping)
                                                                                    <li style="list-style: none;">
                                                                                        <div class="form-check">
                                                                                            <input
                                                                                                class="form-check-input shipping-method"
                                                                                                type="radio"
                                                                                                name="shipping_method"
                                                                                                id="shipping_{{ $shipping['id'] }}"
                                                                                                data-cost="{{ $shipping['cost'] }}"
                                                                                                value="{{ $shipping['id'] }}" />
                                                                                            <label class="form-check-label"
                                                                                                for="shipping_{{ $shipping['id'] }}">
                                                                                                {{ $shipping['title'] . ' ' . \App\CPU\Helpers::currency_converter($shipping['cost']) }}
                                                                                            </label>
                                                                                        </div>
                                                                                    </li>
                                                                                @endforeach
                                                                            </ul>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Total:</th>
                                                                        <td>
                                                                            <span
                                                                                id="total">{{ \App\CPU\Helpers::get_price_range($productLandingPage->product) }}
                                                                                <span>
                                                                                    ৳</span></span>
                                                                            <div id="preloader" style="display: none;">
                                                                                <img src="{{ asset('assets/front-end/img/loader_.gif') }}"
                                                                                    alt="Loading..." width="20">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="p-type-box">
                                                                    <h4>ক্যাশঅন ডেলিভারি</h4>
                                                                    <p>Pay with cash upon delivery.</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="submit" class="w-100 btn btn-primary">Place
                                                            Order</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 mx-auto">
                    <div class="form-group my-3">
                        <a href="{{ route('home') }}" class="btn btn-primary">Get More Products</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('scripts')
    @php
        $price = \App\CPU\Helpers::get_price_range($productLandingPage->product);
        $cleanPrice = floatval(str_replace(',', '', $price));
        $shippingMethods = \App\Model\ShippingMethod::where(['status' => 1])->get();
    @endphp

    <script>
        const unitPrice = {{ $cleanPrice }};
        console.log(unitPrice);
        // Pre-converted shipping costs from the backend
        const shippingPrices = {
            @foreach ($shippingMethods as $shipping)
                "{{ $shipping['id'] }}": parseFloat("{{ \App\CPU\Helpers::currency_converter2($shipping['cost']) }}"),
            @endforeach
        };

        document.addEventListener('DOMContentLoaded', function() {
            const shippingRadios = document.querySelectorAll('.shipping-method');
            const totalElement = document.getElementById('total');
            const preloader = document.getElementById('preloader');

            // Update total price
            function updateTotal(shippingCost) {
                preloader.style.display = 'inline-block'; // Show preloader
                setTimeout(function() {
                    // Calculate the new total using pre-converted values
                    const total = unitPrice + shippingCost;
                    console.log(unitPrice);


                    // Update the total element with the new total
                    totalElement.innerHTML = total.toFixed(2) +
                        "<span> ৳</span>"; // Assuming 2 decimal points
                    preloader.style.display = 'none'; // Hide preloader after update
                }, 1500); // Simulate a delay for 1.5 seconds
            }

            // Listen for changes in the shipping method
            shippingRadios.forEach(function(radio) {
                radio.addEventListener('change', function() {
                    const shippingCost = parseFloat(shippingPrices[this
                        .value]); // Get pre-converted shipping cost
                    updateTotal(shippingCost);
                });
            });
        });
    </script>
    <script>
        document.getElementById('phone').addEventListener('input', function() {
            const phoneInput = this.value;
            const phoneFeedback = document.getElementById('phoneFeedback');
            const regex = /^(01[3-9]\d{8})$/;

            if (phoneInput === '') {
                phoneFeedback.textContent = '';
            } else if (!regex.test(phoneInput)) {
                phoneFeedback.classList.add('text-danger');
                phoneFeedback.textContent = 'Please enter a valid Bangladeshi phone number (e.g. 0171XXXXXXX)';
            } else {
                phoneFeedback.textContent = 'Valid phone number!';
                phoneFeedback.classList.remove('text-danger');
                phoneFeedback.classList.add('text-success');
            }
        });

        // Also validate when the field loses focus
        document.getElementById('phone').addEventListener('blur', function() {
            const phoneInput = this.value;
            const phoneFeedback = document.getElementById('phoneFeedback');
            const regex = /^(01[3-9]\d{8})$/;

            if (phoneInput === '') {
                phoneFeedback.textContent = 'Phone number is required';
            } else if (!regex.test(phoneInput)) {
                phoneFeedback.textContent = 'Please enter a valid Bangladeshi phone number (e.g. 0171XXXXXXX)';
            }
        });
    </script>
@endpush

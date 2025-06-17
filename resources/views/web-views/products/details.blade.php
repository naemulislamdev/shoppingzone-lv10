@extends('layouts.front-end.app')

@section('title', $product['name'])

@push('css_or_js')
    <meta name="description" content="{{ $product->slug }}">
    <meta name="keywords" content="@foreach (explode(' ', $product['name']) as $keyword) {{ $keyword . ' , ' }} @endforeach">
    @if ($product->added_by == 'seller')
        <meta name="author" content="{{ $product->seller->shop ? $product->seller->shop->name : $product->seller->f_name }}">
    @elseif($product->added_by == 'admin')
        <meta name="author" content="{{ $web_config['name']->value }}">
    @endif
    <!-- Viewport-->

    @if ($product['meta_image'] != null)
        <meta property="og:image" content="{{ asset('storage/product/meta') }}/{{ $product->meta_image }}" />
        <meta property="twitter:card" content="{{ asset('storage/product/meta') }}/{{ $product->meta_image }}" />
    @else
        <meta property="og:image" content="{{ asset('storage/product/thumbnail') }}/{{ $product->thumbnail }}" />
        <meta property="twitter:card" content="{{ asset('storage/product/thumbnail/') }}/{{ $product->thumbnail }}" />
    @endif

    @if ($product['meta_title'] != null)
        <meta property="og:title" content="{{ $product->meta_title }}" />
        <meta property="twitter:title" content="{{ $product->meta_title }}" />
    @else
        <meta property="og:title" content="{{ $product->name }}" />
        <meta property="twitter:title" content="{{ $product->name }}" />
    @endif
    <meta property="og:url" content="{{ route('product', [$product->slug]) }}">

    @if ($product['meta_description'] != null)
        <meta property="twitter:description" content="{{ strip_tags($product['meta_description']) }}">
        <meta property="og:description" content="{{ strip_tags($product['meta_description']) }}">
    @else
        <meta property="og:description"
            content="@foreach (explode(' ', $product['name']) as $keyword) {{ $keyword . ' , ' }} @endforeach">
        <meta property="twitter:description"
            content="@foreach (explode(' ', $product['name']) as $keyword) {{ $keyword . ' , ' }} @endforeach">
    @endif
    <meta property="twitter:url" content="{{ route('product', [$product->slug]) }}">

@endpush

@section('content')
    <style>
        .owl-carousel .owl-dots.disabled,
        .owl-carousel .owl-nav.disabled {
            display: block;
        }

        .owl-carousel .owl-nav button.owl-prev,
        .owl-carousel .owl-nav button.owl-next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: #fff;
            /* Customize as needed */
            border: none;
            padding: 10px;
            /* Customize as needed */
            cursor: pointer;
            z-index: 1000;
            /* Ensure buttons are above other content */
        }

        .owl-carousel .owl-nav button.owl-prev {
            left: -30px;
            color: #f26d21;
            font-size: 35px;
        }

        .owl-carousel .owl-nav button.owl-next {
            right: -30px;
            color: #f26d21;
            font-size: 35px;
        }

        .owl-carousel .owl-nav button.owl-prev,
        .owl-carousel .owl-nav button.owl-next {
            outline: none;
        }

        .owl-carousel .owl-item img {
            height: 80px;
        }

        .card-header {
            padding: 6px 0px;
            margin-bottom: 0;
            background-color: rgba(0, 0, 0, .03);
            border-bottom: 0px solid rgba(0, 0, 0, .125);
        }

        .card {
            border: 0px solid rgba(0, 0, 0, .125);
        }

        .card-header {
            cursor: pointer;
        }

        .toggle-icon {
            cursor: pointer;
            background: #343a40;
            padding: 6px 24px;
            border-radius: 5px;
            color: #fff;
            font-size: 17px;
            font-weight: 800;
        }

        .btn-link {
            text-decoration: none;
            font-weight: bold;
            color: #7d7d7d;
        }

        .btn-link:hover {
            text-decoration: none;
            color: #7d7d7d;
        }

        .main-image>img {
            width: 100% !important;
        }

        .quantity-wise-price {
            color: #f26d21;
            font-size: 15px;
            font-weight: 600;
        }
    </style>
    <?php
    $overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews);
    $rating = \App\CPU\ProductManager::get_rating($product->reviews);
    $decimal_point_settings = \App\CPU\Helpers::get_business_settings('decimal_point_settings');
    ?>

    @php
        $videoUrl = $product->video_url;
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

    <section class="" style="margin-top: 88px;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="p-image">
                        @if ($product->video_shopping == 1)
                            <div class="row">
                                <div class="col-md-11">
                                    <div
                                        style="position: relative; width: {{ $width }}; height: {{ $height }}px;">
                                        <iframe style="width: 100%; height: 100%;" src="{{ $embedUrl }}"
                                            title="Video Player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
                                        </iframe>
                                    </div>
                                </div>
                            </div>
                        @else
                            <div class="row mb-2">
                                <div class="col-md-11 mx-auto">
                                    <div class="main-image mb-3 float-right" id="img-zoom">
                                        <img id="main-image"
                                            src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}"
                                            xoriginal="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}"
                                            class="img-fluid xzoom" alt="{{ $product->name }}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10 mx-auto">
                                    <div class="p-details-sub-img owl-carousel owl-theme">
                                        @if ($product->images != null)
                                            @foreach (json_decode($product->images) as $key => $photo)
                                                <div class="item">
                                                    <a href="{{ asset("storage/product/$photo") }}"
                                                        title="{{ $product->name }}">
                                                        <img src="{{ asset("storage/product/$photo") }}"
                                                            data-image="{{ asset("storage/product/$photo") }}"
                                                            class="xzoom-gallery" alt="{{ $product->name }}">
                                                    </a>
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="col-md-8 mb-3">
                    <div class="row">
                        <div class="col-md-7 mb-3">
                            <div class="p-details">
                                <h1 class="product-name mb-2">{{ $product->name }}</h1>

                                <div>
                                    <span class="product-price"><span>
                                        ৳</span> {{ \App\CPU\Helpers::get_price_range($product) }}</span>
                                </div>

                                @if ($product->discount > 0)
                                    <span class="discount-price">
                                        <del>৳ {{ \App\CPU\Helpers::currency_converter($product->unit_price) }} </del> -
                                        @if ($product->discount_type == 'percent')
                                            {{ round($product->discount, $decimal_point_settings) }}%
                                        @elseif($product->discount_type == 'flat')
                                           {{ \App\CPU\Helpers::currency_converter($product->discount) }}
                                        @endif
                                    </span>
                                @endif
                                <div class="my-2">
                                    <span class="product-code"><strong>Code:</strong> {{ $product->code }}</span>
                                </div>
                                <p class="product-description">{!! $product['short_description'] !!}</p>

                                <form id="form-{{ $product->id }}" class="mb-2">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $product->id }}">

                                    @if (count(json_decode($product->colors)) > 0)
                                        <div class="row">
                                            <div class="col-12 mb-3">
                                                <h4 style="font-size: 18px;">Color</h4>
                                            </div>
                                            @if ($product->color_variant != null)
                                                <div class="col-12 mb-3">
                                                    <div class="d-flex">
                                                        @foreach (json_decode($product->color_variant) as $key => $color)
                                                            <div class="v-color-box">
                                                                <input type="radio"
                                                                    id="{{ $product->id }}-color-{{ $key }}"
                                                                    name="color" value="{{ $color->color }}"
                                                                    @if ($key == 0) checked @endif>
                                                                <label for="{{ $product->id }}-color-{{ $key }}"
                                                                    class="color-label"
                                                                    style="background-color: {{ $color->color }}">
                                                                    <img src="{{ asset($color->image) }}"
                                                                        data-image="{{ asset($color->image) }}"
                                                                        alt="{{ $color->color }}"
                                                                        style="width:100%; height:100%;border-radius: 10px;">
                                                                </label>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            @endif
                                        </div>
                                    @endif
                                    @php
                                        $qty = 0;
                                        if (!empty($product)) {
                                            foreach (json_decode($product->variation) as $key => $variation) {
                                                $qty += $variation->qty;
                                            }
                                        }
                                    @endphp
                                    @foreach (json_decode($product->choice_options) as $key => $choice)
                                        <div class="row">
                                            <div class="col-12 mb-3">
                                                <h4 style="font-size: 18px; margin:0;">{{ $choice->title }}</h4>
                                            </div>
                                            <div class="col-12 mb-3">
                                                <div class="d-flex">
                                                    @foreach ($choice->options as $key => $option)
                                                        <div class="v-size-box">
                                                            <input type="radio"
                                                                id="{{ $choice->name }}-{{ $option }}"
                                                                name="{{ $choice->name }}" value="{{ $option }}"
                                                                @if ($key == 0) checked @endif>
                                                            <label for="{{ $choice->name }}-{{ $option }}"
                                                                class="size-label">{{ $option }}</label>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach

                                    <div class="row mb-3">
                                        <div class="col-md-4 mb-2">
                                            <div class="product-quantity d-flex align-items-center">
                                                <div class="input-group input-group--style-2 pr-3" style="width: 160px;">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-number" type="button" data-type="minus"
                                                            data-field="quantity" disabled="disabled"
                                                            style="padding: 10px">
                                                            -
                                                        </button>
                                                    </span>
                                                    <input type="text" name="quantity"
                                                        class="form-control input-number text-center cart-qty-field"
                                                        placeholder="1" value="1" min="1" max="100">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-number" type="button" data-type="plus"
                                                            data-field="quantity" style="padding: 10px">
                                                            +
                                                        </button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="d-flex justify-content-between mt-2" id="chosen_price_div">

                                                <span class="instock">Instock: {{ $product->current_stock }}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3">
                                            <button type="button" onclick="buy_now('form-{{ $product->id }}')"
                                                href="javascript:void(0);" class="w-100 common-btn border-0">Order
                                                Now</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-dark d-block w-100"
                                                onclick="addToCart('form-{{ $product->id }}')">Add to
                                                Cart</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-md-3 mx-auto mb-2">
                                        <button type="button" onclick="addWishlist('{{ $product['id'] }}')"
                                            class="btn for-hover-bg p-wishlist" style="">
                                            <i class="fa fa-heart-o mr-2" aria-hidden="true"></i>
                                            <span class="countWishlist-{{ $product['id'] }}">{{ $countWishlist }}</span>
                                        </button>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        @if ($product['size_chart'] != null && $product['size_chart'] !== 'def.png')
                                            <div class="accordion mb-3" id="accordionExample">
                                                <div class="card">
                                                    <div class="card-header d-flex justify-content-between align-items-center"
                                                        id="productSizeChart">
                                                        <h5 class="mb-0">
                                                            <button class="btn btn-link" type="button"
                                                                data-toggle="collapse" data-target="#sizeChart"
                                                                aria-expanded="true" aria-controls="sizeChart">
                                                                Size Chart
                                                            </button>
                                                        </h5>
                                                        <span class="toggle-icon" data-toggle="collapse"
                                                            data-target="#sizeChart" aria-expanded="true"
                                                            aria-controls="sizeChart"><i class="fa fa-plus"></i></span>
                                                    </div>

                                                    <div id="sizeChart" class="collapse show"
                                                        aria-labelledby="productSizeChart"
                                                        data-parent="#accordionExample">
                                                        <div class="card-body">
                                                            <div class="size-img-box">

                                                                <img src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['size_chart'] }}"
                                                                    class="img-fluid" alt="Product size chart image">


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endif
                                        <div class="accordion mb-3" id="accordionExample">
                                            <div class="card">
                                                <div class="card-header d-flex justify-content-between align-items-center"
                                                    id="productDescription">
                                                    <h5 class="mb-0">
                                                        <button class="btn btn-link" type="button"
                                                            data-toggle="collapse" data-target="#description"
                                                            aria-expanded="true" aria-controls="description">
                                                            Description
                                                        </button>
                                                    </h5>
                                                    <span class="toggle-icon" data-toggle="collapse"
                                                        data-target="#description" aria-expanded="true"
                                                        aria-controls="description"><i class="fa fa-plus"></i></span>
                                                </div>

                                                <div id="description" class="collapse show"
                                                    aria-labelledby="productDescription" data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <p>
                                                            {!! $product['details'] !!}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion" id="accordionExample">
                                            <div class="card">
                                                <div class="card-header d-flex justify-content-between align-items-center"
                                                    id="review">
                                                    <h5 class="mb-0">
                                                        <button class="btn btn-link" type="button"
                                                            data-toggle="collapse" data-target="#reviewCollapse"
                                                            aria-expanded="true" aria-controls="reviewCollapse">
                                                            Review
                                                        </button>
                                                    </h5>
                                                    <span class="toggle-icon" data-toggle="collapse"
                                                        data-target="#reviewCollapse" aria-expanded="true"
                                                        aria-controls="reviewCollapse"><i class="fa fa-plus"></i></span>
                                                </div>

                                                @php
                                                    $reviewProductId = $product->id;
                                                @endphp
                                                <div id="reviewCollapse" class="collapse" aria-labelledby="review"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        @php($reviews_of_product = App\Model\Review::where('product_id', $product->id)->paginate(2))

                                                        <div class="row pt-2 pb-3">
                                                            <div class="col-lg-3 col-md-4 ">
                                                                <div
                                                                    class=" row d-flex justify-content-center align-items-center">
                                                                    <div
                                                                        class="col-12 d-flex justify-content-center align-items-center">
                                                                        <h2 class="overall_review mb-2"
                                                                            style="font-weight: 500;font-size: 50px;">
                                                                            {{ $overallRating[1] }}
                                                                        </h2>
                                                                    </div>
                                                                    <div
                                                                        class="d-flex justify-content-center align-items-center star-rating ">
                                                                        @if (round($overallRating[0]) == 5)
                                                                            @for ($i = 0; $i < 5; $i++)
                                                                                <i
                                                                                    class="fa fa-star-o font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                        @endif
                                                                        @if (round($overallRating[0]) == 4)
                                                                            @for ($i = 0; $i < 4; $i++)
                                                                                <i
                                                                                    class="fa fa-star-o font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                            <i
                                                                                class="fa fa-star font-size-sm text-muted {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                        @endif
                                                                        @if (round($overallRating[0]) == 3)
                                                                            @for ($i = 0; $i < 3; $i++)
                                                                                <i
                                                                                    class="fa fa-star-o font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                            @for ($j = 0; $j < 2; $j++)
                                                                                <i
                                                                                    class="fa fa-star font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                        @endif
                                                                        @if (round($overallRating[0]) == 2)
                                                                            @for ($i = 0; $i < 2; $i++)
                                                                                <i
                                                                                    class="fa fa-star-o font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                            @for ($j = 0; $j < 3; $j++)
                                                                                <i
                                                                                    class="fa fa-star font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                        @endif
                                                                        @if (round($overallRating[0]) == 1)
                                                                            @for ($i = 0; $i < 4; $i++)
                                                                                <i
                                                                                    class="fa fa-star font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                            <i
                                                                                class="fa fa-star-o font-size-sm text-accent {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                        @endif
                                                                        @if (round($overallRating[0]) == 0)
                                                                            @for ($i = 0; $i < 5; $i++)
                                                                                <i
                                                                                    class="fa fa-star font-size-sm text-muted {{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}"></i>
                                                                            @endfor
                                                                        @endif
                                                                    </div>
                                                                    <div
                                                                        class="col-12 d-flex justify-content-center align-items-center mt-2">
                                                                        <span class="text-center">
                                                                            {{ $reviews_of_product->total() }}
                                                                            {{ \App\CPU\translate('ratings') }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-9 col-md-8 pt-sm-3 pt-md-0">
                                                                <div
                                                                    class="row d-flex align-items-center mb-2 font-size-sm">
                                                                    <div class="col-3 text-nowrap "><span
                                                                            class="d-inline-block align-middle text-body">{{ \App\CPU\translate('Excellent') }}</span>
                                                                    </div>
                                                                    <div class="col-8">
                                                                        <div class="progress text-body"
                                                                            style="height: 5px;">
                                                                            <div class="progress-bar " role="progressbar"
                                                                                style="background-color: {{ $web_config['primary_color'] }} !important;width: <?php echo $widthRating = $rating[0] != 0 ? ($rating[0] / $overallRating[1]) * 100 : 0; ?>%;"
                                                                                aria-valuenow="60" aria-valuemin="0"
                                                                                aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-1 text-body">
                                                                        <span
                                                                            class=" {{ Session::get('direction') === 'rtl' ? 'mr-3 float-left' : 'ml-3 float-right' }} ">
                                                                            {{ $rating[0] }}
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="row d-flex align-items-center mb-2 text-body font-size-sm">
                                                                    <div class="col-3 text-nowrap "><span
                                                                            class="d-inline-block align-middle ">{{ \App\CPU\translate('Good') }}</span>
                                                                    </div>
                                                                    <div class="col-8">
                                                                        <div class="progress" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar"
                                                                                style="background-color: {{ $web_config['primary_color'] }} !important;width: <?php echo $widthRating = $rating[1] != 0 ? ($rating[1] / $overallRating[1]) * 100 : 0; ?>%; background-color: #a7e453;"
                                                                                aria-valuenow="27" aria-valuemin="0"
                                                                                aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <span
                                                                            class="{{ Session::get('direction') === 'rtl' ? 'mr-3 float-left' : 'ml-3 float-right' }}">
                                                                            {{ $rating[1] }}
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="row d-flex align-items-center mb-2 text-body font-size-sm">
                                                                    <div class="col-3 text-nowrap"><span
                                                                            class="d-inline-block align-middle ">{{ \App\CPU\translate('Average') }}</span>
                                                                    </div>
                                                                    <div class="col-8">
                                                                        <div class="progress" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar"
                                                                                style="background-color: {{ $web_config['primary_color'] }} !important;width: <?php echo $widthRating = $rating[2] != 0 ? ($rating[2] / $overallRating[1]) * 100 : 0; ?>%; background-color: #ffda75;"
                                                                                aria-valuenow="17" aria-valuemin="0"
                                                                                aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <span
                                                                            class="{{ Session::get('direction') === 'rtl' ? 'mr-3 float-left' : 'ml-3 float-right' }}">
                                                                            {{ $rating[2] }}
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="row d-flex align-items-center mb-2 text-body font-size-sm">
                                                                    <div class="col-3 text-nowrap "><span
                                                                            class="d-inline-block align-middle">{{ \App\CPU\translate('Below Average') }}</span>
                                                                    </div>
                                                                    <div class="col-8">
                                                                        <div class="progress" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar"
                                                                                style="background-color: {{ $web_config['primary_color'] }} !important;width: <?php echo $widthRating = $rating[3] != 0 ? ($rating[3] / $overallRating[1]) * 100 : 0; ?>%; background-color: #fea569;"
                                                                                aria-valuenow="9" aria-valuemin="0"
                                                                                aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <span
                                                                            class="{{ Session::get('direction') === 'rtl' ? 'mr-3 float-left' : 'ml-3 float-right' }}">
                                                                            {{ $rating[3] }}
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="row d-flex align-items-center text-body font-size-sm">
                                                                    <div class="col-3 text-nowrap"><span
                                                                            class="d-inline-block align-middle ">{{ \App\CPU\translate('Poor') }}</span>
                                                                    </div>
                                                                    <div class="col-8">
                                                                        <div class="progress" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar"
                                                                                style="background-color: {{ $web_config['primary_color'] }} !important;backbround-color:{{ $web_config['primary_color'] }};width: <?php echo $widthRating = $rating[4] != 0 ? ($rating[4] / $overallRating[1]) * 100 : 0; ?>%;"
                                                                                aria-valuenow="4" aria-valuemin="0"
                                                                                aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-1">
                                                                        <span
                                                                            class="{{ Session::get('direction') === 'rtl' ? 'mr-3 float-left' : 'ml-3 float-right' }}">
                                                                            {{ $rating[4] }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row pb-4 mb-3">
                                                            <div
                                                                style="display: block;width:100%;text-align: center;background: #F3F4F5;border-radius: 5px;padding:5px;">
                                                                <span
                                                                    class="text-capitalize">{{ \App\CPU\translate('Product Review') }}</span>
                                                            </div>
                                                        </div>
                                                        <div class="row pb-4">
                                                            <div class="col-12" id="product-review-list">
                                                                @if (count($product->reviews) == 0)
                                                                    <div class="card">
                                                                        <div class="card-body">
                                                                            <h6 class="text-danger text-center">
                                                                                {{ \App\CPU\translate('product_review_not_available') }}
                                                                            </h6>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                            @if (count($product->reviews) > 0)
                                                                <div class="col-12">
                                                                    <div
                                                                        class="card-footer d-flex justify-content-center align-items-center">
                                                                        <button class="btn"
                                                                            style="background: {{ $web_config['primary_color'] }}; color: #ffffff"
                                                                            onclick="load_review()">{{ \App\CPU\translate('view more') }}</button>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="p-details-contact-section">
                                <div class="contact-box d-flex justify-content-between">
                                    <div class="box1">
                                        <p><i class="fa fa-phone"></i> contact:</p>
                                        <p><i class="fa fa-motorcycle"></i> Inside Dhaka:</p>
                                        <p><i class="fa fa-truck"></i> Outside Dhaka:</p>
                                        <p><i class="fa fa-money"></i> Cash on Delivery:</p>
                                        <p><i class="fa fa-refresh"></i> Refund Rules:</p>
                                    </div>
                                    <div class="box1">
                                        <a href="tel:{{ $web_config['phone']->value }}">
                                            <p>{{ $web_config['phone']->value }}</p>
                                        </a>
                                        <p>2-3 working days</p>
                                        <p>3-4 working days</p>
                                        <p>Available</p>
                                        <p>Within 7 Days<a href="{{ route('privacy-policy') }}"> View Policy</a></p>
                                    </div>
                                </div>
                                <div class="pay-method mb-3">
                                    <span>Payment</span>
                                    <img src="{{ asset('assets/front-end/images/payment/payment.png') }}"
                                        alt="">
                                </div>
                            </div>
                            @if ($product->video_shopping == 0)
                                @if ($product['video_url'])
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="video-product">
                                                <div
                                                    style="position: relative; width: {{ $width }}; height: {{ $height }}px;">
                                                    <iframe style="width: 100%; height: 100%;" src="{{ $embedUrl }}"
                                                        title="Video Player" frameborder="0"
                                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
                                                    </iframe>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <section>
        <div class="container">
            <div class="row mb-3">
                <div class="col text-center">
                    <div class="section-heading-title">
                        <h3>Related products</h3>
                        <div class="heading-border"></div>
                    </div>
                    <div class="grid-controls">
                        <button class="grid-btn" data-columns="6" data-category="category3">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn" data-columns="4" data-category="category3">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn" data-columns="3" data-category="category3">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn" data-columns="2" data-category="category3">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                    </div>
                    <div class="grid-controls mobile-grid-controls">
                        <button class="grid-btn grid-btn-mobile" data-columns="12" data-category="category3">
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn grid-btn-mobile" data-columns="6" data-category="category3">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row product-grid">
                <!-- Your product columns go here -->
                @if (count($relatedProducts) > 0)
                    @foreach ($relatedProducts as $key => $product)
                        <div class="col-md-2 col-sm-6 product-column" data-category="category3">
                            <div class="product-box product-box-col-2" data-category="category3">
                                <div class="product-image2 product-image2-col-2" data-category="category3">
                                    @if ($product->discount > 0)
                                        <div class="discount-box float-end">
                                            <span>
                                                @if ($product->discount_type == 'percent')
                                                    {{ round($product->discount, $decimal_point_settings) }}%
                                                @elseif($product->discount_type == 'flat')
                                                    {{ \App\CPU\Helpers::currency_converter($product->discount) }}
                                                @endif
                                            </span>
                                        </div>
                                    @endif
                                    <a href="{{ route('product', $product->slug) }}">
                                        <img class="pic-1"
                                            src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}"
                                            alt="{{ $product->name }}">
                                        <img class="pic-2"
                                            src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}"
                                            alt="{{ $product->name }}">
                                    </a>
                                    <ul class="social">
                                        <li><a href="{{ route('product', $product->slug) }}" data-tip="Quick View"><i
                                                    class="fa fa-eye"></i></a></li>
                                        <li><a href="javascript:void(0);" data-toggle="modal"
                                                data-target="#addToCartModal_{{ $product->id }}"
                                                data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a>
                                        </li>
                                    </ul>
                                    <button type="button" style="cursor: pointer;" class="buy-now"
                                        onclick="buy_now('form-{{ $product->id }}')">Buy Now</button>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a
                                            href="{{ route('product', $product->slug) }}">{{ Str::limit($product['name'], 23) }}</a>
                                    </h3>
                                    <div class="price d-flex justify-content-center align-content-center">
                                        @if ($product->discount > 0)
                                            <span
                                                class="mr-2">{{ \App\CPU\Helpers::currency_converter(
                                                    $product->unit_price - \App\CPU\Helpers::get_product_discount($product, $product->unit_price),
                                                ) }}</span>
                                            <del>{{ \App\CPU\Helpers::currency_converter($product->unit_price) }}</del>
                                        @else
                                            <span>{{ \App\CPU\Helpers::currency_converter($product->unit_price) }}</span>
                                        @endif
                                    </div>
                                </div>
                                @php($overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews))
                                <div class="rating-show justify-content-between text-center">
                                    <span class="d-inline-block font-size-sm text-body">
                                        @for ($inc = 0; $inc < 5; $inc++)
                                            @if ($inc < $overallRating[0])
                                                <i class="fa fa-star" style="color:#fea569 !important"></i>
                                            @else
                                                <i class="fa fa-star-o" style="color:#fea569 !important"></i>
                                            @endif
                                        @endfor
                                        <label class="badge-style">( {{ $product->reviews_count }} )</label>
                                    </span>
                                </div>
                            </div>
                        </div>
                        {{-- AddToCart Modal --}}
                        <div class="modal fade" id="addToCartModal_{{ $product->id }}" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <form id="form-{{ $product->id }}" class="mb-2">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $product->id }}">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="product-modal-box d-flex align-items-center mb-3">
                                                <div class="img mr-3">
                                                    <img src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}"
                                                        alt="{{ $product->name }}" style="width: 80px;">
                                                </div>
                                                <div class="p-name">
                                                    <h5 class="title">{{ Str::limit($product['name'], 23) }}</h5>
                                                    <span
                                                        class="mr-2">{{ \App\CPU\Helpers::currency_converter(
                                                            $product->unit_price - \App\CPU\Helpers::get_product_discount($product, $product->unit_price),
                                                        ) }}</span>
                                                </div>
                                            </div>
                                            @if (count(json_decode($product->colors)) > 0)
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h4>Color</h4>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="d-flex">
                                                            @foreach (json_decode($product->colors) as $key => $color)
                                                                <div class="v-color-box">
                                                                    <input type="radio"
                                                                        id="{{ $product->id }}-color-{{ $key }}"
                                                                        name="color" value="{{ $color }}"
                                                                        @if ($key == 0) checked @endif>
                                                                    <label style="background: {{ $color }}"
                                                                        for="{{ $product->id }}-color-{{ $key }}"
                                                                        class="color-label"></label>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif

                                            @if (count(json_decode($product->choice_options)) > 0)
                                                @foreach (json_decode($product->choice_options) as $key => $choice)
                                                    <div class="row mb-3">
                                                        <div class="col-12">
                                                            <h4 style="font-size: 18px; margin:0;">{{ $choice->title }}
                                                            </h4>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="d-flex">
                                                                @foreach ($choice->options as $key => $option)
                                                                    <div class="v-size-box">
                                                                        <input type="radio"
                                                                            id="{{ $product->id }}-size-{{ $key }}"
                                                                            name="{{ $choice->name }}"
                                                                            value="{{ $option }}"
                                                                            @if ($key == 0) checked @endif>
                                                                        <label
                                                                            for="{{ $product->id }}-size-{{ $key }}"
                                                                            class="size-label">{{ $option }}</label>
                                                                    </div>
                                                                @endforeach
                                                            </div>
                                                        </div>

                                                    </div>
                                                @endforeach
                                            @endif
                                            <div class="row">
                                                <div class="col-md-10 mx-auto">
                                                    <div class="product-quantity d-flex align-items-center">
                                                        <div class="input-group input-group--style-2 pr-3"
                                                            style="width: 160px;">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-number" type="button"
                                                                    data-type="minus" data-field="quantity"
                                                                    disabled="disabled" style="padding: 10px">
                                                                    -
                                                                </button>
                                                            </span>
                                                            <input type="text" name="quantity"
                                                                class="form-control input-number text-center cart-qty-field"
                                                                placeholder="1" value="1" min="1"
                                                                max="100">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-number" type="button"
                                                                    data-type="plus" data-field="quantity"
                                                                    style="padding: 10px">
                                                                    +
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="{{ route('product', $product->slug) }}"
                                                class="btn btn-secondary">View Details</a>
                                            <button type="button" class="btn btn-danger"
                                                onclick="addToCart('form-{{ $product->id }}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="text-danger text-center">{{ trans('messages.similar') }}
                                    {{ trans('messages.product_not_available') }}</h6>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </section>
@endsection
@push('scripts')
    <script>
        //Product description collapse
        $(document).ready(function() {
            $('.collapse').on('show.bs.collapse', function() {
                $(this).prev('.card-header').find('.toggle-icon').html('<i class="fa fa-minus"></i>');
            });

            $('.collapse').on('hide.bs.collapse', function() {
                $(this).prev('.card-header').find('.toggle-icon').html('<i class="fa fa-plus"></i>');
            });
        });
    </script>
    <script type="text/javascript">
        cartQuantityInitialize();
        getVariantPrice();
        $('#add-to-cart-form input').on('change', function() {
            getVariantPrice();
        });

        function showInstaImage(link) {
            $("#attachment-view").attr("src", link);
            $('#show-modal-view').modal('toggle')
        }
    </script>
    <script>
        $(document).ready(function() {
            load_review();
        });
        let load_review_count = 1;

        function load_review() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                type: "post",
                url: '{{ route('review-list-product') }}',
                data: {
                    product_id: {{ $reviewProductId }},
                    offset: load_review_count
                },
                success: function(data) {
                    // console.log(data);

                    $('#product-review-list').append(data.productReview)
                    if (data.not_empty == 0 && load_review_count > 2) {
                        toastr.info('{{ \App\CPU\translate('no more review remain to load') }}', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        // console.log('iff');
                    }
                }
            });
            load_review_count++
        }
    </script>
    {{-- Messaging with shop seller --}}
    <script>
        $('#contact-seller').on('click', function(e) {
            // $('#seller_details').css('height', '200px');
            $('#seller_details').animate({
                'height': '276px'
            });
            $('#msg-option').css('display', 'block');
        });
        $('#sendBtn').on('click', function(e) {
            e.preventDefault();
            let msgValue = $('#msg-option').find('textarea').val();
            let data = {
                message: msgValue,
                shop_id: $('#msg-option').find('textarea').attr('shop-id'),
                seller_id: $('.msg-option').find('.seller_id').attr('seller-id'),
            }
            if (msgValue != '') {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "post",
                    url: '{{ route('messages_store') }}',
                    data: data,
                    success: function(respons) {
                        // console.log('send successfully');
                    }
                });
                $('#chatInputBox').val('');
                $('#msg-option').css('display', 'none');
                $('#contact-seller').find('.contact').attr('disabled', '');
                $('#seller_details').animate({
                    'height': '125px'
                });
                $('#go_to_chatbox').css('display', 'block');
            } else {
                // console.log('say something');
            }
        });
        $('#cancelBtn').on('click', function(e) {
            e.preventDefault();
            $('#seller_details').animate({
                'height': '114px'
            });
            $('#msg-option').css('display', 'none');
        });
    </script>

    {{-- <script type="text/javascript"
        src="https://platform-api.sharethis.com/js/sharethis.js#property=5f55f75bde227f0012147049&product=sticky-share-buttons"
        async="async"></script> --}}

    <script src="https://ai.szbdfinancing.com/static/js/product-sdk.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const productAPI = new ProductAPI("https://ai.szbdfinancing.com");

            async function loadProduct() {
                const product = await productAPI.analyzeProduct({{ $product->id }}, "view");
                console.log(product);
            }

            loadProduct();
        });
    </script>
@endpush

@extends('layouts.front-end.app')
@section('title', 'Campain products')
@push('css_or_js')
    <meta property="og:image" content="{{ asset('storage/company') }}/{{ $web_config['web_logo'] }}" />
    <meta property="og:title" content="Products of {{ $web_config['name'] }} " />
    <meta property="og:url" content="{{ env('APP_URL') }}">
    <meta property="og:description" content="{!! substr($web_config['about']->value, 0, 100) !!}">

    <meta property="twitter:card" content="{{ asset('storage/company') }}/{{ $web_config['web_logo'] }}" />
    <meta property="twitter:title" content="Products of {{ $web_config['name'] }}" />
    <meta property="twitter:url" content="{{ env('APP_URL') }}">
    <meta property="twitter:description" content="{!! substr($web_config['about']->value, 0, 100) !!}">
    <style>
        .countdown {
            display: flex;
            gap: 8px;
            align-items: center;
            justify-content: center;
            background: #4c4c4c;
            border-radius: 10px;
            margin-top: 5px;
            color: #fff;
        }

        .time {
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 2rem;
        }

        .countdown>.time>span {
            font-size: 22px;
        }

        .countdown>.time>h5 {
            font-size: 14px;
        }

        .product-box-col-2 {
            height: 540px;
        }

        .product-box-col-3 {
            height: 710px;
        }

        .product-box-col-4 {
            height: 890px;
        }

        .product-box-col-6 {
            height: 1274px;
        }
    </style>
@endpush
@section('content')
    <section class="py-3">
        <div class="container">
            {{-- Product Filter section --}}
            @include('layouts.front-end.partials.product_filter')
            {{-- Product grid system section --}}
            <div class="row mb-3">
                <div class="col text-center">
                    <div class="section-heading-title">
                        <h3>Campaing Products</h3>
                        <div class="heading-border"></div>
                    </div>
                    <div class="grid-controls">
                        <button class="grid-btn" data-columns="6" data-category="category">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn" data-columns="4" data-category="category">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn" data-columns="3" data-category="category">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn" data-columns="2" data-category="category">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                    </div>
                    <div class="grid-controls mobile-grid-controls">
                        <button class="grid-btn grid-btn-mobile" data-columns="12" data-category="category">
                            <div class="grid-icon"></div>
                        </button>
                        <button class="grid-btn grid-btn-mobile" data-columns="6" data-category="category">
                            <div class="grid-icon"></div>
                            <div class="grid-icon"></div>
                        </button>
                    </div>
                </div>
            </div>

            @if (count($campainProducts) > 0)
                <div class="row product-grid" id="campain-ajax-products">
                    @include('web-views.products.campain_ajax_products',['products'=> $campainProducts])
                </div>
                <hr class="my-3">
                <div class="row">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <nav class="d-flex justify-content-between pt-2" aria-label="Page navigation">
                            {!! $campainProducts->links() !!}
                        </nav>
                    </div>
                </div>
            @else
                <div class="text-center pt-5">
                    <h2>Product Coming Soon!</h2>
                </div>
            @endif
        </div>
    </section>
@endsection
@push('scripts')
    <script>
        function searchByPrice() {
            let min = $('#min_price').val();
            let max = $('#max_price').val();
            $.get({
                url: '{{url('/')}}/products',
                data: {
                    min_price: min,
                    max_price: max,
                },
                dataType: 'json',
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (response) {
                    $('#campain-ajax-products').html(response.view);
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        }
        //When scroll display block in filter section other wise display none
        window.addEventListener('scroll', function() {
            const header = document.getElementById('filter-box');
            if (window.scrollY > 100) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    </script>
    <script>
        cartQuantityInitialize();
    </script>

@endpush

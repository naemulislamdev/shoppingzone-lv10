@extends('layouts.front-end.app')

@section('title', \App\CPU\translate('Order Complete'))

@push('css_or_js')
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

        body {
            font-family: 'Montserrat', sans-serif;
        }

        .card {
            border: none;
        }

        .table {
    box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
    border-radius: 10px;
    margin-top: 15px;
    border: 2px solid #f26d21;
}
    </style>
@endpush

@section('content')
    <div class="container mt-5 mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-10 col-lg-10">
                <div class="card">
                    @if (auth('customer')->check())
                        <div class=" p-5">
                            <div class="row">
                                <div class="col-md-12">
                                    <h5 style="font-size: 20px; font-weight: 900; text-align:center;">
                                        {{ \App\CPU\translate('your_order_has_been_placed_successfully!') }}
                                        !</h5>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <div class="col-12">
                                    <center>
                                        <i style="font-size: 100px; color: #0f9d58" class="fa fa-check-circle"></i>
                                    </center>
                                </div>
                            </div>

                            <span class="font-weight-bold d-block mt-4"
                                style="font-size: 17px;text-align:center;">{{ \App\CPU\translate('Hello') }},
                                {{ auth('customer')->user()->f_name }}</span>
                            <span
                                style="text-align:center; display: block; margin-bottom: 8px;">{{ \App\CPU\translate('You order has been confirmed and will be shipped according to the method you selected!') }}</span>
                            @php($summary = \App\CPU\OrderManager::order_summary($order))
                            @php($extra_discount = 0)
                            <?php
                            if ($order['extra_discount_type'] == 'percent') {
                                $extra_discount = ($summary['subtotal'] / 100) * $order['extra_discount'];
                            } else {
                                $extra_discount = $order['extra_discount'];
                            }
                            ?>
                            <div class="row mb-3">
                                <div class="col-md-7 mx-auto">
                                    <div class="product-details" style="box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;">
                                        @foreach ($order->details as $key => $detail)
                                            @php($product = json_decode($detail->product_details, true))
                                            <tr>
                                                <div class="row mb-2">
                                                    <div class="col-md-12 d-flex">
                                                        <div class="col-4 for-tab-img">
                                                            <img class="d-block mr-2"
                                                                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                                src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}"
                                                                alt="VR Collection" width="60">
                                                        </div>
                                                        <div class="col-8 for-glaxy-name" style="vertical-align:middle;">

                                                            <a href="{{ route('product', [$product['slug']]) }}">
                                                                {{ isset($product['name']) ? Str::limit($product['name'], 40) : '' }}
                                                            </a><br>
                                                            @if ($detail->variant)
                                                            <span>{{ \App\CPU\translate('variant') }} : </span>
                                                            {{ $detail->variant }}
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </tr>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <div class="col-md-8 col-lg-5">
                                    <table class="table table-borderless">
                                        <tbody class="totals">
                                            <tr>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span
                                                            class="product-qty ">{{ \App\CPU\translate('Order Id') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span>#{{ $order->id }}</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span class="product-qty ">{{ \App\CPU\translate('Item') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span>{{ $order->details->count() }}</span>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span
                                                            class="product-qty ">{{ \App\CPU\translate('Subtotal') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span>{{ \App\CPU\Helpers::currency_converter($summary['subtotal']) }}</span>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span
                                                            class="product-qty ">{{ \App\CPU\translate('text_fee') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span>{{ \App\CPU\Helpers::currency_converter($summary['total_tax']) }}</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            @if ($order->order_type == 'default_type')
                                                <tr>
                                                    <td>
                                                        <div
                                                            class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                            <span class="product-qty ">{{ \App\CPU\translate('Shipping') }}
                                                                {{ \App\CPU\translate('Fee') }}</span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div
                                                            class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                            <span>{{ \App\CPU\Helpers::currency_converter($summary['total_shipping_cost']) }}</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endif

                                            <tr>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span class="product-qty ">{{ \App\CPU\translate('Discount') }}
                                                            {{ \App\CPU\translate('on_product') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span>-
                                                            {{ \App\CPU\Helpers::currency_converter($summary['total_discount_on_product']) }}</span>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span class="product-qty ">{{ \App\CPU\translate('Coupon') }}
                                                            {{ \App\CPU\translate('Discount') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span>-
                                                            {{ \App\CPU\Helpers::currency_converter($order->discount_amount) }}</span>
                                                    </div>
                                                </td>
                                            </tr>

                                            @if ($order->order_type != 'default_type')
                                                <tr>
                                                    <td>
                                                        <div
                                                            class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                            <span class="product-qty ">{{ \App\CPU\translate('extra') }}
                                                                {{ \App\CPU\translate('Discount') }}</span>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <div
                                                            class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                            <span>-
                                                                {{ \App\CPU\Helpers::currency_converter($extra_discount) }}</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endif

                                            <tr class="border-top border-bottom">
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                                        <span
                                                            class="font-weight-bold">{{ \App\CPU\translate('Total') }}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div
                                                        class="text-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                                                        <span
                                                            class="font-weight-bold amount ">{{ \App\CPU\Helpers::currency_converter($order->order_amount + $summary['total_shipping_cost']) }}</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <a href="{{ route('home') }}" class="btn btn-primary w-100">
                                        {{ \App\CPU\translate('go_to_shopping') }}
                                    </a>
                                </div>
                                <div class="col-6">
                                    <a href="{{ route('account-oder') }}" class="btn btn-secondary pull-right w-100">
                                        {{ \App\CPU\translate('check_orders') }}
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

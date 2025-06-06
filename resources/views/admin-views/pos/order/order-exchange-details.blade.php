@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Order Details'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .sellerName {
            height: fit-content;
            margin-top: 10px;
            margin-left: 10px;
            font-size: 16px;
            border-radius: 25px;
            text-align: center;
            padding-top: 10px;
        }
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header d-print-none p-3" style="background: white">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-no-gutter">
                            <li class="breadcrumb-item"><a class="breadcrumb-link"
                                                           href="{{route('admin.orders.list',['status'=>'all'])}}">{{\App\CPU\translate('Orders')}}</a>
                            </li>
                            <li class="breadcrumb-item active"
                                aria-current="page">{{\App\CPU\translate('Order')}} {{\App\CPU\translate('details')}} </li>
                        </ol>
                    </nav>

                    <div class="d-sm-flex align-items-sm-center">
                        <h1 class="page-header-title">{{\App\CPU\translate('Order')}} #{{$order['id']}}</h1>

                        @if($order['payment_status']=='paid')
                            <span class="badge badge-soft-success ml-sm-3">
                                <span class="legend-indicator bg-success"></span>{{\App\CPU\translate('Paid')}}
                            </span>
                        @else
                            <span class="badge badge-soft-danger ml-sm-3">
                                <span class="legend-indicator bg-danger"></span>{{\App\CPU\translate('Unpaid')}}
                            </span>
                        @endif

                        @if($order['order_status']=='pending')
                            <span class="badge badge-soft-info ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-info text"></span>{{\App\CPU\translate(str_replace('_',' ',$order['order_status']))}}
                            </span>
                        @elseif($order['order_status']=='failed')
                            <span class="badge badge-danger ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-info"></span>{{\App\CPU\translate(str_replace('_',' ',$order['order_status']))}}
                            </span>
                        @elseif($order['order_status']=='processing' || $order['order_status']=='out_for_delivery')
                            <span class="badge badge-soft-warning ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-warning"></span>{{\App\CPU\translate(str_replace('_',' ',$order['order_status']))}}
                            </span>
                        @elseif($order['order_status']=='delivered' || $order['order_status']=='confirmed')
                            <span class="badge badge-soft-success ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-success"></span>{{\App\CPU\translate(str_replace('_',' ',$order['order_status']))}}
                            </span>
                        @else
                            <span class="badge badge-soft-danger ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-danger"></span>{{\App\CPU\translate(str_replace('_',' ',$order['order_status']))}}
                            </span>
                        @endif
                        <span class="ml-2 ml-sm-3">
                        <i class="tio-date-range"></i> {{date('d M Y H:i:s',strtotime($order['created_at']))}}
                        </span>

                        @if(\App\CPU\Helpers::get_business_settings('order_verification'))
                            <span class="ml-2 ml-sm-3">
                                <b>
                                    {{\App\CPU\translate('order_verification_code')}} : {{$order['verification_code']}}
                                </b>
                            </span>
                        @endif

                        <h1 class="page-header-title"> Previous Order ID #{{$order['previous_order_id']}}</h1>
                    </div>
                    <div class="col-md-6 mt-2">
                        <a class="text-body mr-3" target="_blank"
                           href={{route('admin.orders.exchange-generate-invoice',[$order['id']])}}>
                            <i class="tio-print mr-1"></i> {{\App\CPU\translate('Print')}} {{\App\CPU\translate('invoice')}}
                        </a>
                    </div>


                    <!-- End Unfold -->
                </div>
            </div>
        </div>

        <!-- End Page Header -->

        <div class="row" id="printableArea">
            <div class="col-lg-8 mb-3 mb-lg-0">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header" style="display: block!important;">
                        <div class="row">
                            <div class="col-12 pb-2 border-bottom">
                                <h4 class="card-header-title">
                                    {{\App\CPU\translate('Order')}} {{\App\CPU\translate('details')}}
                                    <span
                                        class="badge badge-soft-dark rounded-circle ml-1">{{$order->exchangedetails->count()}}</span>
                                </h4>
                            </div>

                            <div class="col-6 pt-2">
                                <h6 class="" style="color: #8a8a8a;">
                                   page :  {{$order->socialpage['name']}}
                                </h6>
                                 <h6 class="" style="color: #8a8a8a;">
                                   Courier :  {{$order['delivery_service_name']}} ( <small>{{$order->shipping['title']}} {{$order->shipping['duration']}}</small> )
                                </h6>
                            </div>
                            <div class="col-6 pt-2">
                                <div class="text-right">
                                    <h6 class="" style="color: #8a8a8a;">
                                        {{\App\CPU\translate('Payment')}} {{\App\CPU\translate('Method')}}
                                        : {{str_replace('_',' ',$order['payment_method'])}}
                                    </h6>
                                    <h6 class="" style="color: #8a8a8a;">
                                        {{\App\CPU\translate('Payment')}} {{\App\CPU\translate('reference')}}
                                        : {{str_replace('_',' ',$order['transaction_ref'])}}
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="media">
                            <div class="avatar avatar-xl mr-3">
                                <p>{{\App\CPU\translate('image')}}</p>
                            </div>

                            <div class="media-body">
                                <div class="row">
                                    <div class="col-md-4 product-name">
                                        <p> {{\App\CPU\translate('Name')}}</p>
                                    </div>

                                    <div class="col col-md-2 align-self-center p-0 ">
                                        <p> {{\App\CPU\translate('price')}}</p>
                                    </div>

                                    <div class="col col-md-1 align-self-center">
                                        <p>Q</p>
                                    </div>
                                    <div class="col col-md-1 align-self-center  p-0 product-name">
                                        <p> {{\App\CPU\translate('TAX')}}</p>
                                    </div>
                                    <div class="col col-md-2 align-self-center  p-0 product-name">
                                        <p> {{\App\CPU\translate('Discount')}}</p>
                                    </div>

                                    <div class="col col-md-2 align-self-center text-right  ">
                                        <p> {{\App\CPU\translate('Subtotal')}}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @php($subtotal=0)
                        @php($previousSubtotal=0)
                        @php($total=0)
                        @php($previousTotal=0)
                        @php($shipping=0)
                        @php($discount=0)
                        @php($tax=0)
                        @php($extra_discount=0)
                        @php($product_price=0)
                        @php($total_product_price=0)
                        @php($coupon_discount=0)
                        @foreach($previousOrder->details as $key=>$detail)

                        @if($detail->product)

                        <!-- Media -->
                            <div class="media">
                                <div class="avatar avatar-xl mr-3">
                                    <img class="img-fluid"
                                         onerror="this.src='{{asset('assets/back-end/img/160x160/img2.jpg')}}'"
                                         src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$detail->product['thumbnail']}}"
                                         alt="Image Description">
                                </div>

                                <div class="media-body">
                                    <div class="row">
                                        <div class="col-md-4 mb-3 mb-md-0 product-name">
                                            <p>
                                                {{substr($detail->product['name'],0,30)}}{{strlen($detail->product['name'])>10?'...':''}}</p>
                                            <strong><u>{{\App\CPU\translate('Variation')}} : </u></strong>

                                            <div class="font-size-sm text-body">

                                                <span class="font-weight-bold">{{$detail['variant']}}</span>
                                            </div>
                                        </div>

                                        <div class="col col-md-2 align-self-center p-0 ">
                                            <h6>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['price']))}}</h6>
                                        </div>

                                        <div class="col col-md-1 align-self-center">

                                            <h5>{{$detail->qty}}</h5>
                                        </div>
                                        <div class="col col-md-1 align-self-center  p-0 product-name">

                                            <h5>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['tax']))}}</h5>
                                        </div>
                                        <div class="col col-md-2 align-self-center  p-0 product-name">

                                            <h5>
                                                {{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['discount']))}}</h5>
                                        </div>

                                        <div class="col col-md-2 align-self-center text-right  ">
                                            @php($previousSubtotal=$detail['price']*$detail->qty+$detail['tax']-$detail['discount'])
                                            @php($product_price = $detail['price']*$detail['qty'])
                                            <h5 style="font-size: 12px">- {{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($previousSubtotal))}} <small class="text-warning">RETURN</small></h5>
                                        </div>
                                        @php($total_product_price+=$product_price)
                                    </div>
                                </div>
                            </div>
                            {{-- seller info old --}}

                            @php($discount+=$detail['discount'])
                            @php($tax+=$detail['tax'])
                            @php($previousTotal+=$previousSubtotal)
                        <!-- End Media -->
                            <hr>
                        @endif

                    @endforeach
                        @foreach($order->exchangedetails as $key=>$detail)

                            @if($detail->product)

                            <!-- Media -->
                                <div class="media">
                                    <div class="avatar avatar-xl mr-3">
                                        <img class="img-fluid"
                                             onerror="this.src='{{asset('assets/back-end/img/160x160/img2.jpg')}}'"
                                             src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$detail->product['thumbnail']}}"
                                             alt="Image Description">
                                    </div>

                                    <div class="media-body">
                                        <div class="row">
                                            <div class="col-md-4 mb-3 mb-md-0 product-name">
                                                <p>
                                                    {{substr($detail->product['name'],0,30)}}{{strlen($detail->product['name'])>10?'...':''}}</p>
                                                <strong><u>{{\App\CPU\translate('Variation')}} : </u></strong>

                                                <div class="font-size-sm text-body">

                                                    <span class="font-weight-bold">{{$detail['variant']}}</span>
                                                </div>
                                            </div>

                                            <div class="col col-md-2 align-self-center p-0 ">
                                                <h6>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['price']))}}</h6>
                                            </div>

                                            <div class="col col-md-1 align-self-center">

                                                <h5>{{$detail->qty}}</h5>
                                            </div>
                                            <div class="col col-md-1 align-self-center  p-0 product-name">

                                                <h5>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['tax']))}}</h5>
                                            </div>
                                            <div class="col col-md-2 align-self-center  p-0 product-name">

                                                <h5>
                                                    {{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($detail['discount']))}}</h5>
                                            </div>

                                            <div class="col col-md-2 align-self-center text-right  ">
                                                @php($subtotal=$detail['price']*$detail->qty+$detail['tax']-$detail['discount'])
                                                @php($product_price = $detail['price']*$detail['qty'])
                                                <h5 style="font-size: 12px">{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($subtotal))}}</h5>
                                            </div>
                                            @php($total_product_price+=$product_price)
                                        </div>
                                    </div>
                                </div>
                                {{-- seller info old --}}

                                @php($discount+=$detail['discount'])
                                @php($tax+=$detail['tax'])
                                @php($total+=$subtotal)
                            <!-- End Media -->
                                <hr>
                            @endif
                            @php($sellerId=$detail->seller_id)
                        @endforeach
                        @php($shipping=$order['shipping_cost'])

                        <?php
                            if ($order['extra_discount_type'] == 'percent') {
                                $extra_discount = ($total_product_price / 100) * $order['extra_discount'];
                            } else {
                                $extra_discount = $order['extra_discount'];
                            }
                            if(isset($order['discount_amount'])){
                                $coupon_discount =$order['discount_amount'];
                            }
                        ?>
                        <div class="row justify-content-md-end mb-3">
                            <div class="col-md-9 col-lg-8">
                                <dl class="row text-sm-right">

                                    <dt class="col-sm-6">{{\App\CPU\translate('extra_discount')}}</dt>
                                    <dd class="col-sm-6 border-bottom">
                                        <strong>- {{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($extra_discount))}}</strong>
                                    </dd>

                                    <dt class="col-sm-6">{{\App\CPU\translate('coupon_discount')}}</dt>
                                    <dd class="col-sm-6 border-bottom">
                                        <strong>- {{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($coupon_discount))}}</strong>
                                    </dd>
                                    <dt class="col-sm-6">Shipping Cost</dt>
                                    <dd class="col-sm-6 border-bottom">
                                        <strong>+ {{\App\CPU\Helpers::currency_converter(round($order->shipping_cost,2))}}</strong>
                                    </dd>

                                    <dt class="col-sm-6">{{\App\CPU\translate('Total')}}</dt>
                                    <dd class="col-sm-6">
                                        <strong>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($total+$shipping-$extra_discount-$coupon_discount-$previousTotal))}}</strong>
                                    </dd>
                                </dl>
                                <!-- End Row -->
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>

            <div class="col-lg-4">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">{{\App\CPU\translate('Customer')}}</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    @if($order->customer)
                        <div class="card-body">
                            <div class="media align-items-center" href="javascript:">
                                <div class="avatar avatar-circle mr-3">
                                    <img
                                        class="avatar-img" style="width: 75px;height: 42px"
                                        onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'"
                                        src="{{asset('storage/profile/'.$order->customer->image)}}"
                                        alt="Image">
                                </div>
                                <div class="media-body">
                                <span
                                    class="text-body text-hover-primary">{{$order->customer['f_name'].' '.$order->customer['l_name']}}</span>
                                </div>
                                <div class="media-body text-right">
                                    {{--<i class="tio-chevron-right text-body"></i>--}}
                                </div>
                            </div>

                            <hr>

                            <div class="media align-items-center" href="javascript:">
                                <div class="icon icon-soft-info icon-circle mr-3">
                                    <i class="tio-shopping-basket-outlined"></i>
                                </div>
                                <div class="media-body">
                                    <span
                                        class="text-body text-hover-primary"> {{\App\Model\Order::where('order_type','POS')->where('customer_id',$order['customer_id'])->count()}} {{\App\CPU\translate('orders')}}</span>
                                </div>
                                <div class="media-body text-right">
                                    {{--<i class="tio-chevron-right text-body"></i>--}}
                                </div>
                            </div>

                            <hr>

                            <div class="d-flex justify-content-between align-items-center">
                                <h5>{{\App\CPU\translate('Contact')}} {{\App\CPU\translate('info')}} </h5>
                            </div>

                            <ul class="list-unstyled list-unstyled-py-2">
                                <li>
                                    <i class="tio-online mr-2"></i>
                                    {{$order->customer['email']}}
                                </li>
                                <li>
                                    <i class="tio-android-phone-vs mr-2"></i>
                                    {{$order->customer['phone']}}
                                </li>
                            </ul>

                            <hr>

                        </div>
                    @else
                        <div class="card-body">
                            <div class="media align-items-center">
                                <span>{{\App\CPU\translate('no_customer_found')}}</span>
                            </div>
                        </div>
                @endif
                <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <!-- End Row -->
    </div>
    <!--Show locations on map Modal -->
    <div class="modal fade" id="locationModal" tabindex="-1" role="dialog" aria-labelledby="locationModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"
                        id="locationModalLabel">{{\App\CPU\translate('location')}} {{\App\CPU\translate('data')}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 modal_body_map">
                            <div class="location-map" id="location-map">
                                <div style="width: 100%; height: 400px;" id="location_map_canvas"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->
@endsection

@push('script_2')
    <script>
        $(document).on('change', '.payment_status', function () {
            var id = $(this).attr("data-id");
            var value = $(this).val();
            Swal.fire({
                title: '{{\App\CPU\translate('Are you sure Change this')}}?',
                text: "{{\App\CPU\translate('You will not be able to revert this')}}!",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{\App\CPU\translate('Yes, Change it')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.orders.payment-status')}}",
                        method: 'POST',
                        data: {
                            "id": id,
                            "payment_status": value
                        },
                        success: function (data) {
                            toastr.success('{{\App\CPU\translate('Status Change successfully')}}');
                            location.reload();
                        }
                    });
                }
            })
        });

        function order_status(status) {
            @if($order['order_status']=='delivered')
            Swal.fire({
                title: '{{\App\CPU\translate('Order is already delivered, and transaction amount has been disbursed, changing status can be the reason of miscalculation')}}!',
                text: "{{\App\CPU\translate('Think before you proceed')}}.",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{\App\CPU\translate('Yes, Change it')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.orders.status')}}",
                        method: 'POST',
                        data: {
                            "id": '{{$order['id']}}',
                            "order_status": status
                        },
                        success: function (data) {
                            if (data.success == 0) {
                                toastr.success('{{\App\CPU\translate('Order is already delivered, You can not change it')}} !!');
                                location.reload();
                            } else {
                                toastr.success('{{\App\CPU\translate('Status Change successfully')}}!');
                                location.reload();
                            }

                        }
                    });
                }
            })
            @else
            Swal.fire({
                title: '{{\App\CPU\translate('Are you sure Change this')}}?',
                text: "{{\App\CPU\translate('You will not be able to revert this')}}!",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{\App\CPU\translate('Yes, Change it')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.orders.status')}}",
                        method: 'POST',
                        data: {
                            "id": '{{$order['id']}}',
                            "order_status": status
                        },
                        success: function (data) {
                            if (data.success == 0) {
                                toastr.success('{{\App\CPU\translate('Order is already delivered, You can not change it')}} !!');
                                location.reload();
                            } else {
                                toastr.success('{{\App\CPU\translate('Status Change successfully')}}!');
                                location.reload();
                            }

                        }
                    });
                }
            })
            @endif
        }
    </script>

    <script>
        function addDeliveryMan(id) {
            $.ajax({
                type: "GET",
                url: '{{url('/')}}/admin/orders/add-delivery-man/{{$order['id']}}/' + id,
                data: {
                    'order_id': '{{$order['id']}}',
                    'delivery_man_id': id
                },
                success: function (data) {
                    if (data.status == true) {
                        toastr.success('Delivery man successfully assigned/changed', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    } else {
                        toastr.error('Deliveryman man can not assign/change in that status', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    }
                },
                error: function () {
                    toastr.error('Add valid data', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        }

        function last_location_view() {
            toastr.warning('Only available when order is out for delivery!', {
                CloseButton: true,
                ProgressBar: true
            });
        }

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        function waiting_for_location() {
            toastr.warning('{{\App\CPU\translate('waiting_for_location')}}', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>

@endpush

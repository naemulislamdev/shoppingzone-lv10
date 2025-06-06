@extends('layouts.back-end.app')

@section('title',\App\CPU\translate('customer_loyalty_point').' '.\App\CPU\translate('report'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> {{\App\CPU\translate('customer_loyalty_point')}} {{\App\CPU\translate('report')}} </h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <div class="card">
            <div class="card-header text-capitalize py-0">
                <h4 class="pt-1">{{\App\CPU\translate('filter')}} {{\App\CPU\translate('options')}}</h4>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 pt-3">
                        <form action="{{route('admin.customer.loyalty.report')}}" method="get">
                            <div class="row">
                                <div class="col-sm-6 col-12">
                                    <div class="mb-3">
                                        <input type="date" name="from" id="from_date" value="{{request()->get('from')}}" class="form-control" title="{{\App\CPU\translate('from')}} {{\App\CPU\translate('date')}}">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-12">
                                    <div class="mb-3">
                                        <input type="date" name="to" id="to_date" value="{{request()->get('to')}}" class="form-control" title="{{ucfirst(\App\CPU\translate('to'))}} {{\App\CPU\translate('date')}}">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-12">
                                    <div class="mb-3">
                                        @php
                                        $transaction_status=request()->get('transaction_type');
                                        @endphp
                                        <select name="transaction_type" id="" class="form-control" title="{{\App\CPU\translate('select')}} {{\App\CPU\translate('transaction_type')}}">
                                            <option value="">{{ \App\CPU\translate('all')}}</option>
                                            <option value="point_to_wallet" {{isset($transaction_status) && $transaction_status=='point_to_wallet'?'selected':''}}>{{ \App\CPU\translate('point_to_wallet')}}</option>
                                            <option value="order_place" {{isset($transaction_status) && $transaction_status=='order_place'?'selected':''}}>{{ \App\CPU\translate('order_place')}}</option>
                                            <option value="refund_order" {{isset($transaction_status) && $transaction_status=='refund_order'?'selected':''}}>{{ \App\CPU\translate('refund_order')}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-12">
                                    <div class="mb-3">
                                        <select id='customer' name="customer_id" data-placeholder="{{\App\CPU\translate('select_customer')}}" class="js-data-example-ajax form-control" title="{{\App\CPU\translate('select_customer')}}">
                                            @if (request()->get('customer_id') && $customer_info = \App\User::find(request()->get('customer_id')))
                                                <option value="{{$customer_info->id}}" selected>{{$customer_info->f_name.' '.$customer_info->l_name}}({{$customer_info->phone}})</option>
                                            @endif
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <button type="submit" class="btn btn-primary col-lg-2 col-md-3 col-sm-4 col-6 mx-3 text-capitalize font-weight-bold"><i class="tio-filter-list mr-1"></i>{{\App\CPU\translate('filter')}}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div class="card mt-3">
            <div class="card-header text-capitalize py-0">
                <h4 class="pt-1">{{\App\CPU\translate('summary')}}</h4>
            </div>
            <div class="card-body">
                <div class="row">
                    @php
                        $credit = $data[0]->total_credit??0;
                        $debit = $data[0]->total_debit??0;
                        $balance = $credit - $debit;
                    @endphp
                    <!--Debit earned-->
                    <div class="col-sm-4">
                        <!-- Card -->
                        <div class="card card-sm">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <!-- Media -->
                                        <div class="media">
                                            <i class="tio-atm nav-icon"></i>

                                            <div class="media-body">
                                                <h4 class="mb-1">{{\App\CPU\translate('debit')}}</h4>
                                                <span class="font-size-sm text-success">
                                                    {{$debit}}
                                                </span>
                                            </div>
                                        </div>
                                        <!-- End Media -->
                                    </div>
                                </div>
                                <!-- End Row -->
                            </div>
                        </div>
                        <!-- End Card -->
                    </div>
                    <!--Debit earned End-->
                    <!--credit earned-->
                    <div class="col-sm-4">
                        <!-- Card -->
                        <div class="card card-sm">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <!-- Media -->
                                        <div class="media">
                                            <i class="tio-money nav-icon"></i>

                                            <div class="media-body">
                                                <h4 class="mb-1 text-capitalize">{{\App\CPU\translate('credit')}}</h4>
                                                <span class="font-size-sm text-warning">
                                                    {{$credit}}
                                                </span>
                                            </div>
                                        </div>
                                        <!-- End Media -->
                                    </div>
                                </div>
                                <!-- End Row -->
                            </div>
                        </div>
                        <!-- End Card -->
                    </div>
                    <!--credit earned end-->
                    <!--balance earned-->
                    <div class="col-sm-4">
                        <!-- Card -->
                        <div class="card card-sm">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <!-- Media -->
                                        <div class="media">
                                            <i class="tio-wallet nav-icon"></i>

                                            <div class="media-body">
                                                <h4 class="mb-1 text-capitalize">{{\App\CPU\translate('balance')}}</h4>
                                                <span class="font-size-sm text-danger">
                                                    {{$balance}}
                                                </span>
                                            </div>
                                        </div>
                                        <!-- End Media -->
                                    </div>
                                </div>
                                <!-- End Row -->
                            </div>
                        </div>
                        <!-- End Card -->
                    </div>
                    <!--balance earned end-->
                </div>
            </div>

        </div>

        <!-- End Stats -->
        <!-- Card -->
        <div class="card mt-3">
            <!-- Header -->
            <div class="card-header text-capitalize py-0">
                <h4 class="pt-1">{{\App\CPU\translate('transactions')}}</h4>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="card-body">
                <div class="table-responsive">
                    <table id="datatable"
                        class="table table-thead-bordered table-align-middle card-table table-nowrap"
                        style="width: 100%">
                        <thead class="thead-light">
                            <tr>
                                <th>{{\App\CPU\translate('sl#')}}</th>
                                <th>{{\App\CPU\translate('transaction')}} {{\App\CPU\translate('id')}}</th>
                                <th>{{\App\CPU\translate('Customer')}}</th>
                                <th>{{\App\CPU\translate('credit')}}</th>
                                <th>{{\App\CPU\translate('debit')}}</th>
                                <th>{{\App\CPU\translate('balance')}}</th>
                                <th>{{\App\CPU\translate('transaction_type')}}</th>
                                <th>{{\App\CPU\translate('reference')}}</th>
                                <!-- <th>{{\App\CPU\translate('admin_bonus')}}</th> -->
                                <th>{{\App\CPU\translate('created_at')}}</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($transactions as $k=>$wt)
                            <tr scope="row">
                                <td >{{$k+$transactions->firstItem()}}</td>
                                <td>{{$wt->transaction_id}}</td>
                                <td><a href="{{route('admin.customer.view',['user_id'=>$wt->user_id])}}">{{Str::limit($wt->user?$wt->user->f_name.' '.$wt->user->l_name:\App\CPU\translate('not_found'),20,'...')}}</a></td>
                                <td>{{$wt->credit}}</td>
                                <td>{{$wt->debit}}</td>
                                <td>{{$wt->balance}}</td>
                                <td>
                                    <span class="badge badge-soft-{{$wt->transaction_type=='order_refund'
                                        ?'danger'
                                        :($wt->transaction_type=='loyalty_point'?'warning'
                                            :($wt->transaction_type=='order_place'
                                                ?'info'
                                                :'success'))
                                        }}">
                                        {{\App\CPU\translate(''.$wt->transaction_type)}}
                                    </span>
                                </td>
                                <td>{{$wt->reference}}</td>
                                <!-- <td>{{$wt->admin_bonus}}</td> -->
                                <td>{{date('Y/m/d '.config('timeformat'), strtotime($wt->created_at))}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- End Body -->
            @if(count($transactions)==0)
                <div class="text-center p-4">
                    <img class="mb-3" src="{{asset('assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                    <p class="mb-0">{{ \App\CPU\translate('No_data_to_show')}}</p>
                </div>
            @endif
            <div class="card-footer">
                {!!$transactions->links()!!}
            </div>

        </div>
        <!-- End Card -->
    </div>
@endsection

@push('script')

@endpush

@push('script_2')

    <script src="{{asset('assets/admin')}}/vendor/chart.js/dist/Chart.min.js"></script>
    <script
        src="{{asset('assets/admin')}}/vendor/chartjs-chart-matrix/dist/chartjs-chart-matrix.min.js"></script>
    <script src="{{asset('assets/admin')}}/js/hs.chartjs-matrix.js"></script>

    <script>
        $(document).on('ready', function () {
            $('.js-data-example-ajax').select2({
                ajax: {
                    url: '{{route('admin.customer.customer-list-search')}}',
                    data: function (params) {
                        return {
                            q: params.term, // search term
                            all:true,
                            page: params.page
                        };
                    },
                    processResults: function (data) {
                        return {
                        results: data
                        };
                    },
                    __port: function (params, success, failure) {
                        var $request = $.ajax(params);

                        $request.then(success);
                        $request.fail(failure);

                        return $request;
                    }
                }
            });

            // INITIALIZATION OF FLATPICKR
            // =======================================================
            $('.js-flatpickr').each(function () {
                $.HSCore.components.HSFlatpickr.init($(this));
            });


            // INITIALIZATION OF NAV SCROLLER
            // =======================================================
            $('.js-nav-scroller').each(function () {
                new HsNavScroller($(this)).init()
            });


            // INITIALIZATION OF DATERANGEPICKER
            // =======================================================
            $('.js-daterangepicker').daterangepicker();

            $('.js-daterangepicker-times').daterangepicker({
                timePicker: true,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'M/DD hh:mm A'
                }
            });

            var start = moment();
            var end = moment();

            function cb(start, end) {
                $('#js-daterangepicker-predefined .js-daterangepicker-predefined-preview').html(start.format('MMM D') + ' - ' + end.format('MMM D, YYYY'));
            }

            $('#js-daterangepicker-predefined').daterangepicker({
                startDate: start,
                endDate: end,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                }
            }, cb);

            cb(start, end);


            // INITIALIZATION OF CHARTJS
            // =======================================================
            $('.js-chart').each(function () {
                $.HSCore.components.HSChartJS.init($(this));
            });

            var updatingChart = $.HSCore.components.HSChartJS.init($('#updatingData'));

            // Call when tab is clicked
            $('[data-toggle="chart"]').click(function (e) {
                let keyDataset = $(e.currentTarget).attr('data-datasets')

                // Update datasets for chart
                updatingChart.data.datasets.forEach(function (dataset, key) {
                    dataset.data = updatingChartDatasets[keyDataset][key];
                });
                updatingChart.update();
            })


            // INITIALIZATION OF MATRIX CHARTJS WITH CHARTJS MATRIX PLUGIN
            // =======================================================
            function generateHoursData() {
                var data = [];
                var dt = moment().subtract(365, 'days').startOf('day');
                var end = moment().startOf('day');
                while (dt <= end) {
                    data.push({
                        x: dt.format('YYYY-MM-DD'),
                        y: dt.format('e'),
                        d: dt.format('YYYY-MM-DD'),
                        v: Math.random() * 24
                    });
                    dt = dt.add(1, 'day');
                }
                return data;
            }

            $.HSCore.components.HSChartMatrixJS.init($('.js-chart-matrix'), {
                data: {
                    datasets: [{
                        label: 'Commits',
                        data: generateHoursData(),
                        width: function (ctx) {
                            var a = ctx.chart.chartArea;
                            return (a.right - a.left) / 70;
                        },
                        height: function (ctx) {
                            var a = ctx.chart.chartArea;
                            return (a.bottom - a.top) / 10;
                        }
                    }]
                },
                options: {
                    tooltips: {
                        callbacks: {
                            title: function () {
                                return '';
                            },
                            label: function (item, data) {
                                var v = data.datasets[item.datasetIndex].data[item.index];

                                if (v.v.toFixed() > 0) {
                                    return '<span class="font-weight-bold">' + v.v.toFixed() + ' hours</span> on ' + v.d;
                                } else {
                                    return '<span class="font-weight-bold">No time</span> on ' + v.d;
                                }
                            }
                        }
                    },
                    scales: {
                        xAxes: [{
                            position: 'bottom',
                            type: 'time',
                            offset: true,
                            time: {
                                unit: 'week',
                                round: 'week',
                                displayFormats: {
                                    week: 'MMM'
                                }
                            },
                            ticks: {
                                "labelOffset": 20,
                                "maxRotation": 0,
                                "minRotation": 0,
                                "fontSize": 12,
                                "fontColor": "rgba(22, 52, 90, 0.5)",
                                "maxTicksLimit": 12,
                            },
                            gridLines: {
                                display: false
                            }
                        }],
                        yAxes: [{
                            type: 'time',
                            offset: true,
                            time: {
                                unit: 'day',
                                parser: 'e',
                                displayFormats: {
                                    day: 'ddd'
                                }
                            },
                            ticks: {
                                "fontSize": 12,
                                "fontColor": "rgba(22, 52, 90, 0.5)",
                                "maxTicksLimit": 2,
                            },
                            gridLines: {
                                display: false
                            }
                        }]
                    }
                }
            });


            // INITIALIZATION OF CLIPBOARD
            // =======================================================
            $('.js-clipboard').each(function () {
                var clipboard = $.HSCore.components.HSClipboard.init(this);
            });


            // INITIALIZATION OF CIRCLES
            // =======================================================
            $('.js-circle').each(function () {
                var circle = $.HSCore.components.HSCircles.init($(this));
            });
        });
    </script>

    <script>
        $('#from_date,#to_date').change(function () {
            let fr = $('#from_date').val();
            let to = $('#to_date').val();
            if (fr != '' && to != '') {
                if (fr > to) {
                    $('#from_date').val('');
                    $('#to_date').val('');
                    toastr.error('Invalid date range!', Error, {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            }

        })
    </script>
@endpush

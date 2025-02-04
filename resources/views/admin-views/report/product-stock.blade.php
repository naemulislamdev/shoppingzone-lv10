@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Product stock Report'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <!-- Nav -->
            <div class="js-nav-scroller hs-nav-scroller-horizontal">
                <ul class="nav nav-tabs page-header-tabs" id="projectsTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" href="javascript:">{{ \App\CPU\translate('Product stock report') }}</a>
                    </li>
                </ul>
            </div>
            <!-- End Nav -->
        </div>
        <!-- End Page Header -->

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row flex-between justify-content-between flex-grow-1">
                            <div class="col-md-3 mt-2">
                                <form action="" method="GET">
                                    <!-- Search -->
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch_" type="search" name="search" class="form-control"
                                            placeholder="{{ \App\CPU\translate('Search Code & Name') }}"
                                            aria-label="Search orders" value="{{ $search }}" required>
                                        <button type="submit"
                                            class="btn btn-primary">{{ \App\CPU\translate('search') }}</button>
                                    </div>
                                    <!-- End Search -->
                                </form>
                            </div>

                            <div class="col-md-9 mt-2 mt-sm-0">
                                <form style="width: 100%;" action="" id="form-data" method="get">
                                    <div class="row text-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                                        <div class="col-md-1 mt-2">
                                            <div class="form-group mt-2">
                                                <label for="exampleInputEmail1">{{ \App\CPU\translate('Seller') }}</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3 mt-2">
                                            <div class="form-group">
                                                <select class="js-select2-custom form-control" name="seller_id"
                                                    style="text-overflow: ellipsis !important;">
                                                    <option value="all" {{ $seller_id == 'all' ? 'selected' : '' }}>
                                                        {{ \App\CPU\translate('All') }}</option>
                                                    <option value="in_house"
                                                        {{ $seller_id == 'in_house' ? 'selected' : '' }}>
                                                        {{ \App\CPU\translate('In-House') }}</option>
                                                    @foreach (\App\Model\Seller::where(['status' => 'approved'])->get() as $seller)
                                                        <option value="{{ $seller['id'] }}"
                                                            {{ $seller_id == $seller['id'] ? 'selected' : '' }}>
                                                            {{ $seller['f_name'] }} {{ $seller['l_name'] }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-1 mt-2">
                                            <div class="form-group mt-2">
                                                <label for="exampleInputEmail1">{{ \App\CPU\translate('Sort') }}</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3 mt-2">
                                            <div class="form-group">
                                                <select class="form-control" name="sort">
                                                    <option value="ASC" {{ $sort == 'ASC' ? 'selected' : '' }}>
                                                        {{ \App\CPU\translate('wishlist_sort_by_(low_to_high)') }}</option>
                                                    <option value="DESC" {{ $sort == 'DESC' ? 'selected' : '' }}>
                                                        {{ \App\CPU\translate('wishlist_sort_by_(high_to_low)') }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2 mt-2">
                                            <button type="submit" class="btn btn-primary btn-block"
                                                onclick="formUrlChange(this)" data-action="{{ url()->current() }}">
                                                {{ \App\CPU\translate('Filter') }}
                                            </button>
                                        </div>
                                        <div class="col-md-2 mt-2">
                                            <button type="submit" onclick="formUrlChange(this)"
                                                data-action="{{ route('admin.stock.product-stock-export') }}"
                                                class="btn btn-success btn-block">
                                                <i class="tio-download-to"></i>
                                                {{ \App\CPU\translate('Export') }}
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card-body" id="products-table"
                        style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">
                                        {{ \App\CPU\translate('Product Name') }}
                                    </th>
                                    <th scope="col">
                                        {{ \App\CPU\translate('Product Code') }}
                                    </th>
                                    <th scope="col">
                                        {{ \App\CPU\translate('Date') }}
                                    </th>
                                    <th scope="col">
                                        {{ \App\CPU\translate('Total Stock') }}
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $key => $data)
                                    <tr>
                                        <th scope="row">{{ $products->firstItem() + $key }}</th>
                                        <td>{{ $data['name'] }}</td>
                                        <td>{{ $data['code'] }}</td>
                                        <td>{{ date('d M Y', $data['created_at'] ? strtotime($data['created_at']) : null) }}
                                        </td>
                                        @php
                                            $combinations = json_decode($data['variation'], true); // get all variations
                                        @endphp

                                        @if (count($combinations) > 0)
                                            <td><a href="javascript:void(0)" class="btn btn-primary" data-toggle="modal"
                                                    data-target="#variation-{{ $data['id'] }}">{{ \App\CPU\translate('View') }}</a>
                                            </td>
                                        @else
                                            <td>{{ $data['current_stock'] }}</td>
                                        @endif
                                    </tr>
                                    <div class="modal fade  bd-example-modal-lg" id="variation-{{ $data['id'] }}"
                                        tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                        aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">
                                                        {{ \App\CPU\translate('Product Variations') }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body  table-responsive">
                                                    <div class="row">
                                                        <div class="col-md-3 mb-3">{{\App\CPU\translate('Variant')}}</div>
                                                        <div class="col-md-3 mb-3">{{\App\CPU\translate('Variant Price')}}</div>
                                                        <div class="col-md-3 mb-3">{{\App\CPU\translate('SKU')}}</div>
                                                        <div class="col-md-3 mb-3">{{\App\CPU\translate('Quantity')}}</div>
                                                    </div>
                                                    <div class="row">
                                                        @foreach ($combinations as $key => $combination)
                                                            <div class="col-md-3 mb-3">
                                                                <label for="" class="control-label">{{ $combination['type'] }}</label>
                                                            </div>
                                                            <div class="col-md-3 mb-3">
                                                                <input type="number" name="price_{{ $combination['type'] }}"
                                                                    value="{{ \App\CPU\Convert::default($combination['price']) }}"
                                                                    min="0" step="0.01" class="form-control" readonly>
                                                            </div>
                                                            <div class="col-md-3 mb-3">
                                                                <input type="text" name="sku_{{ $combination['type'] }}"
                                                                    value="{{ $combination['sku'] }}" class="form-control" readonly>
                                                            </div>
                                                            <div class="col-md-3 mb-3">
                                                                <input type="number" onkeyup="update_qty()"
                                                                    name="qty_{{ $combination['type'] }}"
                                                                    value="{{ $combination['qty'] }}" min="1" max="100000"
                                                                    step="1" class="form-control" readonly>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="card-footer">
                            <div class=" row table-responsive">

                                {!! $products->links() !!}

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Stats -->
    </div>
@endsection

@push('script')
@endpush

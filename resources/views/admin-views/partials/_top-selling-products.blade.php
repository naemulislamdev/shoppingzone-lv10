<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-align-to-top"></i> {{ \App\CPU\translate('top_selling_products') }}
    </h5>
    <i class="tio-gift" style="font-size: 45px"></i>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row mb-2">
        @foreach ($top_sell as $key => $item)
            @if (isset($item->product))
                <div class="col-md-6 col-6 mt-2"
                    onclick="location.href='{{ route('admin.product.view', [$item['product_id']]) }}'"
                    style="cursor: pointer;padding-right: 6px;padding-left: 6px">
                    <div class="grid-card d-flex">

                        <div class="text-center mt-3 mr-2">
                            <img style="height: 90px"
                                src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $item->product['thumbnail'] }}"
                                onerror="this.src='{{ asset('assets/back-end/img/160x160/img2.jpg') }}'"
                                alt="{{ $item->product->name }} image">
                        </div>

                        <div>
                            <div class="text-center mt-2">
                                <span class="" style="font-size: 10px">{{ substr($item->product['name'], 0, 20) }}
                                    {{ strlen($item->product['name']) > 20 ? '...' : '' }}</span>
                            </div>
                            <div class="label_1 row-center">
                                <div class="px-1">{{ \App\CPU\translate('sold') }} : </div>
                                <div>{{ $item['count'] }}</div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
        @endforeach
    </div>
    <div class="row">
        <div class="col-12">
            <a class="btn btn-outline-primary w-100" href="{{route('admin.product.list',['in_house', ''])}}">All Products <i class="fa fa-angle-right"></i></a>
        </div>
    </div>
</div>
<!-- End Body -->

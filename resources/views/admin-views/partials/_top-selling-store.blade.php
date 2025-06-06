<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-company"></i> {{\App\CPU\translate('top_selling_store')}}
    </h5>
    <i class="tio-dollar-outlined" style="font-size: 45px"></i>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row">
        @foreach($top_store_by_earning as $key=>$item)
            @php($shop=\App\Model\Shop::where('seller_id',$item['seller_id'])->first())
            @if(isset($shop))
                <div class="col-6 col-md-4 mt-2"
                     onclick="location.href='{{route('admin.sellers.view',$item['seller_id'])}}'"
                     style="padding-left: 6px;padding-right: 6px;cursor: pointer">
                    <div class="grid-card" style="min-height: 170px">

                        <div class="text-center mt-3">
                            <img style="border-radius: 50%;width: 60px;height: 60px;border:2px solid #80808082;"
                                 onerror="this.src='{{asset('assets/back-end/img/160x160/img1.jpg')}}'"
                                 src="{{asset('storage/shop/'.$shop->image??'')}}">
                        </div>
                        <div class="text-center mt-2">
                            <span style="font-size: 10px">{{$shop['name']??'Not exist'}}</span>
                        </div>
                        <div class="label_1" style="width: 100%;">
                            {{\App\CPU\Helpers::currency_converter($item['count'])}}
                        </div>
                    </div>
                </div>
            @endif
        @endforeach
    </div>
</div>
<!-- End Body -->

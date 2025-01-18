<div class="product-box product-box-col-2" data-category="category">
    <div class="product-image2 product-image2-col-2" data-category="category">
        @php($decimal_point_settings = \App\CPU\Helpers::get_business_settings('decimal_point_settings'))
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
                src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}">
            <img class="pic-2"
                src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $product['thumbnail'] }}">
        </a>
        <ul class="social">
            <li><a href="{{ route('product', $product->slug) }}" data-tip="Quick View"><i class="fa fa-eye"></i></a>
            </li>
            <li><a href="javascript:void(0);" data-toggle="modal" data-target="#addToCartModal_{{ $product->id }}"
                    data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a>
            </li>
        </ul>
        <a class="buy-now" href="javascript:void(0);" onclick="buy_now('form-{{ $product->id }}')">Buy Now</a>
    </div>
    <div class="product-content">
        <h3 class="title"><a href="{{ route('product', $product->slug) }}">{{ Str::limit($product['name'], 23) }}</a>
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

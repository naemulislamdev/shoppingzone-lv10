@if (session()->has('cart') && count(session()->get('cart')) > 0)
    @php($sub_total = 0)
    @php($total_tax = 0)
    @foreach (session('cart') as $keyId => $cartItem)
        <div class="header-cart-product d-flex mb-3">
            <div class="img">
                <img src="{{ \App\CPU\ProductManager::product_image_path('thumbnail') }}/{{ $cartItem['thumbnail'] }}"
                    alt="">
            </div>
            <div class="header-cart-p-details">
                <h5>{{ Str::limit($cartItem['name'], 30) }}</h5>


                @if (!empty($cartItem['variations']))
                    @foreach ($cartItem['variations'] as $key => $variation)
                        <span>{{ $key }} : {{ $variation }}</span>
                    @endforeach
                @endif
                <p>{{ \App\CPU\Helpers::currency_converter(($cartItem['price'] - $cartItem['discount']) * $cartItem['quantity']) }}
                </p>
                <a href="#" onclick="removeFromCart({{ $keyId }})"><i class="fa fa-trash"></i></a>
            </div>
        </div>
        @php($sub_total += ($cartItem['price'] - $cartItem['discount']) * $cartItem['quantity'])
        @php($total_tax += $cartItem['tax'] * $cartItem['quantity'])
    @endforeach
    <div class="cart-header-bottom-box">
        <div class="row">
            <div class="col-md-12">
                <div class="cart-header-subtotal d-flex justify-content-between">
                    <h4>Subtotal</h4>
                    <h4>{{ \App\CPU\Helpers::currency_converter($sub_total) }}</h4>
                </div>
                <div class="button-section d-flex">
                    <a href="#">View Cart</a>
                    <a href="{{ route('shop-cart') }}">Check Out</a>
                </div>
            </div>
        </div>
    </div>
@else
    <div class="empty-cart-box">
        <i class="fa fa-shopping-bag"></i>
        <h4>Your cart is empty.</h4>
        <a href="#" class="btn btn-dark">Return to shop</a>
    </div>
@endif

<footer class="py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="footer-title">
                    <h3>{{ \App\CPU\Helpers::get_business_settings('company_name') }}</h3>
                    @php $social_media = \App\Model\SocialMedia::where('active_status', 1)->get(); @endphp
                    <div class="footer-social-icon mb-3">
                        @if (isset($social_media))
                            @foreach ($social_media as $item)
                                <a href="{{ $item->link }}"><i class="{{ $item->icon }}"></i></a>
                            @endforeach
                        @endif
                    </div>
                    <img class="footer-logo"
                        src="{{ asset('storage/company/') }}/{{ $web_config['footer_logo']->value }}"
                        onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                        alt="{{ $web_config['name']->value }}">
                    <ul>
                        @php
                            $company_email = $web_config['email']->value;
                            $company_phone = $web_config['phone']->value;
                        @endphp
                        <li><i class="fa fa-map-marker"></i><a href="#">{{\App\CPU\translate('Address')}}:
                                {{ \App\CPU\Helpers::get_business_settings('shop_address') }}</a></li>
                        <li><i class="fa fa-envelope"></i><a href="mailto:{{ $company_email }}">{{\App\CPU\translate('Email')}}:
                                {{ $company_email }}</a></li>
                        <li><i class="fa fa-phone"></i><a href="tel:{{ $company_phone }}">{{ $company_phone }}</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-title">
                    <h3>{{\App\CPU\translate('About Us')}}</h3>
                    <ul>
                        <li><a href="{{ route('about-us')}}">{{\App\CPU\translate('About')}}</a></li>
                        <li><a href="{{ route('helpTopic')}}">{{\App\CPU\translate('FAQ')}}</a></li>
                        <li><a href="{{ route('terms')}}">{{\App\CPU\translate('Terms & Conditions')}}</a></li>
                        <li><a href="{{ route('privacy-policy')}}">{{\App\CPU\translate('Privacy Policy')}}</a></li>
                        <li><a href="{{ route('outlets') }}">{{\App\CPU\translate('Our Outlets')}}</a></li>
                        <li><a href="{{ route('contacts')}}">{{\App\CPU\translate('Contact Us')}}</a></li>
                        <li><a href="{{ route('customer.complain')}}">{{\App\CPU\translate('Complain')}}</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-title">
                    <h3>{{\App\CPU\translate('My Account')}}</h3>
                    <ul>
                        <li><a href="@if(auth('customer')->check()){{ route('user-account')}} @else {{ route('customer.auth.login')}} @endif">{{\App\CPU\translate('Profile info')}}</a></li>
                        <li><a href="{{ route('wishlists')}}">{{\App\CPU\translate('Wish List')}}</a></li>
                        <li><a href="@if(auth('customer')->check()){{ route('account-oder')}} @else {{ route('customer.auth.login')}} @endif">{{\App\CPU\translate('Order History')}}</a></li>
                        <li><a href="{{ route('track-order.index')}}">{{\App\CPU\translate('Track Order')}}</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-title">
                    <h3>{{\App\CPU\translate('Download Our App')}}</h3>
                    <div class="download-icon mb-3">
                        <a target="_blank" href="https://play.google.com/store/apps/details?id=com.shoppingzonebd.android"><img src="{{ asset('assets/front-end') }}/images/logo/google_app.png"
                                alt="Google play store logo"></a>
                        <a href="#"><img src="{{ asset('assets/front-end') }}/images/logo/apple_app.png"
                                alt="Apple app store logo"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-2">
            <div class="col">
                <div class="text-center footer-pay-logo">
                    <img src="{{ asset('assets/front-end') }}/images/payment/SSLCommerz02.png" alt="">
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- Start  Copyright Section -->
<section class="copyright-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="copyright-text text-center">
                    <p>{{\App\CPU\translate('Copyright © 2024 - Shopping Zone BD All Rights Reserved. Desing &')}} <a target="_blank"
                            href="https://evertechit.com/">{{ $web_config['copyright_text']->value }}</a></p>
                </div>
            </div>
        </div>
    </div>
</section>

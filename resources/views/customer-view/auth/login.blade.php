@extends('layouts.front-end.app')
@section('title', \App\CPU\translate('Login'))
@push('css_or_js')
    <style>
        .password-toggle-btn .custom-control-input:checked~.password-toggle-indicator {
            color: {{ $web_config['primary_color'] }};
        }

        .for-no-account {
            margin: auto;
            text-align: center;
        }
    </style>

    <style>
        .input-icons i {
            /* position: absolute; */
            cursor: pointer;
        }

        .input-icons {
            width: 100%;
            margin-bottom: 10px;
        }

        .icon {
            padding: 9% 0 0 0;
            min-width: 40px;
        }

        .input-field {
            width: 94%;
            padding: 10px 0 10px 10px;
            text-align: center;
            border-right-style: none;
        }

        .card {
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
        }
    </style>
@endpush
@section('content')
    <div class="container py-4 py-lg-5 my-4"
        style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card border-0 box-shadow">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="login-image">
                                <img src="{{ asset('assets/front-end/img/login-img.jpg')}}" style="width: 100%;" alt="">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="">
                                <div class="card-body">
                                    <h2 class="h4 mb-1">{{ \App\CPU\translate('sign_in') }}</h2>
                                    <hr class="mt-2">
                                    {{-- <h3 class="font-size-base pt-4 pb-2">{{\App\CPU\translate('or_using_form_below')}}</h3> --}}
                                    <form class="needs-validation mt-2" autocomplete="off" action="{{ route('customer.auth.login') }}"
                                        method="post" id="form-id">
                                        @csrf
                                        <div class="form-group">
                                            <label for="si-email">{{ \App\CPU\translate('email_address') }}
                                                / {{ \App\CPU\translate('phone') }}</label>
                                            <input class="form-control" type="text" name="user_id" id="si-email"
                                                style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                                                value="{{ old('user_id') }}"
                                                placeholder="{{ \App\CPU\translate('Enter_email_address_or_phone_number') }}" required>
                                            <div class="invalid-feedback">
                                                {{ \App\CPU\translate('please_provide_valid_email_or_phone_number') }}
                                                .
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="si-password">{{ \App\CPU\translate('password') }}</label>
                                            <div class="password-toggle">
                                                <input class="form-control" name="password" type="password" id="si-password"
                                                    style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                                                    required>
                                                <label class="password-toggle-btn">
                                                    <input class="custom-control-input" type="checkbox"><i
                                                        class="czi-eye password-toggle-indicator"></i><span
                                                        class="sr-only">{{ \App\CPU\translate('Show') }}
                                                        {{ \App\CPU\translate('password') }} </span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group d-flex flex-wrap justify-content-between">

                                            <div class="form-group">
                                                <input type="checkbox"
                                                    class="{{ Session::get('direction') === 'rtl' ? 'ml-1' : 'mr-1' }}" name="remember"
                                                    id="remember" {{ old('remember') ? 'checked' : '' }}>

                                                <label class="" for="remember">{{ \App\CPU\translate('remember_me') }}</label>
                                            </div>
                                            <a class="font-size-sm" href="{{ route('customer.auth.recover-password') }}">
                                                {{ \App\CPU\translate('forgot_password') }}?
                                            </a>
                                        </div>
                                        {{-- recaptcha --}}
                                        @php($recaptcha = \App\CPU\Helpers::get_business_settings('recaptcha'))
                                        @if (isset($recaptcha) && $recaptcha['status'] == 0)
                                            <div id="recaptcha_element" style="width: 100%;" data-type="image"></div>
                                            <br />
                                        @else
                                            <div class="row p-2">
                                                <div class="col-6 pr-0">
                                                    <input type="text" class="form-control form-control-lg"
                                                        name="default_captcha_value" value=""
                                                        placeholder="{{ \App\CPU\translate('Enter captcha value') }}"
                                                        style="border: none" autocomplete="off">
                                                </div>
                                                <div class="col-6 input-icons" style="background-color: #FFFFFF; border-radius: 5px;">
                                                    <a onclick="javascript:re_captcha();">
                                                        <img src="{{ URL('/customer/auth/code/captcha/1') }}" class="input-field"
                                                            id="default_recaptcha_id" style="display: inline;width: 90%; height: 75%">
                                                        <i class="tio-refresh icon"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        @endif
                                        <button class="btn btn-primary btn-block btn-shadow"
                                            type="submit">{{ \App\CPU\translate('sign_in') }}</button>
                                    </form>
                                </div>
                                <div class="">
                                    <div class="p-3 d-flex justify-content-between">
                                        <div class="mb-3">
                                            <h6>{{ \App\CPU\translate('no_account_Sign_up_now') }}</h6>
                                        </div>
                                        <div class="mb-3">
                                            <a class="btn btn-outline-primary" href="{{ route('customer.auth.sign-up') }}">
                                                <i class="fa fa-user-circle"></i> {{ \App\CPU\translate('sign_up') }}
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        @foreach (\App\CPU\Helpers::get_business_settings('social_login') as $socialLoginService)
                                            @if (isset($socialLoginService) && $socialLoginService['status'] == true)
                                                <div class="col-sm-6 text-center mb-1 mx-auto">
                                                    <a class="btn btn-outline-primary"
                                                        href="{{ route('customer.auth.service-login', $socialLoginService['login_medium']) }}"
                                                        style="width: 100%">
                                                        <i
                                                            class="czi-{{ $socialLoginService['login_medium'] }} mr-2 ml-n1"></i>{{ \App\CPU\translate('sign_in_with_' . $socialLoginService['login_medium']) }}
                                                    </a>
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')

    {{-- recaptcha scripts start --}}
    @if (isset($recaptcha) && $recaptcha['status'] == 1)
        <script type="text/javascript">
            var onloadCallback = function() {
                grecaptcha.render('recaptcha_element', {
                    'sitekey': '{{ \App\CPU\Helpers::get_business_settings('recaptcha')['site_key'] }}'
                });
            };
        </script>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
        <script>
            $("#form-id").on('submit', function(e) {
                var response = grecaptcha.getResponse();

                if (response.length === 0) {
                    e.preventDefault();
                    toastr.error("{{ \App\CPU\translate('Please check the recaptcha') }}");
                }
            });
        </script>
    @else
        <script type="text/javascript">
            function re_captcha() {
                $url = "{{ URL('/customer/auth/code/captcha') }}";
                $url = $url + "/" + Math.random();
                document.getElementById('default_recaptcha_id').src = $url;
                console.log('url: ' + $url);
            }
        </script>
    @endif
    {{-- recaptcha scripts end --}}
@endpush

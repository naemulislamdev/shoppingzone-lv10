<style>
    .header-right-s-icon-box {
        background: white;
        padding: 4px 4px;
        border-radius: 50%;
        width: 40px;
        height: 40px;
    }
</style>
<div id="headerMain" class="d-none">
    <header id="header" style="background-color: #082355"
        class="navbar navbar-expand-lg navbar-fixed navbar-height navbar-flush navbar-container navbar-bordered">

        <div class="navbar-nav-wrap">
            <div class="navbar-brand-wrapper">
                <!-- Logo -->
                @php($e_commerce_logo = \App\Model\BusinessSetting::where(['type' => 'company_web_logo'])->first()->value)
                <a class="navbar-brand" href="{{ route('admin.dashboard.index') }}" aria-label="">
                    <img class="navbar-brand-logo" style="max-height: 42px;"
                        onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                        src="{{ asset("storage/company/$e_commerce_logo") }}" alt="Logo">
                    <img class="navbar-brand-logo-mini" style="max-height: 42px;"
                        onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                        src="{{ asset("storage/company/$e_commerce_logo") }}" alt="Logo">
                </a>
                <!-- End Logo -->
            </div>

            <div class="navbar-nav-wrap-content-left">
                <!-- Navbar Vertical Toggle -->
                <button type="button" class="js-navbar-vertical-aside-toggle-invoker close mr-3">
                    <i class="tio-first-page navbar-vertical-aside-toggle-short-align" data-toggle="tooltip"
                        data-placement="right" title="Collapse"></i>
                    <i class="tio-last-page navbar-vertical-aside-toggle-full-align"
                        data-template='<div class="tooltip d-none d-sm-block" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                        data-toggle="tooltip" data-placement="right" title="Expand"></i>
                </button>
                <!-- End Navbar Vertical Toggle -->

            </div>


            <!-- Secondary Content -->
            <div class="navbar-nav-wrap-content-right"
                style="{{ Session::get('direction') === 'rtl' ? 'margin-left:unset; margin-right: auto' : 'margin-right:unset; margin-left: auto' }}">

                <!-- Navbar -->
                <ul class="navbar-nav align-items-center flex-row">
                    <li class="nav-item d-none d-sm-inline-block">
                        <div class="d-none d-md-block">
                            <form class="form-inline" action="{{ route('admin.product.productsearch') }}" method="get"
                                enctype="multipart/form-data">

                                <div class="input-group">
                                    <input type="text" class="form-control" name="name" id="searchProduct"
                                        placeholder="Search Product">
                                    <div class="input-group-append">
                                        <button type="submit" class="btn btn-primary" style="background: #f26d21; border:0px;"><i class="tio-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <li class="nav-item d-none d-sm-inline-block">
                        <div class="hs-unfold">
                            <div class="header-right-s-icon-box" style="">
                                @php($local = session()->has('local') ? session('local') : 'en')
                                @php($lang = \App\Model\BusinessSetting::where('type', 'language')->first())
                                <div
                                    class="topbar-text dropdown disable-autohide {{ Session::get('direction') === 'rtl' ? 'ml-3' : 'm-1' }} text-capitalize">
                                    <a class="topbar-link" href="#" data-toggle="dropdown"
                                        style="color: black!important;">
                                        @foreach (json_decode($lang['value'], true) as $data)
                                            @if ($data['code'] == $local)
                                                <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                    width="20"
                                                    src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                                    alt="Eng">
                                            @endif
                                        @endforeach
                                    </a>
                                    <ul class="dropdown-menu">
                                        @foreach (json_decode($lang['value'], true) as $key => $data)
                                            @if ($data['status'] == 1)
                                                <li>
                                                    <a class="dropdown-item pb-1"
                                                        href="{{ route('lang', [$data['code']]) }}">
                                                        <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                            width="20"
                                                            src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                                            alt="{{ $data['name'] }}" />
                                                        <span
                                                            style="text-transform: capitalize">{{ $data['name'] }}</span>
                                                    </a>
                                                </li>
                                            @endif
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="nav-item d-none d-sm-inline-block">
                        <div class="hs-unfold">
                            <a title="Website home"
                                class="js-hs-unfold-invoker btn btn-icon header-right-s-icon-box"
                                href="{{ route('home') }}" target="_blank">
                                <i class="tio-globe"></i>
                                {{-- <span class="btn-status btn-sm-status btn-status-danger"></span> --}}
                            </a>
                        </div>
                    </li>

                    @if (\App\CPU\Helpers::module_permission_check('support_section'))
                        <li class="nav-item d-none d-sm-inline-block">
                            <!-- Notification -->
                            <div class="hs-unfold">
                                <a class="js-hs-unfold-invoker btn btn-icon header-right-s-icon-box"
                                    href="{{ route('admin.contact.list') }}">
                                    <i class="tio-email"></i>
                                    @php($message = \App\Model\Contact::where('seen', 0)->count())
                                    @if ($message != 0)
                                        <span class="btn-status btn-status-danger">{{ $message }}</span>
                                    @endif
                                </a>
                            </div>
                            <!-- End Notification -->
                        </li>
                    @endif

                    @if (\App\CPU\Helpers::module_permission_check('order_management'))
                        <li class="nav-item d-none d-sm-inline-block">
                            <!-- Notification -->
                            <div class="hs-unfold">
                                <a class="js-hs-unfold-invoker btn btn-icon header-right-s-icon-box"
                                    href="{{ route('admin.orders.list', ['status' => 'pending']) }}">
                                    <i class="tio-shopping-cart-outlined"></i>
                                    {{-- <span class="btn-status btn-sm-status btn-status-danger"></span> --}}
                                </a>
                            </div>
                            <!-- End Notification -->
                        </li>
                    @endif

                    <li class="nav-item view-web-site-info">
                        <div class="hs-unfold">
                            <a style="background-color: rgb(255, 255, 255)" onclick="openInfoWeb()" href="javascript:"
                                class="js-hs-unfold-invoker btn btn-icon btn-ghost-secondary rounded-circle">
                                <i class="tio-info"></i>
                            </a>
                        </div>
                    </li>



                    <li class="nav-item">
                        <!-- Account -->
                        <div class="hs-unfold">
                            <a class="js-hs-unfold-invoker navbar-dropdown-account-wrapper" href="javascript:;"
                                data-hs-unfold-options='{
                                     "target": "#accountNavbarDropdown",
                                     "type": "css-animation"
                                   }'>
                                <div class="avatar avatar-sm avatar-circle">
                                    <img class="avatar-img"
                                        onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                        src="{{ asset('storage/admin') }}/{{ auth('admin')->user()->image }}"
                                        alt="Image Description">
                                    <span class="avatar-status avatar-sm-status avatar-status-success"></span>
                                </div>
                            </a>

                            <div id="accountNavbarDropdown"
                                class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right navbar-dropdown-menu navbar-dropdown-account"
                                style="width: 16rem;">
                                <div class="dropdown-item-text">
                                    <div class="media align-items-center text-break">
                                        <div class="avatar avatar-sm avatar-circle mr-2">
                                            <img class="avatar-img"
                                                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/admin') }}/{{ auth('admin')->user()->image }}"
                                                alt="Image Description">
                                        </div>
                                        <div class="media-body">
                                            <span class="card-title h5">{{ auth('admin')->user()->f_name }}</span>
                                            <span class="card-text">{{ auth('admin')->user()->email }}</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="dropdown-divider"></div>

                                <a class="dropdown-item"
                                    href="{{ route('admin.profile.update', auth('admin')->user()->id) }}">
                                    <span class="text-truncate pr-2" title="Settings">Settings</span>
                                </a>

                                <div class="dropdown-divider"></div>

                                <a class="dropdown-item" href="javascript:"
                                    onclick="Swal.fire({
                                    title: 'Do you want to logout?',
                                    showDenyButton: true,
                                    showCancelButton: true,
                                    confirmButtonColor: '#377dff',
                                    cancelButtonColor: '#363636',
                                    confirmButtonText: `Yes`,
                                    denyButtonText: `Don't Logout`,
                                    }).then((result) => {
                                    if (result.value) {
                                    location.href='{{ route('admin.auth.logout') }}';
                                    } else{
                                    Swal.fire('Canceled', '', 'info')
                                    }
                                    })">
                                    <span class="text-truncate pr-2" title="Sign out">Sign out</span>
                                </a>
                            </div>
                        </div>
                        <!-- End Account -->
                    </li>
                </ul>
                <!-- End Navbar -->
            </div>
            <!-- End Secondary Content -->
        </div>
        <div id="website_info"
            style="display:none;background-color:rgb(165, 164, 164);width:100%;border-radius:0px 0px 5px 5px;">
            <div style="padding: 20px;">
                <div style="background:white;padding: 2px;border-radius: 5px;">
                    @php($local = session()->has('local') ? session('local') : 'en')
                    @php($lang = \App\Model\BusinessSetting::where('type', 'language')->first())
                    <div
                        class="topbar-text dropdown disable-autohide {{ Session::get('direction') === 'rtl' ? 'ml-3' : 'm-1' }} text-capitalize">
                        <a class="topbar-link dropdown-toggle" href="#" data-toggle="dropdown"
                            style="color: black!important;">
                            @foreach (json_decode($lang['value'], true) as $data)
                                @if ($data['code'] == $local)
                                    <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                        width="20"
                                        src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                        alt="Eng">
                                    {{ $data['name'] }}
                                @endif
                            @endforeach
                        </a>
                        <ul class="dropdown-menu">
                            @foreach (json_decode($lang['value'], true) as $key => $data)
                                @if ($data['status'] == 1)
                                    <li>
                                        <a class="dropdown-item pb-1" href="{{ route('lang', [$data['code']]) }}">
                                            <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                width="20"
                                                src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                                alt="{{ $data['name'] }}" />
                                            <span style="text-transform: capitalize">{{ $data['name'] }}</span>
                                        </a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div style="background:white;padding: 2px;border-radius: 5px;margin-top:10px;">
                    <a title="Website home" class="p-2" href="{{ route('home') }}" target="_blank">
                        <i class="tio-globe"></i>
                        {{-- <span class="btn-status btn-sm-status btn-status-danger"></span> --}}
                        {{ \App\CPU\translate('view_website') }}
                    </a>
                </div>
                @if (\App\CPU\Helpers::module_permission_check('support_section'))
                    <div style="background:white;padding: 2px;border-radius: 5px;margin-top:10px;">
                        <a class="p-2" href="{{ route('admin.contact.list') }}">
                            <i class="tio-email"></i>
                            {{ \App\CPU\translate('message') }}
                            @php($message = \App\Model\Contact::where('seen', 0)->count())
                            @if ($message != 0)
                                <span class="">({{ $message }})</span>
                            @endif
                        </a>
                    </div>
                @endif
                @if (\App\CPU\Helpers::module_permission_check('order_management'))
                    <div style="background:white;padding: 2px;border-radius: 5px;margin-top:10px;">
                        <a class="p-2" href="{{ route('admin.orders.list', ['status' => 'pending']) }}">
                            <i class="tio-shopping-cart-outlined"></i>
                            {{ \App\CPU\translate('Order_list') }}
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </header>
</div>
<div id="headerFluid" class="d-none"></div>
<div id="headerDouble" class="d-none"></div>

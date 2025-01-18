@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Contact View'))
@push('css_or_js')
    <link href="{{asset('assets/back-end')}}/css/select2.min.css" rel="stylesheet"/>
    <link href="{{asset('assets/back-end/css/croppie.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}"> {{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Message')}} {{\App\CPU\translate('view')}}</li>
            </ol>
        </nav>
        <!-- Page Heading -->
        <div class="container">
            <div class="d-sm-flex align-items-center justify-content-between mb-2">
                <h1 class="h3 mb-0 text-black-50">{{\App\CPU\translate('View_User_Message')}}</h1>
            </div>

            <!-- Content Row -->

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body mt-3 ml-4">
                            <div class="row " style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                                <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
                                    <img
                                        onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'"
                                        style="height: 8rem; width: 9rem;" class="img-circle"
                                        src="{{asset('storage/complaints')}}/{{$contact['images']}}"
                                        alt="User Pic">

                                </div>

                                <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                    <strong style="margin-right: 20px">{{$contact->name}}</strong>

                                    <br>
                                    <table class="table table-user-information">
                                        <tbody>
                                        <tr>
                                            <td>{{\App\CPU\translate('User')}} {{\App\CPU\translate('name')}}:</td>
                                            <td>{{$contact->name}}</td>
                                        </tr>
                                        <tr>
                                            <td>{{\App\CPU\translate('mobile_no')}}:</td>
                                            <td>{{$contact->phone}}</td>
                                        </tr>

                                        <tr>
                                            <td>{{\App\CPU\translate('messages')}}</td>
                                            <td><p style="font-width:16px;"> {{$contact->reasons}}</p></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>







                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('script')

@endpush

@extends('layouts.front-end.app')
@section('title', 'Our outlets')
@section('content')
    <style>
        .menu-area>ul>li>a {
            color: #1a1919;
        }

        .header-icon>a>.fa {
            color: #1a1919;
        }
    </style>
    <section class="offer-section py-5">
        <div class="container">
            <div class="row mb-4">
                <div class="col">
                    <div class="outlets-heading">
                        <h2>Get In <span style="color: #fb9b00;">Touch</span></h2>
                        <p>We’d love to hear from you. Drop us a line or visit us at our office.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($branchs as $branch)
                    <div class="col-md-4 mb-3">
                        <div class="outlets-box text-center">
                            <div class="sup-icon">
                                <i class="fa fa-map-marker"></i>
                            </div>
                            <div class="outlets-text">
                                <h2>{{ $branch->name }}</h2>
                                <p>{{ $branch->address }}</p>
                            </div>
                            <div class="outlets-map">
                                @if ($branch->map_url)
                                    <iframe src="{{ $branch->map_url }}" width="100%" height="350" style="border:0;"
                                        allowfullscreen="" loading="lazy"
                                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                                @else
                                    <span>Map are not available</span>
                                @endif

                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
@endsection

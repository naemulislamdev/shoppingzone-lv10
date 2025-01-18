@extends('layouts.front-end.app')
@section('title', \App\CPU\translate('Complain'))
@section('content')
    <style>
        .complain-box {
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            border-radius: 15px;
            overflow: hidden;
        }

        .complain-title {
            background: #f26d21;
            color: #fff;
            padding: 5px 0px;
            margin-bottom: 10px;
            border-radius: 7px;
        }

        .complain-title h3 {
            margin: 0;
            text-align: center;
        }
    </style>
    <section class="complain-section my-4">
        <div class="container">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="row">
                        <div class="col">
                            <div class="complain-title">
                                <h3>Drop Us a Message</h3>
                            </div>
                        </div>
                    </div>
                    <div class="complain-box">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="consult-img">
                                    <img src="{{ asset('assets/front-end/img/complain.jpg') }}" alt="">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-sec p-2">
                                    <form action="{{ route('customer.complain.store') }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <div class="form-group">
                                            <label>Name <span class="text-danger">*</span></label>
                                            <input type="text" name="name" class="form-control"
                                                placeholder="Enter your name">
                                            @error('name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Phone <span class="text-danger">*</span></label>
                                                    <input type="number" name="phone" class="form-control"
                                                        placeholder="Enter your phone">
                                                    @error('phone')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Attached file</label>
                                            <input type="file" name="image" class="form-control"
                                                accept=".jpg,.jpeg,.png">
                                            @error('image')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>Complain Details <span class="text-danger">*</span></label>
                                            <textarea class="form-control" name="complain_details" placeholder="Enter complain details"></textarea>
                                            @error('complain_details')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn common-btn">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

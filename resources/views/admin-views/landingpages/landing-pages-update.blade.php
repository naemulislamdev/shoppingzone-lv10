@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Landing Pages Update'))
@push('css_or_js')
    <link href="{{asset('assets/back-end/css/tags-input.min.css')}}" rel="stylesheet">
    <link href="{{ asset('assets/select2/css/select2.min.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Flash Deal')}}</li>
            <li class="breadcrumb-item">{{\App\CPU\translate('Update Deal')}}</li>
        </ol>
    </nav>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    {{ \App\CPU\translate('Landing Pages Form')}}
                        <a href="{{route('admin.landingpages.landing')}}" class="btn btn-primary float-right">{{ \App\CPU\translate('Back')}}</a>
                </div>
                <div class="card-body">
                    <form action="{{route('admin.landingpages.landing_pages_update',$landing_pages->id)}}" method="post" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">

                            <div class="row">
                                <div class="col-md-12">
                                        <label for="name">Title</label>
                                        <input type="text" name="title" value='{{$landing_pages->title}}' class="form-control" id="title"/>
                                </div>

                                <div class="col-md-12 pt-3">
                                    <label for="name">{{\App\CPU\translate('Main')}} {{\App\CPU\translate('Banner')}}</label><span class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 1900x400 )</span>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" name="image" id="customFileUpload" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="customFileUpload">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <div class="p-2 border border-dashed" style="max-width:430px;">
                                            <div class="row" id="multiBannerImage">
                                                @foreach (json_decode($landing_pages->main_banner) as $key => $photo)
                                                <div class="col-6">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <img style="width: 100%" height="auto"
                                                                 onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'"
                                                                 src="{{asset("storage/deal/main-banner/$photo")}}"
                                                                 alt="Product image">
                            <a href="{{route('admin.landingpages.remove-image',['id'=>$landing_pages->id,'name'=>$photo])}}"
                                                               class="btn btn-danger btn-block">{{\App\CPU\translate('Remove')}}</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                            </div>
                                        </div>
                                        @error('images')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                {{-- <div class="col-md-12" style="padding-top: 20px">
                                    <center>
                                        <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer"
                                        onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'" src="{{asset('storage/deal')}}/{{$landing_pages->main_banner}}" alt="banner image"/>
                                    </center>
                                </div> --}}

                                <div class="col-md-12 pt-3">
                                    <label for="name">{{\App\CPU\translate('Mid')}} {{\App\CPU\translate('Banner')}}</label><span class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 1900x300 )</span>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" name="mid_banner" id="customFileUpload1" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="customFileUpload1">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>
                                </div>
                                <div class="col-md-12" style="padding-top: 20px">
                                    <center>
                                        <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer1"
                                        onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'" src="{{asset('storage/deal')}}/{{$landing_pages->mid_banner}}" alt="banner image"/>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 pt-3">
                                    <label for="name">{{\App\CPU\translate('Left Side')}} {{\App\CPU\translate('Banner')}}</label><span class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 400x650 )</span>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" name="left_side_banner" id="leftImage" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="leftImage">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>

                                    <center>
                                        <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer2"
                                        onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'" src="{{asset('storage/deal')}}/{{$landing_pages->left_side_banner}}" alt="banner image"/>
                                    </center>
                                </div>
                                <div class="col-md-6 pt-3">
                                    <label for="name">{{\App\CPU\translate('Right Side')}} {{\App\CPU\translate('Banner')}}</label><span class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 400x650 )</span>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" name="right_side_banner" id="rightImage" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="rightImage">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>

                                    <center>
                                        <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer3"
                                        onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'" src="{{asset('storage/deal')}}/{{$landing_pages->right_side_banner}}" alt="banner image"/>
                                    </center>
                                </div>
                            </div>
                        </div>

                        <div class=" pl-0">
                            <button type="submit" class="btn btn-primary float-right">{{ \App\CPU\translate('update')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
    <script src="{{asset('assets/back-end')}}/js/select2.min.js"></script>
    <script src="{{ asset('assets/back-end/js/spartan-multi-image-picker.js') }}"></script>

    <script>

        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer1').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload1").change(function () {
            readURL1(this);
        });
        function leftImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer2').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#leftImage").change(function () {
            leftImage(this);
        });
        function rightImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer3').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#rightImage").change(function () {
            rightImage(this);
        });

        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });
    </script>

    <script>
        var imageCount = {{10-count(json_decode($landing_pages->main_banner))}};
        if (imageCount > 0) {
        $("#multiBannerImage").spartanMultiImagePicker({
            fieldName: 'images[]',
            maxCount: imageCount,
            rowHeight: 'auto',
            groupClassName: 'col-6',
            maxFileSize: '',
            placeholderImage: {
                image: '{{ asset('assets/back-end/img/400x400/img2.jpg') }}',
                width: '100%',
            },
            dropFileLabel: "Drop Here",
            onAddRow: function(index, file) {

            },
            onRenderedPreview: function(index) {

            },
            onRemoveRow: function(index) {

            },
            onExtensionErr: function(index, file) {
                toastr.error(
                    '{{ \App\CPU\translate('Please only input png or jpg type file') }}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
            },
            onSizeErr: function(index, file) {
                toastr.error('{{ \App\CPU\translate('File size too big') }}', {
                    CloseButton: true,
                    ProgressBar: true
                });
            }
        });
    }
    </script>
@endpush

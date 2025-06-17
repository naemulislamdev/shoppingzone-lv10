@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Landing Pages Update'))
@push('css_or_js')
    <link href="{{ asset('assets/back-end/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/select2/css/select2.min.css') }}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .upload-container {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
        }

        .custom-file-input {
            display: none;
            /* Hide the actual file input */
        }

        .custom-file-label {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .custom-file-label:hover {
            background-color: #0056b3;
        }

        .image-preview-container {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
            justify-content: center;
        }

        .preview-item {
            position: relative;
            margin: 10px;
            width: 120px;
            height: 120px;
        }

        .preview-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .remove-icon {
            position: absolute;
            top: 5px;
            right: 5px;
            background: rgba(255, 0, 0, 0.8);
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            font-size: 14px;
            line-height: 22px;
            text-align: center;
            transition: background 0.3s ease;
        }

        .remove-icon:hover {
            background: rgba(255, 0, 0, 1);
        }
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a
                        href="{{ route('admin.dashboard') }}">{{ \App\CPU\translate('Dashboard') }}</a></li>
                <li class="breadcrumb-item" aria-current="page">{{ \App\CPU\translate('Flash Deal') }}</li>
                <li class="breadcrumb-item">{{ \App\CPU\translate('Update Deal') }}</li>
            </ol>
        </nav>

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        {{ \App\CPU\translate('Landing Pages Form') }}
                        <a href="{{ route('admin.landingpages.landing') }}"
                            class="btn btn-primary float-right">{{ \App\CPU\translate('Back') }}</a>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.landingpages.landing_pages_update', $landing_pages->id) }}"
                            method="post"
                            style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">

                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="name">Title</label>
                                        <input type="text" name="title" value='{{ $landing_pages->title }}'
                                            class="form-control" id="title" />
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12" style="padding-top: 20px;">
                                            <label for="name">{{ \App\CPU\translate('Slider') }}
                                                {{ \App\CPU\translate('Banner') }}</label><span
                                                class="badge badge-soft-danger"> * ( {{ \App\CPU\translate('ratio') }}
                                                1900x500
                                                )</span>
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-6 ml-3">
                                            <div class="form-group">
                                                <label>{{ \App\CPU\translate('Upload product images') }}</label><small
                                                    style="color: red">* ( {{ \App\CPU\translate('ratio') }} 1:1 )</small>
                                            </div>
                                            <div class="upload-container">
                                                <input type="file" id="image-upload" name="images[]" multiple
                                                    accept="image/*" class="custom-file-input">
                                                <label for="image-upload" class="custom-file-label">Select Product
                                                    Images</label>
                                                <div id="image-preview" class="image-preview-container">
                                                </div>
                                            </div>
                                            <div class="exsit-image-container">
                                                <div class="row">
                                                    @if ($landing_pages->main_banner)
                                                        @foreach (json_decode($landing_pages->main_banner) as $key => $photo)
                                                            <div class="col-md-6 mb-2">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <img style="width: 100%" height="auto"
                                                                            onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                                            src="{{ asset("storage/deal/main-banner/$photo") }}"
                                                                            alt="Product image">

                                                                        <div class="d-flex">
                                                                            <a href="{{ route('admin.landingpages.remove-image', ['id' => $landing_pages->id, 'name' => $photo]) }}"
                                                                                class="btn btn-danger btn-xs m-1">{{ \App\CPU\translate('Remove') }}</a>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 pt-3">
                                        <label for="name">{{ \App\CPU\translate('Mid') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger">( {{ \App\CPU\translate('ratio') }} 1900x300
                                            )</span>
                                        <div class="custom-file" style="text-align: left">
                                            <input type="file" name="mid_banner" id="customFileUpload1"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="customFileUpload1">{{ \App\CPU\translate('choose') }}
                                                {{ \App\CPU\translate('file') }}</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="padding-top: 20px">
                                        <center>
                                            <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;"
                                                id="viewer1"
                                                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/deal') }}/{{ $landing_pages->mid_banner }}"
                                                alt="banner image" />
                                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pt-3">
                                        <label for="name">{{ \App\CPU\translate('Left Side') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger">( {{ \App\CPU\translate('ratio') }} 400x650
                                            )</span>
                                        <div class="custom-file" style="text-align: left">
                                            <input type="file" name="left_side_banner" id="leftImage"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="leftImage">{{ \App\CPU\translate('choose') }}
                                                {{ \App\CPU\translate('file') }}</label>
                                        </div>

                                        <center>
                                            <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;"
                                                id="viewer2"
                                                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/deal') }}/{{ $landing_pages->left_side_banner }}"
                                                alt="banner image" />
                                        </center>
                                    </div>
                                    <div class="col-md-6 pt-3">
                                        <label for="name">{{ \App\CPU\translate('Right Side') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger">( {{ \App\CPU\translate('ratio') }} 400x650
                                            )</span>
                                        <div class="custom-file" style="text-align: left">
                                            <input type="file" name="right_side_banner" id="rightImage"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="rightImage">{{ \App\CPU\translate('choose') }}
                                                {{ \App\CPU\translate('file') }}</label>
                                        </div>

                                        <center>
                                            <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;"
                                                id="viewer3"
                                                onerror="this.src='{{ asset('assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('storage/deal') }}/{{ $landing_pages->right_side_banner }}"
                                                alt="banner image" />
                                        </center>
                                    </div>
                                </div>
                            </div>

                            <div class=" pl-0">
                                <button type="submit"
                                    class="btn btn-primary float-right">{{ \App\CPU\translate('update') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="{{ asset('assets/back-end') }}/js/select2.min.js"></script>
    <script src="{{ asset('assets/back-end/js/spartan-multi-image-picker.js') }}"></script>

    <script>
        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer1').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload1").change(function() {
            readURL1(this);
        });

        function leftImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer2').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#leftImage").change(function() {
            leftImage(this);
        });

        function rightImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer3').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#rightImage").change(function() {
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
        $(document).ready(function() {
            const previewContainer = $("#image-preview");
            $("#image-upload").on("change", function(event) {
                previewContainer.empty(); // Clear existing previews
                const files = event.target.files;

                if (files) {
                    $.each(files, function(index, file) {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            const previewItem = $(`
                             <div class="preview-item">
                                 <img src="${e.target.result}" class="preview-image">
                                 <button type="button" class="remove-icon" data-index="${index}">&#10005;</button>
                             </div>
                         `);
                            previewContainer.append(previewItem);
                        };
                        reader.readAsDataURL(file);
                    });
                }
            });

            // Handle image removal
            previewContainer.on("click", ".remove-icon", function() {
                const indexToRemove = $(this).data("index");
                $(this).parent().remove();
                // Remove the corresponding file from the input (file list cannot be modified directly, so create a new list)
                const input = document.getElementById("image-upload");
                const dataTransfer = new DataTransfer();
                const files = input.files;

                // Add all files except the one to be removed
                for (let i = 0; i < files.length; i++) {
                    if (i !== indexToRemove) {
                        dataTransfer.items.add(files[i]);
                    }
                }

                // Update the input files
                input.files = dataTransfer.files;
            });
        });
    </script>
@endpush

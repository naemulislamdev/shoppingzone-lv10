@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Landing Pages'))

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
            margin-top: 50px;
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
                <li class="breadcrumb-item" aria-current="page">{{ \App\CPU\translate('Landing Pages Add') }}</li>
                <li class="breadcrumb-item">{{ \App\CPU\translate('Add new') }}</li>
            </ol>
        </nav>

        <!-- Content Row -->

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        {{ \App\CPU\translate('Landing-pages_form') }}
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.landingpages.landing') }}" method="post"
                            style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="name">{{ \App\CPU\translate('Title') }}</label>
                                        <input type="text" name="title" class="form-control" required
                                            placeholder="{{ \App\CPU\translate('Title') }}">
                                        @error('title')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                               <div class="row">
                                    <div class="col-md-12" style="padding-top: 20px;">
                                        <label for="name">{{ \App\CPU\translate('Slider') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger"> * ( {{ \App\CPU\translate('ratio') }} 1900x500
                                            )</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="upload-container">
                                            <input type="file" id="image-upload" name="images[]" multiple accept="image/*" class="custom-file-input">
                                            <label for="image-upload" class="custom-file-label">Select Slider Images</label>
                                            <div id="image-preview" class="image-preview-container"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12" style="padding-top: 20px;">
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
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <div style="text-align:center;">
                                            <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;"
                                                id="viewer1"
                                                src="{{ asset('public\assets\back-end\img\1920x400\img1.jpg') }}"
                                                alt="banner image" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6" style="padding-top: 20px;">
                                        <label for="left_side_banner">{{ \App\CPU\translate('Left side') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger">( {{ \App\CPU\translate('ratio') }} 400x650
                                            )</span>
                                        <div class="custom-file mb-3" style="text-align: left">
                                            <input type="file" name="left_side_banner" id="customFileUpload2"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="customFileUpload2">{{ \App\CPU\translate('choose') }}
                                                {{ \App\CPU\translate('file') }}</label>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div style="text-align:center;">
                                                    <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;"
                                                        id="viewer2"
                                                        src="{{ asset('public\assets\back-end\img\1920x400\img1.jpg') }}"
                                                        alt="banner image" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="padding-top: 20px;">
                                        <label for="right_side_banner">{{ \App\CPU\translate('Right side') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger">( {{ \App\CPU\translate('ratio') }} 400x650
                                            )</span>
                                        <div class="custom-file mb-3" style="text-align: left">
                                            <input type="file" name="right_side_banner" id="customFileUpload3"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="customFileUpload3">{{ \App\CPU\translate('choose') }}
                                                {{ \App\CPU\translate('file') }}</label>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div style="text-align:center;">
                                                    <img style="width:70%;border: 1px solid; border-radius: 10px; max-height:200px;"
                                                        id="viewer3"
                                                        src="{{ asset('public\assets\back-end\img\1920x400\img1.jpg') }}"
                                                        alt="banner image" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class=" pl-0">
                                <button type="submit"
                                    class="btn btn-primary float-right">{{ \App\CPU\translate('save') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="flex-between row justify-content-between align-items-center flex-grow-1 mx-1">
                            <div class="flex-between">
                                <div>
                                    <h5>{{ \App\CPU\translate('Landing pages table') }}</h5>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table id="datatable"
                                style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                                class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                style="width: 100%">
                                <thead class="thead-light">
                                    <tr>
                                        <th>{{ \App\CPU\translate('Title') }}</th>
                                        <th>{{ \App\CPU\translate('Slug') }}</th>
                                        <th>{{ \App\CPU\translate('status') }}</th>
                                        <th>{{ \App\CPU\translate('Product Add') }}</th>
                                        <th style="width: 50px">{{ \App\CPU\translate('action') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($landing_page as $k => $deal)
                                        <tr>

                                            <td>{{ $deal->title }}</td>
                                            <td><a href="https://shop.shoppingzonebd.com.bd/{{ $deal->slug }}" target="_blank">{{ $deal->slug }}</a></td>

                                            <td>
                                                <label class="switch">
                                                    <input type="checkbox" class="status" id="{{ $deal->id }}"
                                                        {{ $deal->status == 1 ? 'checked' : '' }}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.landingpages.add-product', $deal->id) }}"
                                                    class="btn btn-primary btn-sm">
                                                    {{ \App\CPU\translate('Add Product') }}
                                                </a>
                                            </td>
                                            <td>
                                                <a title="{{ \App\CPU\translate('Edit') }}"
                                                    href="{{ route('admin.landingpages.update', $deal->id) }}"
                                                    class="btn btn-primary btn-sm edit">
                                                    <i class="tio-edit"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>


                    @if (count($landing_page) == 0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{ asset('assets/back-end') }}/svg/illustrations/sorry.svg"
                                alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{ \App\CPU\translate('No data to show') }}</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>

    </div>
@endsection

@push('script')
    <!-- Page level plugins -->
    <script src="{{ asset('assets/back-end') }}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="{{ asset('assets/back-end') }}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Page level custom scripts -->
    <script src="{{ asset('assets/back-end/js/spartan-multi-image-picker.js') }}"></script>

    <script src="{{ asset('assets/back-end') }}/js/select2.min.js"></script>
    <script>
        function readURL3(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer3').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload3").change(function() {
            readURL3(this);
        });


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

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer2').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload2").change(function() {
            readURL2(this);
        });



        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });

        // Call the dataTables jQuery plugin
        $(document).ready(function() {
            $('#dataTable').DataTable();
        });



        $(document).on('change', '.status', function() {
            var id = $(this).attr("id");
            if ($(this).prop("checked") == true) {
                var status = 1;
            } else if ($(this).prop("checked") == false) {
                var status = 0;
            }
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{ route('admin.landingpages.status-update') }}",
                method: 'POST',
                data: {
                    id: id,
                    status: status
                },
                success: function() {
                    toastr.success('{{ \App\CPU\translate('Status updated successfully') }}');
                    location.reload();
                }
            });
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

@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Landing Pages'))

@push('css_or_js')
    <link href="{{ asset('assets/back-end/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/select2/css/select2.min.css') }}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <div class="d-flex justify-content-between mb-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a
                            href="{{ route('admin.dashboard') }}">{{ \App\CPU\translate('Dashboard') }}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{ \App\CPU\translate('Landing Pages Add') }}</li>
                </ol>
            </nav>
            <a href="{{route('admin.landingpages.index')}}" class="btn btn-primary">{{ \App\CPU\translate('Back') }}</a>
        </div>

        <!-- Content Row -->

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        {{ \App\CPU\translate('Landing-pages_form') }}
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.landingpages.store') }}" method="post"
                            style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                            enctype="multipart/form-data">
                            @csrf
                            @php($language = \App\Model\BusinessSetting::where('type', 'pnc_language')->first())
                            @php($language = $language->value ?? null)
                            @php($default_lang = 'en')

                            @php($default_lang = json_decode($language)[0])
                            <ul class="nav nav-tabs mb-4">
                                @foreach (json_decode($language) as $lang)
                                    <li class="nav-item">
                                        <a class="nav-link lang_link {{ $lang == $default_lang ? 'active' : '' }}"
                                            href="#"
                                            id="{{ $lang }}-link">{{ \App\CPU\Helpers::get_language_name($lang) . '(' . strtoupper($lang) . ')' }}</a>
                                    </li>
                                @endforeach
                            </ul>
                            <div class="form-group">
                                @foreach (json_decode($language) as $lang)
                                    <div class="row {{ $lang != $default_lang ? 'd-none' : '' }} lang_form"
                                        id="{{ $lang }}-form">
                                        <input type="text" name="deal_type" value="flash_deal" class="d-none">

                                    </div>
                                    <input type="hidden" name="lang[]" value="{{ $lang }}" id="lang">
                                @endforeach

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Title <span class="text-danger">*</span></label>
                                            <input type="text" name="title" class="form-control">
                                            @error('title')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12" style="padding-top: 20px;">
                                        <label for="name">{{ \App\CPU\translate('Slider') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger"> * ( {{ \App\CPU\translate('ratio') }} 1900x500
                                            )</span>

                                    </div>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <div class="p-2 border border-dashed" style="max-width:430px;">
                                            <div class="row" id="multiBannerImage"></div>
                                        </div>
                                        @error('images')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group pt-4">
                                            <label class="input-label">{{ \App\CPU\translate('description') }} <span
                                                    class="text-danger">*</span></label>
                                            <textarea name="description" class="editor" id="summernote" cols="5" rows="10">{{ old('description') }}</textarea>
                                            @error('description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label for="name">{{ \App\CPU\translate('Add new product') }} <span
                                                            class="text-danger">*</span></label>

                                                    <select id="example-getting-started"
                                                        class=" js-example-responsive form-control" name="product_id">
                                                        <option selected disabled>Select a product</option>
                                                        @foreach (\App\Model\Product::active()->orderBy('id', 'DESC')->get() as $key => $product)
                                                            <option value="{{ $product->id }}">
                                                                {{ $product['name'] }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    @error('product_id')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <h3>Feature of this product</h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6" style="padding-top: 20px;">
                                        <label>Feature title <span class="text-danger">*</span></label>
                                        <div id="input-container">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" name="feature_title[]"
                                                    placeholder="Enter value">
                                            </div>
                                        </div>

                                        <button type="button" class="btn btn-success add-new">Add New</button>
                                        @error('feature_title')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-md-6" style="padding-top: 20px;">
                                        <label for="feature_image">{{ \App\CPU\translate('Feature image') }}
                                            {{ \App\CPU\translate('Banner') }}</label><span
                                            class="badge badge-soft-danger">* ( {{ \App\CPU\translate('ratio') }} 400x650
                                            )</span>
                                        <div class="custom-file mb-3" style="text-align: left">
                                            <input type="file" name="feature_image" id="customFileUpload3"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="customFileUpload3">{{ \App\CPU\translate('choose') }}
                                                {{ \App\CPU\translate('file') }}</label>
                                        </div>
                                        @error('feature_image')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
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
                                <div class="row">
                                    <div class="col">
                                        <h3>Video of this product</h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Product Video <span class="text-danger">*</span></label>
                                            <input type="text" name="video_url" class="form-control">
                                            @error('video_url')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h3>Add more product related content</h3>
                                </div>
                            </div>
                            <div class="more_sections">
                            </div>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn btn-primary" id="add_new_section">Add more</button>
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
        $("#multiBannerImage").spartanMultiImagePicker({
            fieldName: 'images[]',
            maxCount: 10,
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
    </script>
    <script>
        $(document).ready(function() {
            // Function to handle adding new input fields
            $('.add-new').click(function() {
                let inputCount = $('#input-container .input-group').length;

                // Create new input field with delete button
                let newInput = `
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="feature_title[]" placeholder="Enter value">
                        <button type="button" class="btn btn-danger delete">Delete</button>
                    </div>`;

                // Append the new input field to the input container
                $('#input-container').append(newInput);
            });

            // Function to handle deleting input fields
            $(document).on('click', '.delete', function() {
                $(this).closest('.input-group').remove();
            });
        });
    </script>
    <script>
       $(document).ready(function() {
    let sectionCounter = 0;  // Initialize a counter

    // Add new section when clicking 'add_new_section'
    $('#add_new_section').click(function() {
        let newInput = `
            <div class="row mb-3">
                <div class="col-md-8">
                    <div class="form-group">
                        <label>Section title ${sectionCounter}</label>
                        <input type="text" name="section_title[]" class="form-control">
                    </div>
                </div>
                <div class="col-md-4">
                        <label class="form-check-label">Order button</label>
                    <div class="d-flex">
                        <div class="form-check mr-2">
                            <input class="form-check-input" type="radio" name="order_button[${sectionCounter}]"
                                id="yes_${sectionCounter}" value="1" checked>
                            <label class="form-check-label" for="yes_${sectionCounter}">
                                Yes
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="order_button[${sectionCounter}]"
                                id="no_${sectionCounter}" value="0">
                            <label class="form-check-label" for="no_${sectionCounter}">
                                No
                            </label>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Section Description</label>
                        <textarea name="section_description[]" class="form-control" placeholder="Enter description"></textarea>
                    </div>
                    <div class="d-flex">
                        <div class="form-check mr-2">
                            <input class="form-check-input" type="radio" name="section_direction[${sectionCounter}]"
                                id="descLeft_${sectionCounter}" value="left" checked>
                            <label class="form-check-label" for="descLeft_${sectionCounter}">
                                Left
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="section_direction[${sectionCounter}]"
                                id="descRight_${sectionCounter}" value="right">
                            <label class="form-check-label" for="descRight_${sectionCounter}">
                                Right
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Section Image</label>
                        <input type="file" name="section_img[]" class="form-control">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="delete-button float-right">
                        <button type="button" class="btn btn-danger section_delete">Remove</button>
                    </div>
                </div>
            </div>`;

        $('.more_sections').append(newInput);
        sectionCounter++;  // Increment the counter for the next section
    });

    // Remove section when clicking 'section_delete'
    $(document).on('click', '.section_delete', function() {
        $(this).closest('.row').remove();
    });
});

    </script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#summernote').summernote();
        });
    </script>
@endpush

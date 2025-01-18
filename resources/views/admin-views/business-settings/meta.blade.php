@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Meta Title And Description'))
@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('dashboard')}}</a></li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Meta Title And Description')}}</li>
            </ol>
        </nav>

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        {{ \App\CPU\translate('Meta Title And Description')}}
                    </div>
                    <div class="card-body">
                        <form style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                            @csrf
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="name" class="{{Session::get('direction') === "rtl" ? 'mr-1' : ''}}">{{\App\CPU\translate('Title')}}</label>
                                        <input type="text" name="title" class="form-control" id="title"
                                               placeholder="{{\App\CPU\translate('Enter Meta title')}}" required>
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <input type="hidden" id="id">
                                        <label for="link" class="{{Session::get('direction') === "rtl" ? 'mr-1' : ''}}">{{ \App\CPU\translate('Description')}}</label>
                                        <textarea  type="text" name="description" class="form-control" id="description"
                                               placeholder="{{\App\CPU\translate('Enter Meta Description')}}" required></textarea>
                                    </div>
                                    <div class="col-md-12">
                                        <input type="hidden" id="id">
                                    </div>

                                </div>
                            </div>

                            {{-- <div class="card-footer"> --}}
                                <!--<a id="add" class="btn btn-primary float-right" style="color: white">{{ \App\CPU\translate('save')}}</a>-->
                                <a id="update" class="btn btn-primary float-right"
                                   style="display: none; color: #fff;">{{ \App\CPU\translate('update')}}</a>
                            {{-- </div> --}}
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Meta Title And Description</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"
                                   style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                                <thead>
                                <tr>
                                    <th scope="col">{{ \App\CPU\translate('sl')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('Title')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('description')}}</th>
                                    <th scope="col" style="width: 120px">{{ \App\CPU\translate('action')}}</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        fetch_social_media();

        function fetch_social_media() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.business-settings.meta')}}",
                method: 'GET',
                success: function (data) {

                    if (data.length != 0) {
                        var html = '';
                        for (var count = 0; count < data.length; count++) {
                            html += '<tr>';
                            html += '<td class="column_name" data-column_name="sl" data-id="' + data[count].id + '">' + (count + 1) + '</td>';
                            html += '<td class="column_name" data-column_name="name" data-id="' + data[count].id + '">' + data[count].title + '</td>';
                            html += '<td class="column_name" data-column_name="slug" data-id="' + data[count].id + '">' + data[count].description + '</td>';
                            html += '<td><a type="button" class="btn btn-primary btn-xs edit" id="' + data[count].id + '"><i class="tio-edit"></i></a> </td></tr>';
                            // html += '<td><a type="button" class="btn btn-primary btn-xs delete" id="' + data[count].id + '"><i class="tio-add-to-trash"></i></a> </td></tr>';
                        }
                        $('tbody').html(html);
                    }
                }
            });
        }

        
        $('#update').on('click', function () {
            $('#update').attr("disabled", true);
            var id = $('#id').val();
            var title = $('#title').val();
            var description = $('#description').val();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.business-settings.meta-post-update')}}",
                method: 'POST',
                data: {
                    id: id,
                    title:title,
                    description: description,
                },
                success: function (data) {
                    $('#title').val('');
                    $('#description').val('');

                    toastr.success('{{\App\CPU\translate('Meta Title And Description updated Successfully')}}.');
                    $('#update').hide();
                    $('#add').show();
                    fetch_social_media();

                }
            });
            $('#save').hide();
        });
        
        $(document).on('click', '.edit', function () {
            $('#update').show();
            $('#add').hide();
            var id = $(this).attr("id");
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.business-settings.meta-post-edit')}}",
                method: 'POST',
                data: {id: id},
                success: function (data) {
                    $(window).scrollTop(0);
                    $('#id').val(data.id);
                    $('#name').val(data.title);
                    $('#link').val(data.description);
                    fetch_social_media()
                }
            });
        });
    </script>
@endpush

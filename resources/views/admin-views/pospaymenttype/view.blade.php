@extends('layouts.back-end.app')
@section('title', 'POS Payment Type')
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="{{asset('assets/back-end/css/croppie.css')}}" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">
    <!-- Page Heading -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{ \App\CPU\translate('Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">POS Payment Type</li>
        </ol>
    </nav>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12" style="margin-bottom: 10px;">
            <div class="card">
                <div class="card-header">
                    {{ \App\CPU\translate('Add')}} {{ \App\CPU\translate('new')}} Payment Type
                </div>
                <div class="card-body" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <form action="{{route('admin.pospaymenttype.store')}}" method="post">
                        @csrf

                        <div class="form-group  lang_form"
                                    id="form">
                            <input type="hidden" id="id">
                            <label for="name">Payment Type {{ \App\CPU\translate('Name')}}</label>
                            <input type="text" name="name" class="form-control" id="name"
                                   placeholder="Payment Type Name" required>
                        </div>




                            <button type="submit" class="btn btn-primary float-right">{{ \App\CPU\translate('submit')}}</button>

                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row flex-between justify-content-between align-items-center flex-grow-1">
                            <div class="col-12 col-md-7">
                                <h5>POS Payment Type {{ \App\CPU\translate('Table')}} <span style="color: red;">({{ $attributes->total() }})</span></h5>
                            </div>
                            <div class="col-12 col-md-5" style="width: 30vw">
                                <!-- Search -->
                                <form action="{{ url()->current() }}" method="GET">
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch_" type="search" name="search" class="form-control"
                                            placeholder="{{\App\CPU\translate('Search_by_Attribute_Name')}}" aria-label="Search orders" value="{{ $search }}" required>
                                        <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Search')}}</button>
                                    </div>
                                </form>
                                <!-- End Search -->
                            </div>
                        </div>
                </div>
                <div class="card-body" style="padding: 0; text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <div class="table-responsive">
                        <table id="datatable"
                               class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               style="width: 100%">
                            <thead class="thead-light">
                            <tr>
                                <th style="">{{ \App\CPU\translate('SL#')}}</th>
                                <th style="width: 40%;text-align:center;">{{ \App\CPU\translate('Name')}} </th>
                                <th style="width: 40%;text-align:center;">{{ \App\CPU\translate('Action')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($attributes as $key=>$attribute)
                                <tr>
                                    <td>{{$attributes->firstItem()+$key}}</td>
                                    <td style="width: 40%;text-align:center;">{{$attribute['name']}}</td>
                                    <td style="width: 40%;text-align:center;">

                                        <a class="btn btn-primary btn-sm edit" style="cursor: pointer;"
                                            title="{{ \App\CPU\translate('Edit')}}"
                                            href="{{route('admin.pospaymenttype.edit',$attribute['id'])}}">
                                            <i class="tio-edit"></i>
                                        </a>
                                        <a class="btn btn-danger btn-sm delete"style="cursor: pointer;"
                                            title="{{ \App\CPU\translate('Delete')}}"
                                            id="{{$attribute['id']}}">
                                            <i class="tio-add-to-trash"></i>
                                        </a>

                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    {!! $attributes->links() !!}
                </div>
                @if(count($attributes)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{ \App\CPU\translate('No_data_to_show')}}</p>
                        </div>
                    @endif
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
        $(".lang_link").click(function (e) {
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            console.log(lang);
            $("#" + "-form").removeClass('d-none');

        });

        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>
    <script>


        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: '{{\App\CPU\translate('Are_you_sure_to_delete_this')}}?',
                text: "{{\App\CPU\translate('You_will not_be_able_to_revert_this')}}!",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{\App\CPU\translate('Yes')}}, {{\App\CPU\translate('delete_it')}}!',
                type: 'warning',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.pospaymenttype.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('POS Payment Type Name Deleted Successfully');
                            location.reload();
                        }
                    });
                }
            })
        });



         // Call the dataTables jQuery plugin


    </script>
@endpush

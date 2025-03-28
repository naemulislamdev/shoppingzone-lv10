@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Contact List'))
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Customer Complain')}}</li>
        </ol>
    </nav>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2">
        <h1 class="h3 mb-0 text-black-50">{{\App\CPU\translate('Customer')}} {{\App\CPU\translate('Complain')}} {{\App\CPU\translate('List')}}</h1>
    </div>

    <div class="row" style="margin-top: 20px">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">

                    <div class="row justify-content-between align-items-center flex-grow-1">
                        <div class="flex-start col-lg-3 mb-3 mb-lg-0">
                            <h5>{{\App\CPU\translate('Customer')}} {{\App\CPU\translate('Complain')}} {{\App\CPU\translate('table')}} </h5>
                            <h5 style="color: red; margin-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 5px">({{ $contacts->total() }})</h5>
                        </div>
                        <div class="col-lg-6">
                            <!-- Search -->
                            <form action="{{ url()->current() }}" method="GET">
                                <div class="input-group input-group-merge input-group-flush">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="tio-search"></i>
                                        </div>
                                    </div>
                                    <input id="datatableSearch_" type="search" name="search" class="form-control"
                                        placeholder="{{\App\CPU\translate('Search_by_Name_or_Mobile_No_or_Email')}}" aria-label="Search orders" value="{{ $search }}" required>
                                    <button type="submit" class="btn btn-primary">{{\App\CPU\translate('search')}}</button>
                                </div>
                            </form>
                            <!-- End Search -->
                        </div>
                    </div>
                </div>
                <div class="card-body" style="padding: 0">
                    <div class="table-responsive">
                        <table id="datatable" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                               class="table table-hover table-borderless table-thead-bordered table-align-middle card-table"
                               style="width:100%;">
                            <thead class="thead-light">
                            <tr>
                                <th style="width: 5%">{{\App\CPU\translate('SL')}}#</th>
                                <th style="width: 15%">{{\App\CPU\translate('Name')}}</th>
                                <th style="width: 15%">{{\App\CPU\translate('mobile_no')}}</th>
                                <th style="width: 40%">{{\App\CPU\translate('Reason')}}</th>
                                <th style="width: 10%">{{\App\CPU\translate('action')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($contacts as $k=>$contact)
                                <tr>
                                    <td style="width: 5%">{{$contacts->firstItem()+$k}}</td>
                                    <td style="width: 15%">{{$contact['name']}}</td>
                                    <td style="width: 15%">{{$contact['phone']}}</td>
                                    <td style="width: 15%">{{$contact['reasons']}}</td>
                                    <td style="width: 10%">


                                        <div class="d-flex justify-content-between">
                                            <a  title="{{\App\CPU\translate('View')}}"
                                            class="btn btn-info btn-sm" style="cursor: pointer;"
                                            href="{{route('admin.complain.view',$contact->id)}}">
                                            <i class="tio-visible"></i>
                                        </a>

                                        </div>

                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    {{$contacts->links()}}
                </div>
                @if(count($contacts)==0)
                    <div class="text-center p-4">
                        <img class="mb-3" src="{{asset('assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                        <p class="mb-0">{{\App\CPU\translate('No_data_to_show')}}</p>
                    </div>
                @endif
            </div>
        </div>
    </div>

</div>
@endsection

@push('script')
    <!-- Page level plugins -->
    <script src="{{asset('assets/back-end')}}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="{{asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Page level custom scripts -->
    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable();
        });
        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: '{{\App\CPU\translate('Are_you_sure_delete_this')}}?',
                text: "{{\App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
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
                        url: "{{route('admin.contact.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('{{\App\CPU\translate('Contact_deleted_successfully')}}');
                            location.reload();
                        }
                    });
                }
            })
        });
    </script>
@endpush

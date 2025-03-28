@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Support Ticket'))
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="{{asset('assets/back-end/css/croppie.css')}}" rel="stylesheet">
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 48px;
            height: 23px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 15px;
            width: 15px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #377dff;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #377dff;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('support_ticket')}}</li>
            </ol>
        </nav>


        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">

                        <div class="flex-between row justify-content-between align-items-center flex-grow-1 mx-1">
                            <div class="flex-start">
                                <div><h5>{{\App\CPU\translate('support_ticket')}}</h5></div>
                                <div class="mx-1"><h5 style="color: red;">({{ $tickets->total() }})</h5></div>
                            </div>
                            <div style="width: 40vw">
                                <!-- Search -->
                                <form action="{{ url()->current() }}" method="GET">
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch_" type="search" name="search" class="form-control"
                                            placeholder="{{\App\CPU\translate('Search by Subject')}}" aria-label="Search orders" value="{{ $search }}" required>
                                        <button type="submit" class="btn btn-primary">{{\App\CPU\translate('search')}}</button>
                                    </div>
                                </form>
                                <!-- End Search -->
                            </div>
                        </div>

                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table id="datatable"
                                   style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                   class="table table-hover table-borderless table-thead-bordered table-align-middle card-table"
                                   style="width: 100%">
                                <thead class="thead-light">
                                <tr class="text-center">
                                    <th style="width: 10%">{{\App\CPU\translate('SL#')}}</th>
                                    <th style="width: 40%">{{\App\CPU\translate('Subject')}}</th>
                                    <th style="width: 15%">{{\App\CPU\translate('Priority')}}</th>
                                    <th style="width: 15%">{{\App\CPU\translate('Status')}}</th>
                                    <th style="width: 10%">{{\App\CPU\translate('Action')}}</th>
                                </tr>
                                </thead>
                                <?php
                                $i = 1;
                                ?>
                                <tbody>
                                @foreach($tickets as $key =>$ticket)
                                    <tr class="text-center">
                                        <td style="width: 10%">{{$tickets->firstItem()+$key}}</td>
                                        <td style="width: 40%"> {{$ticket->subject}}</td>
                                        <td style="width: 15%">{{$ticket->priority}}</td>
                                        <td style="width: 15%"><label class="switch"><input type="checkbox" class="status"
                                                                         id="{{$ticket->id}}" <?php if ($ticket->status == 'open') echo "checked" ?>><span
                                                    class="slider round"></span></label></td>
                                        <td style="width: 10%">
                                            <a href="{{route('admin.support-ticket.singleTicket',$ticket['id'])}}"
                                               class="btn btn-info btn-sm"
                                               title="{{\App\CPU\translate('View')}}">
                                               <i class="tio-visible"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        {{$tickets->links()}}
                    </div>
                    @if(count($tickets)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{\App\CPU\translate('No data to show')}}</p>
                        </div>
                    @endif
                </div>
            </div>
        @endsection

        @push('script')
            <!-- Page level plugins -->
                <script src="{{asset('assets/back-end')}}/vendor/datatables/jquery.dataTables.min.js"></script>
                <script
                    src="{{asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

                <script>
                    // Call the dataTables jQuery plugin
                    $(document).ready(function () {
                        $('#dataTable').DataTable();
                    });
                </script>

                <!-- Page level custom scripts -->
                <script src="{{asset('assets/back-end/js/croppie.js')}}"></script>
                <script>
                    $(document).on('change', '.status', function () {
                        var id = $(this).attr("id");
                        if ($(this).prop("checked") == true) {
                            var status = 'open';
                        } else if ($(this).prop("checked") == false) {
                            var status = 'close';
                        }

                        $.ajaxSetup({
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                            }
                        });
                        $.ajax({
                            url: "{{route('admin.support-ticket.status')}}",
                            method: 'POST',
                            data: {
                                id: id,
                                status: status
                            },
                            success: function (data) {
                                console.log(data);

                                toastr.success('Ticket closed successfully');
                            }
                        });
                    });
                </script>
    @endpush

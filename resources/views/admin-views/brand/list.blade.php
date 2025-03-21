@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Brand List'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-2">
            <h1 class="h3 mb-0 text-black-50">{{\App\CPU\translate('brand_list')}} <span style="color: rgb(252, 59, 10);">({{ $br->total() }})</span></h1>
        </div>

        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <!-- Search -->
                        <form action="{{ url()->current() }}" method="GET">
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control"
                                    placeholder="{{ \App\CPU\translate('Search')}} {{ \App\CPU\translate('Brands')}}" aria-label="Search orders" value="{{ $search }}" required>
                                <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Search')}}</button>
                            </div>
                        </form>
                        <!-- End Search -->

                        <div>
                            <a href="{{route('admin.brand.add-new')}}" class="btn btn-primary mr-2">
                                {{ \App\CPU\translate('add_new') }}
                            </a>
                            <a href="{{ route('admin.brand.export') }}" class="btn btn-success">
                                <i class="tio-download-to"></i>
                                {{ \App\CPU\translate('Export') }}
                            </a>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 100px">
                                        {{ \App\CPU\translate('brand')}} {{ \App\CPU\translate('ID')}}
                                    </th>
                                    <th scope="col">{{ \App\CPU\translate('name')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('Total Product')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('Total Order')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('image')}}</th>
                                    <th scope="col">{{\App\CPU\translate('Active')}} {{\App\CPU\translate('status')}}</th>
                                    <th scope="col" style="width: 100px" class="text-center">
                                        {{ \App\CPU\translate('action')}}
                                    </th>
                                </tr>
                                </thead>
                                <tbody>

                                @foreach($br as $k=>$b)


                                    <tr>
                                        <td class="text-center">{{$br->firstItem()+$k}}</td>
                                        <td>{{$b['name']}}</td>
                                        <td>{{ $b['brand_all_products_count'] }}</td>
                                        <td>{{ $b['brandAllProducts']->sum('order_details_count') }}</td>
                                        <td>
                                            <img class="rounded" style="width: 60px;height: 60px;"
                                                onerror="this.src='{{asset('assets/back-end/img/160x160/img2.jpg')}}'"
                                                 src="{{asset('storage/brand')}}/{{$b['image']}}">
                                        </td>
                                        <td>
                                            <label class="switch switch-status">
                                                <input type="checkbox" class="status"
                                                       id="{{$b['id']}}" {{$b['status'] == 1 ? 'checked':''}}>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <a class="btn btn-primary btn-sm" title="{{ \App\CPU\translate('Edit')}}"
                                               href="{{route('admin.brand.update',[$b['id']])}}">
                                                <i class="tio-edit"></i>
                                            </a>
                                            <a class="btn btn-danger btn-sm delete" title="{{ \App\CPU\translate('Delete')}}"
                                               id="{{$b['id']}}">
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
                        {{$br->links()}}
                    </div>
                    @if(count($br)==0)
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
        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: '{{ \App\CPU\translate('Are_you_sure_delete_this_brand')}}?',
                text: "{{ \App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{ \App\CPU\translate('Yes')}}, {{ \App\CPU\translate('delete_it')}}!',
                cancelButtonText: "{{ \App\CPU\translate('cancel')}}",
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.brand.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('{{ \App\CPU\translate('Brand_deleted_successfully')}}');
                            location.reload();
                        }
                    });
                }
            })
        });

        $(document).on('change', '.status', function () {
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
                url: "{{route('admin.brand.status-update')}}",
                method: 'POST',
                data: {
                    id: id,
                    status: status
                },
                success: function (data) {
                    console.log(data)
                    if (data.success == true) {
                        toastr.success('{{\App\CPU\translate('Status updated successfully')}}');
                    } else {
                        toastr.error('{{\App\CPU\translate('Status updated failed. Product must be approved')}}');
                        location.reload();
                    }
                }
            });
        });
    </script>
@endpush

@extends('layouts.back-end.app')

@section('title', 'Branch List')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">Branches</li>
            </ol>

        </nav>

        <div class="row mt-4">
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
                                    placeholder="{{ \App\CPU\translate('Search')}} Branch" aria-label="Search orders" value="{{ @$search }}" required>
                                <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Search')}}</button>
                            </div>
                        </form>
                        <!-- End Search -->

                        <a href="{{route('admin.branches.create')}}" class="btn btn-success">
                            <i class="tio-add"></i>
                            Add New Branch
                        </a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table
                                style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col">{{\App\CPU\translate('SL#')}}</th>
                                    <th scope="col">{{\App\CPU\translate('name')}}</th>
                                    <th scope="col">{{\App\CPU\translate('Phone')}}</th>
                                    <th scope="col">{{\App\CPU\translate('Email')}}</th>
                                    <th scope="col">{{\App\CPU\translate('Address')}}</th>
                                    <th scope="col">{{\App\CPU\translate('status')}}</th>
                                    <th scope="col" style="width: 50px">{{\App\CPU\translate('action')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($branches as $key=>$value)
                                    <tr>
                                        <td scope="col">{{$branches->firstItem()+$key}}</td>
                                        <td scope="col">{{$value->name}} </td>
                                        <td scope="col">{{$value->phone}}</td>
                                        <td scope="col">{{$value->email}}</td>
                                        <td scope="col">{{$value->address}}</td>
                                        <td scope="col">
                                            {!! $value->status=='1'?'<label class="badge badge-success">Active</label>':'<label class="badge badge-danger">In-Active</label>' !!}
                                        </td>


                                        <td>
                                            <a  title="Edit"
                                                class="btn btn-info btn-sm"
                                                href="{{route('admin.branches.edit',encrypt($value->id))}}">
                                                <i class="tio-edit"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        {!! $branches->links() !!}
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')

@endpush

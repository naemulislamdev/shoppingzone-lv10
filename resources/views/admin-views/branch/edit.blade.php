@extends('layouts.back-end.app')

@section('title', "Edit Branch")

@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid main-card rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">Edit Branch</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-12">
            <div class="card o-hidden border-0 shadow-lg my-4">
                <div class="card-body ">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="p-5">
                                <div class="text-center mb-2 ">
                                    <h3 class="" > Branch Create</h3>
                                    <hr>
                                </div>
                                <form class="user" action="{{route('admin.branches.update',[$b['id']])}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="id" value="{{$b->id}}">
                                    <h5 class="black">Branch {{\App\CPU\translate('Info')}} </h5>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-sm-0">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control form-control-user" id="exampleFirstName" name="name" value="{{$b->name}}" placeholder="Branch Name" required>
                                        </div>

                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-4 mb-sm-0">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control form-control-user" id="exampleInputEmail" name="email" value="{{$b->email}}" placeholder="{{\App\CPU\translate('email_address')}}" required>
                                        </div>
                                        <div class="col-sm-4 mb-sm-0">
                                            <label for="phone">Phone</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputPhone" name="phone" value="{{$b->phone}}" placeholder="{{\App\CPU\translate('phone_number')}}" required>
                                        </div>
                                        <div class="col-sm-4  mb-sm-0">
                                            <label for="name">Branch Status</label>
                                            <select class="form-control" name="status"
                                                    style="width: 100%">
                                                <option selected disabled>---{{\App\CPU\translate('select')}}---</option>
                                                <option value="0" @if($b->status==0) selected @endif>Inactive</option>
                                                <option value="1" @if($b->status==1) selected @endif>Active</option>

                                            </select>
                                        </div>
                                        <div class="col-sm-12 mb-sm-0">
                                            <label for="map_url">Google Map URL (Embed MAP Code)</label>
                                            <input type="text" class="form-control form-control-user" id="exampleInputmap_url" name="map_url" value="{{$b->map_url}}" placeholder="Google Map URL (Embed MAP Code)" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-sm-0">
                                            <label for="address">Address</label>
                                            <textarea name="address" class="form-control form-control-user" id="address" placeholder="Branch Address" >{{$b->address}}</textarea>
                                        </div>

                                    </div>


                                    <button type="submit" class="btn btn-primary btn-user btn-block" id="apply">Save </button>
                                </form>
                                <hr>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif
<script>







</script>
@endpush

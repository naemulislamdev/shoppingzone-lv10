@extends('layouts.back-end.app')

@section('title', "Edit Courier")

@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid main-card rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">Edit Courier</li>
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
                                    <h3 class="" > Courier Create</h3>
                                    <hr>
                                </div>
                                <form class="user" action="{{route('admin.couriers.update',[$b['id']])}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="id" value="{{$b->id}}">
                                    <h5 class="black">Courier {{\App\CPU\translate('Info')}} </h5>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-sm-0">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control form-control-user" id="exampleFirstName" name="name" value="{{$b->name}}" placeholder="Courier Name" required>
                                        </div>
                                        <div class="col-sm-4 mb-sm-0">
                                            <label for="phone">Phone</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputPhone" name="phone" value="{{$b->phone}}" placeholder="{{\App\CPU\translate('phone_number')}}" required>
                                        </div>
                                        <div class="col-sm-4  mb-sm-0">
                                            <label for="name">Courier Status</label>
                                            <select class="form-control" name="status"
                                                    style="width: 100%">
                                                <option selected disabled>---{{\App\CPU\translate('select')}}---</option>
                                                <option value="0" @if($b->status==0) selected @endif>Inactive</option>
                                                <option value="1" @if($b->status==1) selected @endif>Active</option>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-4 mb-sm-0">
                                            <label for="delivery_charge">Delivery Charge</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputdelivery_charge" name="delivery_charge" value="{{$b->delivery_charge}}" placeholder="Delivery Charge Amount" required>
                                        </div>
                                        <div class="col-sm-4 mb-sm-0">
                                            <label for="payable">Payable</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputPayable" name="payable" value="{{$b->payable}}" placeholder="Payable Amount" required>
                                        </div>
                                        <div class="col-sm-4 mb-sm-0">
                                            <label for="cod_charge">COD Charge</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputcod_charge" name="cod_charge" value="{{$b->cod_charge}}" placeholder="COD Charge Amount" required>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <div class="col-sm-6 mb-sm-0">
                                            <label for="inside_dhaka_amount">Inside Dhaka</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputinside_dhaka_amount" name="inside_dhaka_amount" value="{{$b->inside_dhaka_amount}}" placeholder="Inside Dhaka Amount" required>
                                        </div>
                                        <div class="col-sm-6 mb-sm-0">
                                            <label for="outside_dhaka_amount">Outside Dhaka</label>
                                            <input type="number" class="form-control form-control-user" id="exampleInputoutside_dhaka_amount" name="outside_dhaka_amount" value="{{$b->outside_dhaka_amount}}" placeholder="Inside Dhaka Amount" required>
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

@extends('layouts.back-end.app')
@section('title', 'POS Payment Type')
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="{{asset('assets/back-end/css/croppie.css')}}" rel="stylesheet">
@endpush

@section('content')
    <div class="content container-fluid">

        <div class="row">
            <div class="col-md-12" style="margin-bottom: 10px;">
                <div class="card">
                    <div class="card-header">
                        <h3>{{ \App\CPU\translate('update')}} POS Payment Type</h3>
                    </div>
                    <div class="card-body"
                         style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                        <form action="{{route('admin.pospaymenttype.update',[$attribute['id']])}}" method="post">
                            @csrf




                                <div class="form-group lang_form"
                                     id="-form">
                                    <input type="hidden" id="id">
                                    <label
                                        for="name">POS Payment Type {{ \App\CPU\translate('Name')}}</label>
                                    <input type="text" name="name"
                                           value="{{$attribute['name']}}"
                                           class="form-control" id="name"
                                           placeholder="POS Payment Type" required>
                                </div>

                            <button type="submit" class="btn btn-primary float-right">{{ \App\CPU\translate('update')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div>
            @endsection

            @push('script')
                <script>
                    $(".lang_link").click(function (e) {
                        e.preventDefault();
                        $(".lang_link").removeClass('active');
                        $(".lang_form").addClass('d-none');
                        $(this).addClass('active');

                        let form_id = this.id;
                        $("#" + "-form").removeClass('d-none');

                    });

                    $(document).ready(function () {
                        $('#dataTable').DataTable();
                    });
                </script>
    @endpush

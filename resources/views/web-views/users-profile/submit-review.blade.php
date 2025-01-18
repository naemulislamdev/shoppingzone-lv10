@extends('layouts.front-end.app')

@section('title', \App\CPU\translate('submit_a_review'))

@section('content')

    <!-- Page Content-->
    <div class="container pb-5 mb-2 mb-md-4 mt-2 rtl"
        style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
        <div class="row">
            <!-- Sidebar-->
            @include('web-views.partials._profile-aside')
            <section class="col-lg-9  col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h5 style="margin-left: 20px;">{{ \App\CPU\translate('submit_a_review') }}</h3>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('review.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">{{ \App\CPU\translate('rating') }} <span class="text-danger">*</span></label>
                                    <select class="form-control" name="rating">
                                        <option disabled>Select your review</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                    @error('rating')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">{{ \App\CPU\translate('comment') }} <span class="text-danger">*</span></label>
                                    <input name="product_id" value="{{ $order_details->product_id }}" hidden>
                                    <input name="order_id" value="{{ $order_details->order_id }}" hidden>
                                    <textarea class="form-control" name="comment"></textarea>
                                    @error('comment')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">{{ \App\CPU\translate('attachment') }}</label>
                                    <div id="multi_image_picker" class="row"></div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="{{ URL::previous() }}"
                                    class="btn btn-secondary">{{ \App\CPU\translate('back') }}</a>
                                <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('submit') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>

    </div>
@endsection

@push('scripts')
    <script type="text/javascript">
        $(function() {
            $("#multi_image_picker").spartanMultiImagePicker({
                fieldName: 'fileUpload[]', // this configuration will send your images named "fileUpload" to the server
                directUpload: {
                    status: true,
                    loaderIcon: `<div class="spinner-border text-primary"></div>`, // spinner class from bootstrap
                    url: 'action.php',
                    additionalParam: {
                        name: 'My Name'
                    },
                    success: function(data, textStatus, jqXHR) {

                    },
                    error: function(jqXHR, textStatus, errorThrown) {

                    }
                }
            });
        });
    </script>
@endpush

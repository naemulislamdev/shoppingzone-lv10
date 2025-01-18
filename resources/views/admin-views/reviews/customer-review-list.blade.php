@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Review List'))

@push('css_or_js')
    <style>
        .form-inline {
            display: inline;
        }
    </style>
    <style>
        @media (min-width: 300px) {
            .filter {
                margin-top: 0.4rem !important;
            }

            .export {
                margin-top: 0.1rem !important;
            }
        }

        @media (min-width: 768px) {
            .filter {
                margin-top: 2rem !important;
            }

            .export {
                margin-top: 2rem !important;
            }
        }
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ \App\CPU\translate('Dashboard') }}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{ \App\CPU\translate('reviews') }}</li>
            </ol>
        </nav>
        <div class="card p-4">
            <div class="row">
                <div class="col-12 col-md-6">
                    <h5>{{ \App\CPU\translate('Review') }} {{ \App\CPU\translate('Table') }} <span
                            class="text-danger">({{ $data['clients']->total() }})</span> </h5>
                </div>
                <div class="col-12 col-md-6 pb-2">
                    <!-- Search -->


                    <!-- End Search -->
                </div>

            </div>

        </div>
        <!-- End Page Header -->
        <div class="card">
            <div class="table-responsive datatable-custom">
                <table
                    class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                    style="width: 100%; text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
                    <thead class="thead-light">
                        <tr>
                            <th>#{{ \App\CPU\translate('sl') }}</th>
                            <th>{{ \App\CPU\translate('Customer') }}</th>
                            <th>{{ \App\CPU\translate('Rating') }}</th>
                            <th>{{ \App\CPU\translate('Review') }}</th>
                            <th>{{ \App\CPU\translate('date') }}</th>
                            <th>{{ \App\CPU\translate('status') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data['clients'] as $key => $review)

                                <tr>
                                    <td>
                                        {{ $data['clients']->firstItem()+$key }}
                                    </td>

                                    <td>
                                        @if ($review->customer_id)
                                            <a href="{{ route('admin.customer.view', [$review->customer_id]) }}">
                                                {{ $review->customer->f_name . ' ' . $review->customer->l_name }}
                                            </a>
                                        @else
                                            <label
                                                class="badge badge-danger">{{ \App\CPU\translate('customer_removed') }}</label>
                                        @endif
                                    </td>
                                    <td>
                                        <label class="badge badge-soft-info">
                                            <span style="font-size: .9rem;">{{ $review->ratings }} <i class="tio-star"></i>
                                            </span>
                                        </label>
                                    </td>
                                    <td>
                                        <p style=" word-wrap: break-word;">
                                            {{ $review->comment ? Str::limit($review->comment, 35) : 'No Comment Found' }}

                                        </p>

                                    </td>
                                    <td>{{ date('d M Y', strtotime($review->created_at)) }}</td>
                                    <td>
                                        <label class="toggle-switch toggle-switch-sm">
                                            <input type="checkbox" class="toggle-switch-input"
                                                onclick="location.href='{{ route('admin.reviews.reviewstatus', [$review['id'], $review->status ? 0 : 1]) }}'"
                                                class="toggle-switch-input" {{ $review->status ? 'checked' : '' }}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>

                                </tr>

                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- Footer -->
            <div class="card-footer">
                <!-- Pagination -->
                <div class="row table-responsive">
                    <div class="">
                        <div class="">
                            <!-- Pagination -->
                            {!! $data['clients']->links() !!}
                        </div>
                    </div>
                </div>
                <!-- End Pagination -->
            </div>
            <!-- End Footer -->
        </div>
    </div>
@endsection

@push('script_2')
    <script>
        $(document).on('ready', function() {
            // INITIALIZATION OF DATATABLES



            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>
    <script>
        $(document).on('change', '#from_date', function() {
            from_date = $(this).val();
            if (from_date) {
                $("#to_date").prop('required', true);
            }
        });
    </script>
    <script>
        $('#from_date , #to_date').change(function() {
            let fr = $('#from_date').val();
            let to = $('#to_date').val();
            if (fr != '' && to != '') {
                if (fr > to) {
                    $('#from_date').val('');
                    $('#to_date').val('');
                    toastr.error('Invalid date range!', Error, {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            }

        })
    </script>
@endpush

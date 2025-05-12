@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Report'))


@section('content')
    <div class="content container-fluid">
        {{-- @dd($data['most_wishlisted_products']) --}}
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Most Added to Cart Products</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="cartChart" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Most Wishlisted Products</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="mostWishlistProduct" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Most Check Out Products</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="mostCheckOutProduct" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Cart Abandonment Analysis</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="cartAbandon" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>View By Region</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="views_by_region" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Wishlist to Purchase Conversion</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="wishlist_to_purchase_conversion" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Revenue Per Product</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="revenueChart" width="600" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 mb-3">
            <!-- Card -->
            <div class="card h-100">
                <!-- Header -->
                <div class="card-header">
                    <h5 class="card-header-title">
                        <i class="tio-company"></i>
                        {{ \App\CPU\translate('App vs Web') }}
                    </h5>
                </div>
                <!-- End Header -->
                <!-- Body -->
                <div class="card-body">
                    <!-- Chart -->
                    <div class="chartjs-custom mx-auto">
                        <canvas id="business-overview" class="mt-2"></canvas>
                    </div>
                    <!-- End Chart -->
                </div>
                <!-- End Body -->
            </div>
            <!-- End Card -->
        </div>
        <div class="row">
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h2>Checkout Completion</h2>
                    </div>
                    <div class="card-body">
                        <canvas id="checkoutCompletionLineChart" height="100"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Stats -->
    </div>
@endsection

@push('script')
    <script src="{{ asset('assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script src="{{ asset('assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js">
    </script>
    <script>
        // Full product names
        const fullLabels = {!! json_encode(array_column($data['most_added_to_cart'], 'name')) !!};

        // Truncated labels for x-axis display
        const shortLabels = {!! json_encode(
            array_map(function ($product) {
                return strlen($product['name']) > 10 ? mb_substr($product['name'], 0, 10) . '...' : $product['name'];
            }, $data['most_added_to_cart']),
        ) !!};

        const data = {!! json_encode(array_column($data['most_added_to_cart'], 'cart_additions')) !!};

        const ctx = document.getElementById('cartChart').getContext('2d');
        const cartChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: shortLabels,
                datasets: [{
                    label: 'Cart Additions',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                // Use full name in tooltip title
                                const index = tooltipItems[0].dataIndex;
                                return fullLabels[index];
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        // Full product names
        const mwpFTitle = {!! json_encode(array_column($data['most_wishlisted_products'], 'name')) !!};

        // Truncated labels for x-axis display
        const mwpSTitle = {!! json_encode(
            array_map(function ($product) {
                return strlen($product['name']) > 10 ? mb_substr($product['name'], 0, 10) . '...' : $product['name'];
            }, $data['most_wishlisted_products']),
        ) !!};

        const mwp_data = {!! json_encode(array_column($data['most_wishlisted_products'], 'wishlist_additions')) !!};

        const mwp = document.getElementById('mostWishlistProduct').getContext('2d');
        const mostWishlistProduct = new Chart(mwp, {
            type: 'bar',
            data: {
                labels: mwpSTitle,
                datasets: [{
                    label: 'Wishlist Additions',
                    data: mwp_data,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                // Use full name in tooltip title
                                const index = tooltipItems[0].dataIndex;
                                return mwpFTitle[index];
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        const mcpFTitle = {!! json_encode(array_column($data['most_checked_out_products'], 'name')) !!};

        const mcpSTitle = {!! json_encode(
            array_map(function ($product) {
                return strlen($product['name']) > 10 ? mb_substr($product['name'], 0, 10) . '...' : $product['name'];
            }, $data['most_checked_out_products']),
        ) !!};

        const mcp_data = {!! json_encode(array_column($data['most_checked_out_products'], 'checkout_count')) !!};

        const mcp = document.getElementById('mostCheckOutProduct').getContext('2d');
        const mostCheckOutProduct = new Chart(mcp, {
            type: 'bar',
            data: {
                labels: mcpSTitle,
                datasets: [{
                    label: 'Most Check Out Products',
                    data: mcp_data,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                // Use full name in tooltip title
                                const index = tooltipItems[0].dataIndex;
                                return mcpFTitle[index];
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        const caaFTitle = {!! json_encode(array_column($data['cart_abandonment_analysis'], 'name')) !!};

        const caaSTitle = {!! json_encode(
            array_map(function ($product) {
                return strlen($product['name']) > 10 ? mb_substr($product['name'], 0, 10) . '...' : $product['name'];
            }, $data['cart_abandonment_analysis']),
        ) !!};

        const caa_data = {!! json_encode(array_column($data['cart_abandonment_analysis'], 'cart_additions')) !!};

        const caa = document.getElementById('cartAbandon').getContext('2d');
        const cartAbandon = new Chart(caa, {
            type: 'bar',
            data: {
                labels: caaSTitle,
                datasets: [{
                    label: 'Cart Abandonment Analysis',
                    data: caa_data,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                // Use full name in tooltip title
                                const index = tooltipItems[0].dataIndex;
                                return caaFTitle[index];
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        const vbrcFTitle = {!! json_encode(array_column($data['views_by_region'], 'region')) !!};

        const vbrcSTitle = {!! json_encode(
            array_map(function ($product) {
                return strlen($product['region']) > 10 ? mb_substr($product['region'], 0, 10) . '...' : $product['region'];
            }, $data['views_by_region']),
        ) !!};

        const views_by_region_data = {!! json_encode(array_column($data['views_by_region'], 'total_views')) !!};

        const views_by_region_chart = document.getElementById('views_by_region').getContext('2d');
        const views_by_region = new Chart(views_by_region_chart, {
            type: 'bar',
            data: {
                labels: vbrcSTitle,
                datasets: [{
                    label: 'Views By Region',
                    data: views_by_region_data,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                // Use full name in tooltip title
                                const index = tooltipItems[0].dataIndex;
                                return vbrcFTitle[index];
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        const wpcFTitle = {!! json_encode(array_column($data['wishlist_to_purchase_conversion'], 'name')) !!};

        // Short product names (for x-axis labels)
        const wpcSTitle = {!! json_encode(
            array_map(function ($product) {
                return strlen($product['name']) > 10 ? mb_substr($product['name'], 0, 10) . '...' : $product['name'];
            }, $data['wishlist_to_purchase_conversion']),
        ) !!};

        // Individual data arrays for tooltip use
        const wishlists = {!! json_encode(array_column($data['wishlist_to_purchase_conversion'], 'wishlists')) !!};
        const checkouts = {!! json_encode(array_column($data['wishlist_to_purchase_conversion'], 'checkouts')) !!};
        const conversionRates = {!! json_encode(array_column($data['wishlist_to_purchase_conversion'], 'conversion_rate')) !!};

        // Chart setup
        const wpc_ctx = document.getElementById('wishlist_to_purchase_conversion').getContext('2d');
        const wishlistToPurchaseChart = new Chart(wpc_ctx, {
            type: 'bar',
            data: {
                labels: wpcSTitle,
                datasets: [{
                    label: 'Conversion Rate (%)',
                    data: conversionRates,
                    backgroundColor: 'rgba(75, 192, 192, 0.6)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Conversion Rate (%)'
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                const index = tooltipItems[0].dataIndex;
                                return wpcFTitle[index]; // full product name
                            },
                            label: function() {
                                // Skip default label to prevent showing it twice
                                return '';
                            },
                            afterBody: function(tooltipItems) {
                                const index = tooltipItems[0].dataIndex;
                                return [
                                    `Wishlists: ${wishlists[index]}`,
                                    `Checkouts: ${checkouts[index]}`,
                                    `Conversion Rate: ${conversionRates[index]}%`
                                ];
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        const rppLabels = {!! json_encode(
            array_map(function ($item) {
                return strlen($item['name']) > 10 ? mb_substr($item['name'], 0, 10) . '...' : $item['name'];
            }, $data['revenue_per_product']),
        ) !!};

        const rppfullLabels = {!! json_encode(array_column($data['revenue_per_product'], 'name')) !!};
        const totalSold = {!! json_encode(array_column($data['revenue_per_product'], 'total_sold')) !!};
        const revenue = {!! json_encode(array_column($data['revenue_per_product'], 'revenue')) !!};
        const rpp = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(rpp, {
            type: 'bar',
            data: {
                labels: rppLabels,
                datasets: [{
                        label: 'Total Sold',
                        data: totalSold,
                        backgroundColor: 'rgba(75, 192, 192, 0.6)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Revenue (BDT)',
                        data: revenue,
                        backgroundColor: 'rgba(255, 159, 64, 0.6)',
                        borderColor: 'rgba(255, 159, 64, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                const index = tooltipItems[0].dataIndex;
                                return rppfullLabels[index];
                            },
                            label: function(tooltipItem) {
                                const datasetLabel = tooltipItem.dataset.label;
                                const value = tooltipItem.raw;
                                return `${datasetLabel}: ${datasetLabel === 'Revenue (BDT)' ? '৳' + value : value}`;
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script>
        // App vs Web data
        const appVsWebLabels = ['App Views', 'Web Views'];
        const appVsWebData = [
            {!! json_encode($data['app_vs_web']['app_views']) !!},
            {!! json_encode($data['app_vs_web']['web_views']) !!}
        ];
        // const appVsWebColors = ['#041562', '#00e396'];
        var ap_web_ctx = document.getElementById('business-overview');
        var myChart = new Chart(ap_web_ctx, {
            type: 'doughnut',
            data: {
                labels: appVsWebLabels,
                datasets: [{
                    label: appVsWebLabels,
                    data: appVsWebData,
                    backgroundColor: [
                        '#041562',
                        '#00e396',
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script>
        // const checkoutData = {!! json_encode($data['checkout_completion_rate']) !!};

        // const coclabels = checkoutData.map(item =>
        //     item.name.length > 20 ? item.name.substring(0, 20) + '...' : item.name
        // );

        // const cocfullLabels = checkoutData.map(item => item.name);
        // const cartAdditions = checkoutData.map(item => item.cart_additions);
        // const coc_checkouts = checkoutData.map(item => item.checkouts);
        // const completionRates = checkoutData.map(item => item.completion_rate);
        const coclabels = {!! json_encode(
            array_map(function ($item) {
                return strlen($item['name']) > 10 ? mb_substr($item['name'], 0, 10) . '...' : $item['name'];
            }, $data['checkout_completion_rate']),
        ) !!};

        const cocfullLabels = {!! json_encode(array_column($data['checkout_completion_rate'], 'name')) !!};
        const cartAdditions = {!! json_encode(array_column($data['checkout_completion_rate'], 'cart_additions')) !!};
        const coc_checkouts = {!! json_encode(array_column($data['checkout_completion_rate'], 'checkouts')) !!};
        const completionRates = {!! json_encode(array_column($data['checkout_completion_rate'], 'completion_rate')) !!};

        // === Line Chart ===
        const line_ctx = document.getElementById('checkoutCompletionLineChart').getContext('2d');
        const checkoutLineChart = new Chart(line_ctx, {
            type: 'line',
            data: {
                labels: coclabels,
                datasets: [{
                    label: 'Completion Rate (%)',
                    data: completionRates,
                    borderColor: 'rgba(153, 102, 255, 1)',
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4,
                    pointHoverRadius: 6
                },
                {
                    label: 'Checkouts',
                    data: coc_checkouts,
                    borderColor: 'rgba(75, 192, 192, 0.6)',
                    backgroundColor: 'rgba(75, 192, 192, 1)',
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4,
                    pointHoverRadius: 6
                },
                {
                    label: 'Cart Additions',
                    data: cartAdditions,
                    borderColor: 'rgba(255, 159, 64, 0.6)',
                    backgroundColor: 'rgba(255, 159, 64, 1)',
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }
            ]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Checkout Completion Rate (%)'
                    },
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                const index = tooltipItems[0].dataIndex;
                                return cocfullLabels[index];
                            },
                            label: function(tooltipItem) {
                                return `Completion Rate: ${tooltipItem.raw}%`;
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100,
                        title: {
                            display: true,
                            text: 'Completion Rate (%)'
                        }
                    }
                }
            }
        });
    </script>
@endpush

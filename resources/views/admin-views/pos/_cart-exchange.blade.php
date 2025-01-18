    <div class="d-flex flex-row" style="max-height: 300px; overflow-y: scroll;">
        <table class="table table-bordered">
            <thead class="text-muted">
                <tr>
                    <th scope="col">{{\App\CPU\translate('item')}}</th>
                    <th scope="col" class="text-center">{{\App\CPU\translate('qty')}}</th>
                    <th scope="col">{{\App\CPU\translate('price')}}</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $subtotal_exchange = 0;

                $tax = 0;
                $discount_on_product_exchange = 0;
                $discount_type = 'amount';
                $discount_on_product = 0;
                $total_tax = 0;
                $ext_discount = 0;
                $ext_discount_type = 'amount';
                $coupon_discount =0;
                $total_shipping_cost = 0
            ?>
                @foreach($order->details as $key => $value)

                    <?php

                    $product_subtotal_exchange = ($value['price'])*$value['qty'];
                    $discount_on_product_exchange = ($value['discount']);
                    // $discount_on_product_exchange = ($value['discount']*$value['qty']);
                    $subtotal_exchange += $product_subtotal_exchange;

                    //tax calculation
                    $product = \App\Model\Product::find($value['product_id']);
                    $total_tax += \App\CPU\Helpers::tax_calculation($value['price'], $product['tax'], $product['tax_type'])*$value['qty'];

                    ?>

                <tr>
                    <td class="media align-items-center">
                        <img class="avatar avatar-sm mr-1" src="{{asset('storage/product/thumbnail')}}/{{$product['thumbnail']}}"
                                onerror="this.src='{{asset('assets/back-end/img/160x160/img2.jpg')}}'" alt="{{$product['name']}} image">
                        <div class="media-body">
                            <h5 class="text-hover-primary mb-0">{{Str::limit($product['name'], 10)}}</h5>
                            <small>{{Str::limit($value['variant'], 20)}}</small>

                        </div>
                    </td>
                    <td class="align-items-center text-center">
                        <input type="number" disabled style="width:50px;text-align: center;" value="{{$value['qty']}}">
                    </td>
                    <td class="text-center px-0 py-1">
                        <div class="btn">
                            {{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($product_subtotal_exchange-$discount_on_product_exchange))}}
                        </div> <!-- price-wrap .// -->
                    </td>
                    <td class="align-items-center text-center text-warning">
                       Return
                    </td>
                </tr>

                @endforeach




            </tbody>
        </table>
    </div>


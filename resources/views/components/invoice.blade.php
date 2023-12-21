<div class="d-flex justify-content-end mb-2">
    <button onclick="printDiv('printableArea')" class="btn btn-dark ">Print this page</button>
   
</div>

<div id="printableArea">
    <div class="invoice-container">


        <div class="invoice-info row">
            <div class="shop-info col-md-6">
                <h4>Invoice</h4>
                <h6> {{ $order->first_name }} {{ $order->last_name }}</h6>
                <p>{{ $order->created_at->format('M-d-Y') }}</p>
                <p> Order No: {{ $order->id }}</p>
            </div>
            <div class="customer-info col-md-6">
                <h5>AhroMart</h5>

                <p>New York, USA</p>
                {{-- <p>+1 (518) 653-8997</p> --}}
                <p> Info@ahromart.com</p>

            </div>
        </div>

        <table class="invoice-table ">
            <thead>
                <tr>

                    <th class="text-start">Description</th>
                    <th class="text-start">Price</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>


                <tr>

                    <td>{{ $order->quantity }} x {{ $order->product->name }},
                        @php
                            $variation = $order->orderproduct->variation ? json_decode($order->orderproduct->variation) : null;
                        @endphp
                        @if($variation)
                        @foreach ($variation as $key=> $item)
                            {{$key}} : {{$item}}
                        @endforeach
                        @endif


                    </td>

                    <td>{{ Sohoj::price($order->subtotal) }}</td>
                </tr>

                <tr>

                    <td> Platform Fee</td>
               
                    <td>{{ Sohoj::price($order->platform_fee) }}</td>
                </tr>
                {{-- <tr>

                    <td>Shipping</td>

                    <td>{{ Sohoj::price($order->shipping_total) }}</td>
                </tr> --}}
                <tr>

                    <td>Shipping Cost</td>

                    <td>{{ Sohoj::price($order->shipping_total) }}</td>
                </tr>

            </tbody>
            <tfoot>

                <tr style="border-top: 2px solid black">
                    <td colspan="2"></td>
                    <td class="text-center">
                        {{ Sohoj::price($order->total + $order->platform_fee) }}
                    </td>
                </tr>



            </tfoot>
        </table>

        {{-- <div class="invoice-total">
            <p class="total-amount">Total Amount: {{ Sohoj::price($order->vendor_total) }}</p>
        </div> --}}
        {{-- <table class="invoice-table">
            <thead>
                <tr>

                    <th class="text-start">Shop</th>
                    <th class="text-start">Id</th>
                    <th class="text-start">Address</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td> {{ $order->shop->name }}</td>
                    <td>{{ $order->shop->id }}</td>
                    <td>{{ $order->shop->city }}, {{ $order->shop->state }}</td>
                </tr>
            </tbody>
        </table> --}}
        <div class="row shop" style="
        margin-top: 120px;">
            <div class="col-md-6">
                <h6>Shop</h6>
                <p>{{ $order->shop->name }}</p>
            </div>
            <div class="col-md-3">
                <h6>Id</h6>
                <p>{{ $order->shop->id }}</p>
            </div>
            <div class="col-md-3">
                <h6>Address</h6>
                <p>{{ $order->shop->city }}, {{ $order->shop->state }}</p>
            </div>
        </div>
        <div class=" mt-5 p-3" style="border: 1px solid black">
            <table class="invoice-table">
                <thead>
                    <tr>
                        <th class="text-start">Additional Information:</th>
                        <th class="text-end">Total Paid:</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>

                            Transaction Number:{{ $order->transaction_id }}
                        </td>
                        <td class="text-end">
                            <h1> {{ Sohoj::price($order->total + $order->platform_fee) }}</h1>
                        </td>
                    </tr>
                    <tr style="border-top: 2px solid black">
                        <td class="p-1 d-flex align-items-center">
                            <div class="cricle">


                            </div>
                            <span class="ms-1">Thank You! -Ahromart</span>
                        </td>
                        <td class="text-end " style="text-transform:uppercase">usd</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
    }
</script>

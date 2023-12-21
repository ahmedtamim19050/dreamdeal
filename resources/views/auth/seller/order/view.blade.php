@extends('layouts.seller-dashboar')
@section('dashboard-content')
    <style>
        /* Add your custom CSS styles here */
        /* For example: */


        .order-container {
            font-family: Arial, sans-serif;
            color: #333;
            max-width: 700px;
            height: auto;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .order-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .order-header h2 {
            font-size: 24px;
            margin: 0;
            color: #555;
        }

        .order-info {
            margin-bottom: 40px;
        }

        .order-info h4 {
            margin: 0 0 10px;
            color: #555;
        }

        .order-info p {
            margin: 0;
            color: #777;
        }

        .order-items {
            margin-bottom: 40px;
        }

        .order-items table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-items th,
        .order-items td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            color: #555;
        }

        .order-items th {
            background-color: #f7f7f7;
        }

        .order-total {
            text-align: right;
            margin-bottom: 20px;
        }

        .total-amount {
            font-size: 20px;
            margin: 0;
            color: #555;
        }

        .order-actions {
            text-align: center;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            border: 1px solid #000;
            padding: 10px;
        }

        .action-button {
            padding: 10px 20px;
            font-size: 14px;
            background-color: #4a90e2;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .action-button:hover {
            background-color: #4281ca;
            color: #f7f7f7
        }

        .tracking-container {
            position: relative;
        }

        .add-tracking-button {
            padding: 13px 20px;
            font-size: 18px;
            background-color: #4a90e2;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .add-tracking-button:hover {
            background-color: #4281ca;
            color: #f7f7f7
        }

        .tracking-input {
            position: absolute;
            top: 100%;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 1;
            transition: opacity 0.3s ease-in-out;
        }

        .tracking-input.show {
            display: block;
        }

        .tracking-input input[type="text"],
        .tracking-input input[type="date"] {
            width: 300px;
            padding: 5px;
            border: 1px solid #ddd;
            font-size: 14px;
            color: #555;
        }

        .tracking-input button {
            padding: 5px 10px;
            font-size: 14px;
            background-color: #4a90e2;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-top: 5px;
        }

        .tracking-input button:hover {
            background-color: #4281ca;
        }
    </style>
    <div class="order-container">
        <div class="row">



            <div class="order-info col-md-6">
                <h4 style="font-weight: 600">Order Details</h4>
                <p style="font-weight: 700;font-size:16px">Customer- {{ $order->fullname }}</p>
                <p>Date: {{ $order->created_at->format('M d,Y') }}</p>
                <p>Order ID: {{ $order->id }}</p>
                <p>Customer Email: {{ $order->user->email }}</p>
            </div>
            <div class="invoice text-end col-md-6">
                <a href="{{ route('vendor.invoice', $order) }}" class="btn btn-dark">Invoice <i class="fa-regular fa-eye"></i>
                </a>
                <a href="{{route('vendor.massage',$order->user->id)}}" class="btn btn-dark">Send Massage</a>
            </div>
        </div>
        <div class="order-items">
            <h4>Order Items</h4>
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>{{ $order->product->name }}</td>
                        <td>{{ $order->quantity }}</td>
                        <td>{{ Sohoj::price($order->subtotal) }}</td>
                    </tr>

                </tbody>

            </table>
        </div>

        <div class="order-total">
            <p class="total-amount">Total Vendor Amount: {{ Sohoj::price($order->vendor_total + $order->shipping_total) }}</p>
        </div>

        <div class="card p-4 " style="border: 1px solid #000">
            <h4 class="text-center mb-3" style="font-weight: 700 ">Order Action</h4>
            <div class="order-actions">
                <div class="button-group">

                    @if ($order->status == 0 || $order->status == 1)
                        @if ($order->cancel_request == 1)
                            <a href="{{ route('vendor.order.cancel', ['order' => $order->id]) }}" class="action-button"
                                style="background-color: rgb(157, 0, 0)"> Accept Cancel Request ?
                                <i class="fa-solid fa-ban"></i></a>
                        @else
                            <a href="{{ route('vendor.order.cancel', ['order' => $order->id]) }}" class="action-button"
                                style="background-color: rgb(157, 0, 0)">Cancel
                                <i class="fa-solid fa-ban"></i></a>
                        @endif
                    @endif


                    @if ($order->status == 3)
                        <span class="action-button" style="background-color: grey">
                            Order Canceled
                        </span>
                    @endif
                    @if ($order->status == 1 || $order->status == 2)
                        <div class="tracking-container">
                            <button class="action-button" onclick="toggleTrackingInput()"
                                style="background-color: rgb(5, 2, 159)">Add
                                Tracking Info</button>
                            <div id="trackingInputContainer" class="tracking-input">
                                <form action="{{ route('vendor.order.shipping') }}" method="post">
                                    @csrf

                                    <select class="from-control form-select border ms-0 mb-3" name="shipping_method"
                                        id="exampleFormControlSelect1">
                                        @php
                                            $partners = ['DHL', 'Hermes', 'DPD', 'UPS', 'GLS', 'Fedex'];
                                        @endphp
                                        @foreach ($partners as $partner)
                                            <option value="{{ $partner }}"
                                                @if ($partner === $order->shipping_method) selected @endif>{{ $partner }}
                                            </option>
                                        @endforeach
                                    </select>
                                    <input id="orderId" type="hidden" name="order_id" value="{{ $order->id }}">
                                    <input type="text" class="mb-3" id="trackingUrlInput"
                                        value="{{ $order->shipping_url ? $order->shipping_url : '' }}" name="shipping_url"
                                        placeholder="Enter Tracking Id">

                                    <input type="date" id="shipping_date" name="shipping_date"
                                        value="{{ $order->shipping_date ? Carbon\Carbon::parse($order->shipping_date)->format('Y-m-d') : '' }}">
                                    @error('shipping_date')
                                        <span class="text-danger">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                    <button type="submit">Save Tracking URL</button>
                                </form>
                            </div>

                        </div>

                    @endif
                    @if ($order->status == 2)
                        <a href="{{ route('vendor.order.action', ['order' => $order->id]) }}" class=" action-button"
                            style="background-color: #A19E4B">Order Delivered
                        </a>
                    @endif
                    @if ($order->status == 4)
                        <span class="action-button">Order has Been Delivered</span>
                    @endif
                    @if ($order->status == 5)
                        <div class="text-center">
                            <span><u>A request for Refund has been sent</u></span> <br>
                            <span>Reason: {{ $order->return_reason }}</span>
                            @if ($order->return_file)
                                <p><strong>Attachment:</strong> <a
                                        href="{{ asset('storage/return-files/' . $order->return_file) }}"
                                        target="_blank">{{ $order->return_file }}</a></p>
                                        <a href="{{route('vendor.refund.request.accept',$order)}}" class="btn btn-primary">{{$order->refund_request_accpet==1 ?'Refund request accepted':' Refund request accept ?'}}</a>
                            @endif
                            <br>
                            @if ($order->returned_product_received == 1)
                             <span class="text-info">You have received the returned product</span>
                            @else
                            Did you received the product? <a href="{{route('vendor.returned.product.received',['order'=>$order])}}" class="badge text-light bg-danger">Yes</a>
                            @endif
                        </div>
                    @endif
                </div>
            </div>

            @if ($order->shipping_url)
                <div class="d-flex justify-content-center pb-3" style="border-bottom: 2px solid #000">
                    <div class="me-2">
                        @if ($order->shipping_url == !null)
                            @if ($order->shipping_method == 'DHL')
                                <a class="add-tracking-button" target="_blank"
                                    href="https://nolp.dhl.de/nextt-online-public/set_identcodes.do?lang=de&idc={{ $order->tracking_Id }}">shipping
                                    label </a>
                            @endif
                            @if ($order->shipping_method == 'Hermes')
                                <a class="btn btn-sm btn-dark" target="_blank"
                                    href="https://www.myhermes.de/empfangen/sendungsverfolgung/suchen/sendungsinformation/{{ $order->tracking_Id }}">shipping
                                    label</a>
                            @endif
                            @if ($order->shipping_method == 'DPD')
                                <a class="add-tracking-button" target="_blank"
                                    href="https://tracking.dpd.de/parcelstatus?query={{ $order->tracking_Id }}&locale=de_DE">shipping
                                    label</a>
                            @endif

                            @if ($order->shipping_method == 'UPS')
                                <a class="add-tracking-button" target="_blank"
                                    href="http://wwwapps.ups.com/WebTracking/processInputRequest?sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&loc=de_DE&InquiryNumber1={{ $order->tracking_Id }}&track.x=0&track.y=0">shipping
                                    label</a>
                            @endif
                            @if ($order->shipping_method == 'GLS')
                                <a class="add-tracking-button" target="_blank"
                                    href="https://www.gls-pakete.de/sendungsverfolgung?match={{ $order->tracking_Id }}&txtAction=71000">shipping
                                    label</a>
                            @endif
                            @if ($order->shipping_method == 'Fedex')
                                <a class="add-tracking-button" target="_blank"
                                    href="https://www.fedex.com/fedextrack/?tracknumbers={{ $order->tracking_Id }}&locale=de_DE&cntry_code=de">shipping
                                    label</a>
                            @endif
                        @endif
                    </div>
                    <a href="{{ route('vendor.invoice', $order) }}" class="btn btn-dark" style="margin-top: -8px">Order
                        Details
                    </a>
                </div>

            @endif
            <div class="d-flex justify-content-between mt-3">
                <h4 style="font-weight: 700"> Status :</h4>
                @if ($order->status == 0)
                    <p class="text-warning">Pending</p>
                @endif
                @if ($order->status == 1)
                    <p class="text-warning">Paid</p>
                @endif
                @if ($order->status == 2)
                    <p class="text-warning">On its way</p>
                @endif
                @if ($order->status == 3)
                    <p class="text-warning">Cancel</p>
                @endif
                @if ($order->status == 4)
                    <p class="text-warning">Delivered</p>
                @endif
                @if ($order->status == 5)
                    <p class="text-warning">Refund Request</p>
                @endif
            </div>

        </div>
        <div class="row mt-5">
            <div class="col-md-6 text-start">
                <span style="font-weight: 600">Shipping Method:</span> <br>
                <p>{{ $order && $order->shipping_method !== null ? $order->shipping_method : 'No Shipping method added' }}
                </p>
            </div>
            <div class="col-md-6 text-end">
                <span style="font-weight: 600">Shipping Address</span><br>

                <span>
                    {{ json_decode($order->shipping)->country }},
                    {{ json_decode($order->shipping)->state }},
                    <br>{{ json_decode($order->shipping)->city }} ,
                    {{ json_decode($order->shipping)->address_1 }},
                    {{ json_decode($order->shipping)->address_2 }},
                    {{ json_decode($order->shipping)->post_code }},

                </span>
            </div>
        </div>
        <script>
            function toggleTrackingInput() {
                var trackingInputContainer = document.getElementById('trackingInputContainer');
                trackingInputContainer.classList.toggle('show');
            }

            function addTrackingUrl() {
                var trackingUrlInput = document.getElementById('trackingUrlInput');
                var trackingUrl = trackingUrlInput.value;

                // Perform any necessary action with the tracking URL, such as saving it to the database
                console.log('Tracking URL:', trackingUrl);

                // Clear the input field
                trackingUrlInput.value = '';

                // Hide the tracking input field
                toggleTrackingInput();
            }
        </script>
    </div>
@endsection

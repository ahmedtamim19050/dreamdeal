@extends('layouts.seller-dashboar')
@section('dashboard-content')
    <div class="ec-shop-rightside col-lg-9 col-md-12">
        <div class="ec-vendor-dashboard-card space-bottom-30 shadow-sm" style="border-radius: 12px !important;">
            <div class="ec-vendor-card-header">
                <h5>Customer Orders</h5>
                <div class="d-flex">
                    <div class="ec-header-btn">
                        <input class="form-control ec-search-bar" placeholder="Search products..." type="text">

                    </div>
                    <div class="ec-header-btn">
                        <a class="btn  btn-outline-dark" style="height: 47px;line-height: 48px; border:1px solid black"
                            href="#"><i class="fi-rr-filter"></i> Filter</a>
                    </div>


                </div>

            </div>
            <div class="ec-vendor-card-body">
                <div class="ec-vendor-card-table">
                    <table class="table ec-table table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Customer Name</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Status</th>
                                <th scope="col">Order Total</th>
                                <th scope="col">Order Date</th>



                                <!-- <th scope="col">Action</th> -->

                                <!-- <th scope="col">Invoice</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($latest_orders as $order)
                                <tr>
                                    <td><span> <a href="{{ route('vendor.orderView', $order) }}"
                                                style="text-decoration: underline;">{{ $order->id }}</a> </span></td>
                                    <th scope="row"><span>{{ $order->full_name }} </span></th>
                                    <td><a href="{{ route('vendor.orderView', $order) }}">{{ $order->product->name }}</a>
                                    </td>

                                    <td>
                                        @if ($order->status == 1)
                                            <span
                                                style="
                                font-size: 13px;color: white;background-color: orange;padding: 0;margin-top: 15px;
                            ">Processing</span>
                                        @elseif($order->status == 2)
                                            <span
                                                style="
                                font-size: 11px;color: white;background-color: blue;padding: 0;margin-top: 15px;
                            ">On
                                                it's way</span>
                                        @elseif($order->status == 3)
                                            <span
                                                style="
                                font-size: 13px;color: white;background-color: red;padding: 0;margin-top: 15px;
                            ">Canceled</span>
                                        @elseif($order->status == 4)
                                            <span
                                                style="
                                font-size: 13px;color: white;background-color: green;padding: 0;margin-top: 15px;
                            ">Delivered</span>
                                        @elseif($order->status == 5)
                                            <span
                                                style="
                                font-size: 13px;color: white;background-color: rgb(192, 97, 14);padding: 0;margin-top: 15px;
                            ">Refund
                                                Request</span>
                                        @else
                                            <span
                                                style="
                                font-size: 13px;color: white;background-color: indianred;padding: 0;margin-top: 15px;
                            ">Pending</span>
                                        @endif
                                    </td>
                                    <td><span>{{ Sohoj::price($order->total + $order->platform_fee) }}</span></td>
                                    <td><span>{{ $order->created_at->format('M-d-Y') }}</span></td>
                                    {{-- <th scope="row">
                                        @if ($order->shipping_url == !null)
                                            <a href="{{ $order->shipping_url }}" target="_blank"><span class="text-success"
                                                    title="{{ $order->shipping_url }}">
                                                    {{ Str::limit($order->shipping_url, $limit = 15, $end = '...') }}
                                                </span></a>
                                        @else
                                            <span class="text-danger">
                                                no url found
                                            </span>
                                        @endif
                                        <button type="button" class="btn btn-danger" data-bs-id="{{ $order->id }}"
                                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            Add Url
                                        </button>

                                    </th> --}}


                                    <td class="">
                                        <div class="d-flex align-items-center">


                                            {{-- @unless ($order->status == 3 || $order->status == 4)
                                    <span class="me-3">
                                        <a href="{{ route('vendor.order.action', ['order' => $order->id]) }}" class="btn btn-outline-dark border">Deliver
                                            <i class="fa-solid fa-truck-ramp-box"></i></a>
                                    </span>
                                    @endunless --}}

                                            <!-- <div class="dropdown me-2">
                                                                    <button class="btn btn-dark dropdown-toggle" type="button"
                                                                        data-bs-toggle="dropdown" aria-expanded="false">
                                                                        Action
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li class="d-flex justify-content-center mb-2"><a
                                                                                href="{{ route('vendor.order.action', ['order' => $order->id]) }}"
                                                                                class="btn btn-outline-dark border">Deliver
                                                                                <i class="fa-solid fa-truck-ramp-box"></i></a></li>
                                                                        <li class="d-flex justify-content-center mb-2"><a
                                                                                href="{{ route('vendor.order.cancel', ['order' => $order->id]) }}"
                                                                                class="btn btn-outline-dark border">Cancel
                                                                                <i class="fa-solid fa-ban"></i></a></li>
                                                                        <li class="d-flex justify-content-center"><span class="pt-0"><a
                                                                                    href="{{ route('vendor.invoice', $order->id) }}"
                                                                                    class="btn btn-dark">Invoice <i
                                                                                        class="fa-solid fa-receipt"></i></a> </span></li>
                                                                    </ul>
                                                                </div> -->

                                        </div>
                                    </td>

                                    <td>
                                    </td>

                                </tr>
                            @endforeach




                        </tbody>


                    </table>

                </div>
            </div>
        </div>
    </div>
    {{-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Shipping Url</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <form action="{{ route('vendor.order.shipping') }}" method="post">
                        @csrf
                        <input id="orderId" type="hidden" name="order_id" value="">
                        <div class="col-md-12 mt-2">

                            <input type="text" placeholder="Shipping url" name="shipping_url" class="form-control"
                                id="price1">
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div> --}}
@endsection
@section('js')
    <script>
        var exampleModal = document.getElementById('exampleModal')
        exampleModal.addEventListener('show.bs.modal', function(event) {
            var button = event.relatedTarget
            var recipient = button.getAttribute('data-bs-id')
            var modalBodyInput = exampleModal.querySelector('#orderId')

            modalBodyInput.value = recipient
        })
    </script>
@endsection

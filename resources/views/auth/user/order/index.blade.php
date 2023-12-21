@extends('layouts.user_dashboard')
@section('dashboard-content')
    <div class="ec-shop-rightside col-lg-9 col-md-12 mt-2">
        <div class="ec-vendor-dashboard-card space-bottom-30 shadow-sm" style="border-radius: 10px !important;">
            <div class="container">
                <div class="btn-group  mt-3">
                    <button class="btn btn-dark btn-sm dropdown-toggle d-flex align-items-center rounded " type="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        @if (request()->status === '0')
                            Pending order
                        @elseif (request()->status === '1')
                            Paid
                        @elseif(request()->status === '2')
                            On the way
                        @elseif(request()->status === '3')
                            Canceled
                        @else
                            All
                        @endif
                    </button>
                    {{-- -----order showing & filtering----start --}}
                    <ul class="dropdown-menu">

                        <li><a class="dropdown-item" href="{{ route('user.ordersIndex') }}">All</a></li>
                        <li><a class="dropdown-item" href="{{ route('user.ordersIndex', ['status' => 1]) }}">Paid</a></li>
                        <li><a class="dropdown-item" href="{{ route('user.ordersIndex', ['status' => 0]) }}">Pending
                                order</a></li>
                        <li><a class="dropdown-item" href="{{ route('user.ordersIndex', ['status' => 2]) }}">On the way</a>
                        </li>
                        <li><a class="dropdown-item" href="{{ route('user.ordersIndex', ['status' => 3]) }}">Canceled</a>
                        </li>
                    </ul>
                </div>
                {{-- -----order showing & filtering---- end --}}

                @if ($latest_orders->count() > 0)
                    <div class="col-md-12">
                        @foreach ($latest_orders as $order)
                            <div class="container title-margin mt-2 bg-dark border rounded-5">

                                <div
                                    class="container-fluid title-margin p-2 d-flex justify-content-between align-items-center ">
                                    @if ($order->status == 0)
                                        <h4 class="text-white">Pending Order</h4>
                                    @endif
                                    @if ($order->status == 1)
                                        <h4 class="text-white">Processing</h4>
                                    @endif
                                    @if ($order->status == 2)
                                        <h4 class="text-white">On the way</h4>
                                    @endif
                                    @if ($order->status == 3)
                                        <h4 class="text-white">Canceled</h4>
                                    @endif
                                    @if ($order->status == 4)
                                        <h4 class="text-white">Delivered</h4>
                                    @endif
                                    @if ($order->status == 5)
                                        <h4 class="text-white">Cancelled</h4>
                                    @endif
                                    <p class="text-white">Order date: {{ $order->created_at->format('M-d-Y') }}</p>
                                </div>
                            </div>
                            <div class="col-md-12 mb-2">
                                <div class="cart-item card rounded-4">
                                    <div class="card-body row box-shadow d-flex justify-content-between align-items-center">

                                        <div class="col-md-8 row">
                                            <div class="col-md-5 center">
                                                <img class="cart-item-image"
                                                    src="{{ Storage::url($order->product->image) }}" alt="">
                                            </div>
                                            <div class="col-md-6  cart-item-text">
                                                <a href="{{ route('user.invoice', $order) }}">

                                                    <h4 class="font-size">{{ $order->product->name }}</h4>
                                                </a>
                                                <p class="item-title">
                                                    {{ Str::limit(strip_tags($order->product->short_description), $limit = 150, $end = '...') }}
                                                </p>
                                                <span>
                                                    Items: {{ $order->quantity }}</span> <br>
                                                <strong class="text-dark"><span>Price:</span>
                                                    {{-- <span
                                                        style="text-decoration: line-through;">{{ Sohoj::price($order->Product->price) }}</span> --}}
                                                    <span>{{ Sohoj::price($order->subtotal) }}</span></strong>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="ec-sidebar-block  side-bar-box ">

                                                <div class="ec-sb-block-content">
                                                    <div class=" p-2 border rounded-3">
                                                        <h6 class="text-center">Order id: {{ $order->id }}
                                                        </h6>
                                                        <h6 class="mt-2">Order status:
                                                            @if ($order->status == 1)
                                                                <span
                                                                    style="
                                                                font-size: 13px;
                                                            ">Processing</span>
                                                            @elseif($order->status == 2)
                                                                <span
                                                                    style="
                                                                font-size: 13px;
                                                            ">On
                                                                    it's way</span>
                                                            @elseif($order->status == 3)
                                                                <span
                                                                    style="
                                                                font-size: 13px;
                                                            ">Canceled</span>
                                                            @elseif($order->status == 4)
                                                                <span
                                                                    style="
                                                                font-size: 13px;
                                                            ">Delivered</span>
                                                            @else
                                                                <span
                                                                    style="
                                                                font-size: 13px;
                                                            ">Pending</span>
                                                            @endif
                                                        </h6>

                                                        <h6 style="flex-direction:column">
                                                            <p>Tracking Info:</p>
                                                            <input type="text" value="{{ $order->shipping_url }}"
                                                                class="form-control d-block">
                                                        </h6>

                                                        
                                                        @if ($order->shipping_url)
                                                            @if ($order->shipping_method == 'DHL')
                                                                <a class="btn btn-info w-100" target="_blank"
                                                                    href="https://nolp.dhl.de/nextt-online-public/set_identcodes.do?lang=de&idc={{ $order->tracking_Id }}">Tracking
                                                                    order </a>
                                                            @endif
                                                            @if ($order->shipping_method == 'Hermes')
                                                                <a class="btn btn-info w-100" target="_blank"
                                                                    href="https://www.myhermes.de/empfangen/sendungsverfolgung/suchen/sendungsinformation/{{ $order->tracking_Id }}">Tracking
                                                                    order</a>
                                                            @endif
                                                            @if ($order->shipping_method == 'DPD')
                                                                <a class="btn btn-info w-100" target="_blank"
                                                                    href="https://tracking.dpd.de/parcelstatus?query={{ $order->tracking_Id }}&locale=de_DE">Tracking
                                                                    order</a>
                                                            @endif

                                                            @if ($order->shipping_method == 'UPS')
                                                                <a class="btn btn-info w-100" target="_blank"
                                                                    href="http://wwwapps.ups.com/WebTracking/processInputRequest?sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&loc=de_DE&InquiryNumber1={{ $order->tracking_Id }}&track.x=0&track.y=0">Tracking
                                                                    order</a>
                                                            @endif
                                                            @if ($order->shipping_method == 'GLS')
                                                                <a class="btn btn-info w-100" target="_blank"
                                                                    href="https://www.gls-pakete.de/sendungsverfolgung?match={{ $order->tracking_Id }}&txtAction=71000">Tracking
                                                                    order</a>
                                                            @endif
                                                            @if ($order->shipping_method == 'Fedex')
                                                                <a class="btn btn-info w-100" target="_blank"
                                                                    href="https://www.fedex.com/fedextrack/?tracknumbers={{ $order->tracking_Id }}&locale=de_DE&cntry_code=de">Tracking
                                                                    order</a>
                                                            @endif
                                                        @endif

                                                        <a href="{{ route('user.invoice', $order) }}"
                                                            class="btn btn-primary w-100 mt-2 mb-2">View Invoice</a>
                                                        @if ($order->status == 4)
                                                        <form action="{{ route('user.order.accept', $order) }}"
                                                            method="post">
                                                            @csrf
                                                            @if ( $order->order_accept == 0)
                                                                <button type="submit" class="btn btn-success w-100"
                                                                    title="Click the button to let us know you received the order."
                                                                    onclick="return confirm('Are you sure you want to confirm receipt of the order?')">Received
                                                                    the order?</button>
                                                            @elseif ($order->order_accept == 1)
                                                                <div class="text-center mb-3">
                                                                    <span style="background-color: gray; color: #fff"
                                                                        class="p-3">Order
                                                                        has been received</span>
                                                                </div>
                                                            @endif
                                                        </form>
                                                        <button type="button" class="btn btn-warning w-100 mt-2"
                                                            data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="{{$order->id}}">
                                                            Return Order
                                                        </button>
                                                        <a href="{{ route('product_details', [
                                                            'slug' => $order->product->parentproduct ? $order->product->parentproduct->slug : $order->product->slug,
                                                            'id' => 'ratings',
                                                        ]) }}#ratings"
                                                            class="btn btn-dark feedback-btn w-100 mt-2">
                                                            Give Feedback
                                                        </a>
                                                        @endif
                                                        <br>
                                                        @if ($order->status == 5)
                                                            <a href="#" class="btn btn-dark w-100">Return requested</a>
                                                        @endif

                                                        @if ($order->status == 0 || $order->status == 1)
                                                            <a href="{{ route('user.order.cancel', $order) }}"
                                                                class="btn btn-danger bg-danger text-white mt-2 w-100">{{ $order->cancel_request == null ? 'Order Cancel Request' : 'Order cancel request send' }}</a>
                                                        @endif


                                                    </div>



                                                </div>
                                            </div>

                                        </div>
                                    </div>



                                </div>
                            </div>
                        @endforeach

                    </div>
                @else
                    <h3 class="text-center text-dark">No order has been placed</h3>
                @endif
            </div>
        </div>
    </div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
                <form id="returnOrderForm"
                    action=""
                    method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="reason">Reason for
                            Return</label>
                        <textarea name="return_reason" id="reason" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="input-group my-3">
                        <label class="input-group-text"
                            for="inputGroupFile01">Attach File
                            (optional)
                        </label>
                        <input type="file" name="return_file"
                            class="form-control"
                            style="height: 37px; min-height: 37px"
                            id="inputGroupFile01">
                    </div>
                    <div class="modal-footer mt-2">
                        <button type="submit"
                            class="btn btn-primary">Submit
                            Return
                            Request</button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>
    <!-- modal feedback start -->
    {{-- <div class="modal fade" id="feedback" tabindex="-1" aria-labelledby="feedback" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Give Feedback</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <form action="{{ route('user.feedback.store') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-12">
                                <label for="">Feedback</label>
                                <textarea name="feedback" required class="form-control mb-2 @error('feedback') is-invalid @enderror"
                                    id="feedbackInput">
                            </textarea>
                                @error('feedback')
                                    <span class="text-danger">
                                        {{ $message }}
                                    </span>
                                @enderror
                                <input type="hidden" name="order_id" value="" id="order_id">
                            </div>


                        </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
                </form>
            </div>
        </div>
    </div> --}}
    <!-- modal end -->
@endsection
@section('js')

<script>
    $(document).ready(function() {
        $("#exampleModal").on('show.bs.modal', function(event){
            var button = $(event.relatedTarget);
             var orderId = button.data('id');
            var url = "{{ route('user.return-order.store', ['order' => ':order']) }}";
            var route = url.replace(':order', orderId);
            console.log(orderId)
            $("#returnOrderForm").attr("action", route);
        });
    });
</script>


    {{-- <script>
        $(document).ready(function() {
            $(".feedback-btn").click(function() {
                $('#order_id').val($(this).data('id'));
                var feedback = $('#feedbackInput').val($(this).data('feedback'));
                console.log(feedback);
                $('#addBookDialog').modal('show');
            });
        });
    </script> --}}
@endsection

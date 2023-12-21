@extends('layouts.app')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    {{-- <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/plugins/slick.min.css') }}" /> --}}
    <link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
    <link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/checkout.css') }}">
@endsection
@section('content')
    <x-app.header />
    <!-- Ec checkout page -->
    <section class="ec-page-content section-space-p">
        <div class="container">
            <form class="" action="{{ route('checkout.store') }}" method="POST">
                @csrf
                <div class="row justify-content-between">
                    <div class="ec-checkout-leftside col-lg-6 col-md-12 ">
                        <!-- checkout content Start -->
                        <div class="ec-checkout-content">
                            <div class="ec-checkout-inner">
                                <div class="ec-checkout-wrap margin-bottom-30">

                                    <div class="ec-checkout-block ec-check-login">
                                        <h3 class="ec-checkout-title" style="font-size: 25px;">Enter order information </h3>
                                        <div class="">

                                            <input type="hidden" name="shop_id" value="">

                                            <fieldset class="personal-info">
                                                <legend><strong>Personal info</strong></legend>
                                                <div class="row">
                                                    <div class="col-md-6">

                                                        <input type="text"
                                                            class="form-control mb-2 @error('first_name') is-invalid @enderror"
                                                            value="{{ Auth()->user() ? Auth()->user()->name : '' }}"
                                                            name="first_name" placeholder="First Name" id="inputEmail4">
                                                        @error('first_name')
                                                            <span class="text-danger">
                                                                {{ $message }}
                                                            </span>
                                                        @enderror
                                                    </div>
                                                    <div class="col-md-6">

                                                        <input type="text" placeholder="Last Name"
                                                            value="{{ Auth()->user() ? Auth()->user()->l_name : old('last_name') }}"
                                                            name="last_name"
                                                            class="form-control mb-2 @error('last_name') is-invalid @enderror"
                                                            id="inputPassword4">
                                                        @error('last_name')
                                                            <span class="text-danger">
                                                                {{ $message }}
                                                            </span>
                                                        @enderror
                                                    </div>

                                                    <div class="col-12">

                                                        <input type="email"
                                                            class="form-control mb-2 @error('email') is-invalid @enderror"
                                                            value="{{ Auth()->user() ? Auth()->user()->email : '' }}"
                                                            name="email" id="inputAddress" placeholder="Email">
                                                        @error('email')
                                                            <span class="text-danger">
                                                                {{ $message }}
                                                            </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </fieldset>


                                            <div class="shipping_add">
                                                <h3 style="font-size: 25px;">Enter a shipping address</h3>
                                            </div>
                                            @error('prevoius_address')
                                                <div class="alert alert-primary" role="alert">
                                                    <p class="text-danger">{{ $message }}</p>
                                                </div>
                                            @enderror
                                            @if (Auth()->user()->addresses->count() == !0)
                                                <div class="shipping_add_old">
                                                    <h4 style="font-size: 18px;">Previous address</h4>

                                                </div>
                                                @foreach (Auth()->user()->addresses as $address)
                                                    <div class="col-12">
                                                        <div class="form-check d-flex align-items-center">
                                                            <input class="form-check-input " style="margin-right: 11px"
                                                                value="{{ $address->id }}" name="prevoius_address"
                                                                type="checkbox" id="gridCheck">
                                                            <label class="form-check-label address-label" for="gridCheck">
                                                                {{ $address->post_code }}
                                                                {{ $address->state }}
                                                                <br>{{ $address->city }} ,
                                                                {{ $address->address_1 }}
                                                                {{ $address->address_2 }}

                                                            </label>

                                                        </div>
                                                    </div>
                                                    <div class="mt-1 mb-4 col-md-5"><a
                                                            href="{{ route('user.address-edit', $address->id) }}"
                                                            class="text-success border-right border-3 border-dark pe-2">Edit
                                                            Address</a>
                                                        <a href="{{ route('user.address.destroy', $address) }}"
                                                            onclick="return confirm('Are you sure you want to delete this Address?');"
                                                            class="text-danger">Remove Address</a>
                                                    </div>
                                                @endforeach
                                            @endif
                                            <!-- Button trigger modal -->
                                            <a href="javascript::void(0);" class="text-decoration-underline"
                                                data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Add Address
                                            </a>



                                            <div class="shipping_add" style="margin-top: 48px">
                                                <h3 style="font-size: 25px;">Enter a payment info</h3>
                                            </div>
                                            <div class="shipping_add_old" style="margin-top: 20px">
                                                <p style="font-size: 16px;">Select from a previous card</p>

                                            </div>
                                            <div class="row" id="cards">
                                                @php
                                                    $methods = auth()
                                                        ->user()
                                                        ->paymentMethods();
                                                @endphp
                                                @foreach ($methods as $payment)
                                                    @if ($methods->count() > 1)
                                                        <div class="col-12" style="margin-top: 10px">
                                                            <div class="form-check d-flex align-items-center">
                                                                <input class="form-check-input "
                                                                    style="margin-right: 11px;height:20px" type="radio"
                                                                    id="payment" name="payment_method[]"
                                                                    value="{{ $payment->id }}">
                                                                <img src="{{ asset('assets/img/visa.jpeg') }}"
                                                                    class="pay-img" alt="">
                                                                <label class="form-check-label address-label"
                                                                    for="payment">

                                                                    &nbsp;{{ ucwords($payment->card->brand) }} XXXX XXXX
                                                                    XXXX
                                                                    {{ $payment->card->last4 }}

                                                                </label>
                                                                
                                                    <a href="{{ route('user.removeCard', ['method' => $payment->id]) }}"
                                                        class="text-danger btn" style="float:right">Remove</a>


                                                            </div>
                                                        </div>
                                                    @else
                                                        <div class="col-12" style="margin-top: 10px">
                                                            <div class="form-check d-flex align-items-center">
                                                                <input class="form-check-input "
                                                                    style="margin-right: 11px;height:20px" type="checkbox"
                                                                    id="payment" name="payment_method[]"
                                                                    value="{{ $payment->id }}">
                                                                <img src="{{ asset('assets/img/visa.jpeg') }}"
                                                                    class="pay-img" alt="">
                                                                <label class="form-check-label address-label"
                                                                    for="payment">

                                                                    &nbsp;{{ ucwords($payment->card->brand) }} XXXX XXXX
                                                                    XXXX
                                                                    {{ $payment->card->last4 }}

                                                                </label>


                                                            </div>
                                                        </div>
                                                    @endif
                                                @endforeach
                                                <input class=" " type="radio" style="display:none"
                                                    id="paymentmethod" name="payment_method[]" value="">
                                            </div>

                                            <div class="accordion" id="accordionExample">

                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="headingOne">
                                                        <button class="accordion-button h5 text-dark" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapseOne"
                                                            aria-expanded="true" aria-controls="collapseOne">
                                                            Add a new card ?
                                                        </button>
                                                    </h2>
                                                    <div id="collapseOne" class="accordion-collapse collapse show"
                                                        aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                        <div class="accordion-body">
                                                            <input id="card-holder-name" type="hidden"
                                                                value="{{ auth()->user()->name }}">

                                                            <!-- Stripe Elements Placeholder -->
                                                            <div id="card-element"></div>
                                                            <div class="">


                                                                <input id="card-holder-name" type="hidden"
                                                                    value="{{ auth()->user()->name }}">

                                                                <!-- Stripe Elements Placeholder -->
                                                                <div id="card-element"></div>
                                                                <div class="row">
                                                                    <div class="col-12 " style="margin-top: 12px">
                                                                        <div class="form-check d-flex align-items-center">
                                                                            <input class="form-check-input "
                                                                                style="margin-right: 11px" type="checkbox"
                                                                                id="gridCheck">
                                                                            <label class="form-check-label address-label"
                                                                                for="gridCheck">
                                                                                Make this my default card

                                                                            </label>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6" style="margin-top: 15px; ">
                                                                        <button class="btn  btn-dark btn-lg rounded shadow"
                                                                            style="border-radius: 10px" type="button"
                                                                            id="card-button"
                                                                            data-secret="{{ $intent->client_secret }}">Use
                                                                            this
                                                                            Card</button>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>


                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="ec-checkout-rightside  col-lg-4 col-md-12 ">
                        <div class="ec-sidebar-wrap order-side ">
                            <!-- Sidebar Summary Block -->
                            <div class="ec-sidebar-block">
                                <div class="ec-sb-title">
                                    <h3 class="ec-sidebar-title">Order Summary</h3>
                                </div>
                                <div class="ec-sb-block-content">
                                    <div class="ec-checkout-summary">
                                       @php
                                           $flatCharge=Sohoj::flatCommision(Cart::getSubTotal());
                                           $shipping=Sohoj::shipping();
                                           $prices=Cart::getSubTotal();
                                       @endphp
                                        <div>
                                            <span class="text-left">Items({{ Cart::getTotalQuantity() }}):</span>
                                            <span class="text-right">{{ Sohoj::price($prices) }}</span>
                                        </div>
                                        <div>
                                            <span class="text-left">Platform fee:</span>
                                            <span class="text-right">{{ Sohoj::price($flatCharge) }}</span>
                                        </div>
                                        <div>
                                            <span class="text-left">Shipping:</span>
                                            <span class="text-right">{{ Sohoj::price($shipping) }}</span>
                                        </div>
                                        @if(session()->has('discount'))
                                        <div>
                                            <span class="text-left">Discount:</span>
                                            <span class="text-right">{{ Sohoj::price(Sohoj::discount()) }}</span>
                                        </div>
                                        @endif


                                        <div class="ec-checkout-summary-total">
                                            <span class="text-left order-title" style="font-size: 20px !important;">Order
                                                Total:</span>
                                            <span class="text-right"
                                                style="font-weight: 800 !important;">{{ Sohoj::price(($prices+$shipping+$flatCharge)-Sohoj::discount()) }}</span>
                                        </div>
                                        <div class="d-flex">

                                            <input type="checkbox" required class="@error('terms') is-invalid @enderror"
                                                id="terms" style="width: 25px;" value="1" name="terms"
                                                required><a href="{{url('page/privacy')}}" style="" target="_banl" class="mt-3 ms-3">I have
                                                read and agree to the <span>Terms &amp; Conditions of
                                                    AhroMart</span></a><span class="checked"></span>
                                            @error('terms')
                                                <span class="invalid-feedback " role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>

                                        <div class="col-md-12 justify-content-center" style="margin-top: 17px; ">
                                            <button class="btn  btn-dark  rounded shadow"
                                                style="border-radius: 10px !important" type="submit">Place
                                                Order</button>
                                        </div>

                                    </div>

                                </div>
                            </div>

                            <!-- Sidebar Summary Block -->
                        </div>
                        <div class="shipment-text  text-white">
                            <span>You can track your shipment and view any applicable import fees deposit before
                                placing your order. <a href="" target="_blank"><u class="text-white">Learn
                                        more</u></a></span>

                        </div>

                    </div>
            </form>
        </div>


        <!-- Sidebar Area Start -->

        <fieldset style="border: 1px solid #BCBCBC;padding: 10px">
            <div class="row justify-content-center">
                @php
                    $items = Cart::getContent();
                @endphp

                <div class="col-md-12" style="
                border-radius: 12px; margin-bottom: 19px">
                    <h3 class="review-head mt-2" style="font-size: 22px;font-weight:600">Review your order items
                    </h3>
                    @foreach ($items as $item)
                        <div class="cart-item card shadow-sm bg-white rounded rounded-4 mb-4 mt-4">
                            <div class="card-body  box-shadow d-flex justify-content-between">
                                <div class="d-flex">
                                    {{-- <div class="me-3">
                                        <div class="w-100 h-100 d-flex justify-content-center align-items-start">

                                            <h1
                                                style="font-style: normal;
                                    font-weight: 500;
                                    font-size: 22px;">
                                                {{ $item->id }}</h1>
                            </div>

                        </div> --}}
                                    <div class="  cart-item-text">
                                        <h1 class="font-size">{{ $item->name }}</h1>
                                        <p>{{ Str::limit(strip_tags($item->model->short_description), $limit = 50, $end = '...') }}
                                        </p>

                                        <form action="{{ route('cart.update') }}" method="POST">
                                            @csrf
                                            <input type="hidden" name="product_id" value="{{ $item->id }}" />
                                            <div class="col-3 mb-3 d-flex ">
                                                <input type="number" name="quantity" value="{{ $item->quantity }}"
                                                    class="cart-input-stock " id="">
                                                <button type="submit" class="ms-2"><u>Update</u></button>
                                            </div>
                                            <a href="{{ route('cart.destroy', $item->id) }}"><u>remove</u></a>
                                        </form>

                                    </div>
                                </div>
                                <div class=" d-flex justify-content-end align-item-center reivew-bill me-4">
                                    <div>
                                        <h1 class="cart-text">{{ Sohoj::price($item->price) }}</h1>
                                    <p class="text-end">Shipping cost <span style="font-weight: 700">({{Sohoj::price($item->model->shipping_cost)}})</span></p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    @endforeach

                    {{-- <div class="reivew-end mt-5 mb-3">
                        <h2
                            style="font-weight: 600;
                        font-size: 18px;
                        line-height: 150%;">
                            Ready to place order? <a href=""><u class="text-success">click here</u></a>
                        </h2>
                    </div> --}}
                </div>
            </div>
            </div>
        </fieldset>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Personal Information</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <form action="{{ route('user.address.store') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-12">

                                <input type="text" name="address_1" value="" required
                                    class="form-control mb-2 @error('address_1') is-invalid @enderror" id="inputAddress"
                                    placeholder="Street Address">
                                @error('address_1')
                                    <span class="text-danger">
                                        {{ $message }}
                                    </span>
                                @enderror
                            </div>
                            {{-- <div class="col-12">

                                <input type="text" name="address_2" placeholder="Address 2"
                                    class="form-control mb-2 @error('address_2') is-invalid @enderror" value=""
                                    id="inputAddress2">
                                @error('address_2')
                                    <span class="text-danger">
                                        {{ $message }}
                                    </span>
                                @enderror
                            </div> --}}
                            <div class="col-md-6">

                                <x-country />
                            </div>
                            <div class="col-md-6">

                                <x-state />
                            </div>
                            <div class="col-md-6">

                                <input type="text" placeholder="City" required value="" name="city"
                                    class="form-control my-2 @error('city') is-invalid @enderror" id="inputPassword4">
                                @error('city')
                                    <span class="text-danger">
                                        {{ $message }}
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <input type="text" required
                                    class="form-control my-2 @error('post_code') is-invalid @enderror" value=""
                                    name="post_code" placeholder="Zip/Postal Code" id="inputEmail4">
                                @error('post_code')
                                    <span class="text-danger">
                                        {{ $message }}
                                    </span>
                                @enderror
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
    </div>
@endsection
@section('js')
    <script src="{{ asset('assets/frontend-assets/js/vendor/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>

    <script src="{{ asset('assets/frontend-assets/js/main.js') }}"></script>

    <script src="https://js.stripe.com/v3/"></script>

    <script>
    const stripe = Stripe("{{ env('STRIPE_KEY') }}");

        const elements = stripe.elements();
        const cardElement = elements.create('card');

        cardElement.mount('#card-element');

        const cardHolderName = document.getElementById('card-holder-name');
        const cardButton = document.getElementById('card-button');
        const clientSecret = cardButton.dataset.secret;

        cardButton.addEventListener('click', async (e) => {
            const {
                setupIntent,
                error
            } = await stripe.confirmCardSetup(
                clientSecret, {
                    payment_method: {
                        card: cardElement,
                        billing_details: {
                            name: cardHolderName.value
                        }
                    }
                }
            );

            if (error) {
                if (error?.setupIntent) {
                    document.getElementById('paymentmethod').value = error.setupIntent.payment_method
                    document.getElementById('paymentmethod').checked = true
                    document.getElementById('card-button').style.display = 'none'
                    toastr.success('Card added');
                } else {
                    toastr.error('Something went wrong. Try again letter');
                }

            } else {
                document.getElementById('paymentmethod').value = setupIntent.payment_method
                document.getElementById('paymentmethod').checked = true
                document.getElementById('card-button').style.display = 'none'
                toastr.success('Card added');
            }
        });
    </script>
@endsection

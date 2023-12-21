@extends('layouts.app')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
    <link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/shops.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/cart.css') }}">
@endsection
@section('content')
    <x-app.header />
    <!-- Ec cart page -->

    <section class="ec-page-content">
        <div class="container">
            <div class="row justify-content-between">
                <div class="ec-cart-leftside col-lg-7 col-md-12">
                    <!-- cart content Start -->
                    <div class="row justify-content-center mb-2">
                        @php
                            $items = Cart::getContent();
                        
                            $groupedItems = $items->groupBy(function ($item) {
                                return $item->model->shop_id;
                            });
                        @endphp

                        @if (Cart::getTotalQuantity() > 0)
                            <div class="ec-cart-content">
                                <div class="ec-cart-inner">
                                    <h4 class="p-1 cart-heading">{{ Cart::getTotalQuantity() }} items in your cart</h4>
                                    @if (Cart::getTotalQuantity() > 0)
                                        <div class="row">


                                            @foreach ($groupedItems as $shopId => $items)
                                                <div>
                                                    <div class="d-flex mb-2 align-items-center">
                                                        <img height="54" width="64"
                                                            src="{{ Storage::url($items[0]->model->shop->logo) }}"
                                                            alt="">
                                                        <h5>

                                                            <a href="{{ route('store_front', $items[0]->model->shop->slug) }}"
                                                                class="mb-2"><u>{{ $items[0]->model->shop->name }}</u>
                                                            </a>Cart
                                                        </h5>

                                                    </div>

                                                    @foreach ($items as $item)
                                                        <div class="cart-item card rounded-4 mb-4">
                                                            <div class="card-body row box-shadow">
                                                                {{-- <div class="col-md-1 ">
                                                                    <div
                                                                        class="w-100 h-100 d-flex justify-content-center align-items-center">
                                                                        <input type="checkbox" class="cart-item-checkbox">
                                                                    </div>
                                                                </div> --}}

                                                                <div class="col-md-3 center">
                                                                    <img class="cart-item-image"
                                                                        src="{{ Storage::url($item->model->image) }}"
                                                                        alt="">
                                                                </div>
                                                   
                                                                <div class="col-md-5  cart-item-text">
                                                                    <h1 class="font-size">{{ $item->name }}</h1>
                                                                    <p class="item-title">
                                                                        {{ Str::limit(strip_tags($item->model->short_description), $limit = 50, $end = '...') }}
                                                                    </p>
                                                                    <a href="">

                                                                        @if ($item->model->quantity)
                                                                            <span class="text-success">In Stok</span>
                                                                        @else
                                                                            <span class="text-danger">Out of stock</span>
                                                                        @endif

                                                                    </a>
                                                               

                                                                    <form action="{{ route('cart.update') }}"
                                                                        method="POST">
                                                                        @csrf
                                                                
                                                                       
                                                                        @if($item->attributes[0] == 'no_offer')
                                                                        <input type="hidden" name="product_id"
                                                                            value="{{ $item->id }}" />
                                                                        <div class="col-3 mb-3 d-flex ">
                                                                            <input type="text" name="quantity"
                                                                                value="{{ $item->quantity }}"
                                                                                class="cart-input-stock " id="">
                                                                            <button type="submit"
                                                                                class="ms-2"><u>Update</u></button>
                                                                        </div>
                                                                        @endif
                                                                   
                                                                        <a
                                                                            href="{{ route('cart.destroy', $item->id) }}" onclick="return confirm('Are you sure you want to delete this item?');"><u>remove</u></a>
                                                                    </form>

                                                                </div>
                                                                <div
                                                                    class="col-md-3 justify-content-center align-item-center mt-3">
                                                                    <h1 class="cart-text">
                                                                        {{ Sohoj::price($item->price) }}</h1>
                                                                    <p class="">Shipping cost <span style="font-weight: 800">({{Sohoj::price($item->model->shipping_cost)}})</span></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endforeach


                                                </div>
                                            @endforeach


                                        </div>
                                    @endif
                                </div>
                            </div>

                    </div>

                    <div class="hr">

                    </div>

                    <!--cart content End -->
                </div>
                <!-- Sidebar Area Start -->
                <div class="ec-cart-rightside col-lg-4 col-md-12 " style="margin-top: 40px;">
                    <div class="ec-sidebar-wrap">
                        <!-- Sidebar Summary Block -->
                        <div class="ec-sidebar-block mt-5 side-bar-box ">

                            <div class="ec-sb-block-content">
                                <div class="ec-cart-summary-bottom">
                                    <div class="ec-cart-summary p-4">

                                        <div>
                                            <span class="text-left">Total ({{ Cart::getTotalQuantity() }} items)</span>
                                            <span class="text-right">{{ Sohoj::price(Sohoj::newItemTotal()) }}</span>
                                        </div>
                                        {{-- <div>
                                            <span class="text-left">Delivery Charges</span>
                                            <span class="text-right">$20.00</span>
                                        </div> --}}
                                        @if (!session()->has('discount'))
                                            <div>
                                                <span class="text-left">Coupan Discount</span>
                                                <span class="text-right"><a class="ec-cart-coupan">Apply Coupan</a></span>
                                            </div>

                                            <div class="ec-cart-coupan-content">
                                                <form class="ec-cart-coupan-form" name="ec-cart-coupan-form" method="POST"
                                                    action="{{ route('coupon') }}">
                                                    @csrf

                                                    <input class="ec-coupan bg-white" type="text" required=""
                                                        placeholder="Enter Your Coupan Code" name="coupon_code"
                                                        value="">
                                                    <button class="ec-coupan-btn button btn-dark" type="submit"
                                                        name="subscribe" value="">Apply</button>
                                                </form>
                                            </div>
                                        @endif
                                        @if (session()->has('discount'))
                                        <div class="ec-cart-summary-total">
                                            <span class="text-left">Discount <a href="{{route('coupon.destroy')}}" class="text-danger" style="text-decoration: underline">Delete</a></span>
                                            <span class="text-right">{{ Sohoj::price(Sohoj::discount()) }}</span>
                                        </div>
                                        @endif
                                        <div class="ec-cart-summary-total">
                                            <span class="text-left">Total Shipping</span>
                                            <span class="text-right">{{ Sohoj::price(Sohoj::shipping()) }}</span>
                                        </div>
                                        <div class="ec-cart-summary-total">
                                            <span class="text-left">Total Amount</span>
                                            <span class="text-right">{{ Sohoj::price(Sohoj::newSubtotal()) }}</span>
                                        </div>
                                        <a href="{{ route('checkout') }}" class="checkout-btn">Proceed to Checkout</a>
                                    </div>


                                </div>

                            </div>

                        </div>
                        <!-- Sidebar Summary Block -->
                        {{-- <h3 class="text-center">have a question? <a class="message-color" href=""> Message </a>
                            Seller</h3> --}}
                    </div>
                </div>
            </div>
        @else
            <div class=" col-md-12  m-5">
                <h3>No product has been added to cart. <a class="text-primary" href="{{ route('homepage') }}">Continue
                        Shopping</a></h3>
            </div>
            @endif

         


        </div>
    </section>

    <!-- New Product Start -->
    <section class="section ec-new-product">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-left">
                    <div class="section-title">

                        <h2 class="related-product-sec-title"> Explore Similer Shops</h2>
                    </div>
                    <div class="ec-spe-section  data-animation=" slideInLeft">


                        <div class="ec-spe-products">
                            @foreach ($latest_shops->chunk(4) as $shop)
                                <div class="ec-fs-product">
                                    <div class="ec-fs-pro-inner">

                                        <div class="row">

                                            @foreach ($shop as $shop)
                                                <x-shops-card.card-2 :shop="$shop" />
                                            @endforeach

                                        </div>

                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>



                </div>
            </div>
            <!-- New Product Content -->

        </div>
    </section>
    <!-- New Product end -->
@endsection
@section('js')
    <script src="{{ asset('assets/frontend-assets/js/vendor/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>

    <script src="{{ asset('assets/frontend-assets/js/main.js') }}"></script>
@endsection

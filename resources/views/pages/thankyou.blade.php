@extends('layouts.app')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
    <link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/shops.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/store_front.css') }}">
@endsection
@section('content')
    <x-app.header />
    <!-- Ec Thank You page -->
    <section class="ec-thank-you-page section-space-p">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="ec-thank-you section-space-p">
                        <!-- thank content Start -->
                        <div class="ec-thank-content">
                            <i class="ecicon eci-check-circle" aria-hidden="true"></i>
                            <div class="section-title">
                                <h2 class="ec-title">Thank You</h2>
                                <p class="sub-title">For Shopping with us.</p>
                            </div>
                        </div>
                        <!--thank content End -->
                        <div class="ec-hunger">
                            <div class="ec-hunger-detial">
                                <h3>Want to track your order?</h3>
                                <h6>Just click the link below.</h6>
                                <a href="{{ route('user.ordersIndex') }}" class="btn btn-danger rounded">Track Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section ec-new-product section-space-p">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="section-title">
                        <h2 class="ec-bg-title">New Arrivals</h2>
                        <h2 class="ec-title">New Arrivals</h2>
                        <p class="sub-title">Browse The Collection of Top Products</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- New Product Content -->
                <div class="ec-spe-section  data-animation=" slideInLeft">

                    <div class="ec-spe-products">
                        @foreach ($latest_products->chunk(6) as $products)
                            <div class="ec-fs-product">
                                <div class="ec-fs-pro-inner">

                                    <div class="row">
                                        @foreach ($products as $product)
                                            <x-products.product-3 :product="$product" />
                                        @endforeach



                                    </div>

                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>

            </div>
        </div>
    </section>
@endsection
@section('js')
    <script src="{{ asset('assets/frontend-assets/js/vendor/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>

    <script src="{{ asset('assets/frontend-assets/js/main.js') }}"></script>
@endsection

@extends('layouts.app')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/responsive.css') }}" />
    {{-- <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/demo2.css') }}" /> --}}
    <link rel="stylesheet" href="{{ asset('assets/css/shops.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/demo3.css') }}" />
    <style>
        @media screen and (max-width:768px) {

            .category-thumbnail {
                height: auto !important;
            }
        }

        .border-hover:hover {
            border: 1px solid black;
        }

        .border-hover {
            border-radius: 10px;
        }
    </style>
    <livewire:styles />
@endsection

@section('content')
    <x-app.header />
    <!-- Main Slider Start -->
    <div id="carouselExampleIndicators" class="carousel slide container my-2" data-bs-ride="carousel">
        <div class="carousel-indicators" style="justify-content: start;margin-left: 100px;margin-bottom:20px">
            @foreach ($sliders as $key => $slider)
                <button type="button" style="width: 15px;
        height: 15px;
        border-radius: 50%;"
                    data-bs-target="#carouselExampleIndicators" data-bs-slide-to="{{ $key }}" class="active"
                    aria-current="true" aria-label="Slide {{ $slider->id }}">
                </button>
            @endforeach
        </div>
        <div class="carousel-inner">
            @foreach ($sliders as $slider)
                <div class="carousel-item {{ $loop->index == 0 ? 'active' : '' }}">
                    <a href="{{ $slider->url }}"><img src="{{ Voyager::image($slider->image) }}"
                            class="d-block w-100 img-fluid " style="height: 450px;
                object-fit: cover;"
                            alt="..."></a>
                </div>
            @endforeach

        </div>

    </div>


    <!-- Main Slider End -->

    <!--  category Section Start -->


    <section class="section ec-category-section ">
        <div class="container">
            <div class="">
                <h2 class="related-product-sec-title my-5"> Browse Shops by Categories </h2>
                {{-- <div class="row margin-minus-b-15 margin-minus-t-15">
                <div class="ec-spe-section" data-animation="slideInLeft">
                    <div class="ec-spe-products">
                        @foreach ($prodcats->chunk(6) as $prodcats)
                        <div class="ec_cat_content ec_cat_content_1 me-5 d-flex ">

                            <div class="ec-fs-product">
                                <div class="ec-fs-pro-inner">

                                    <div class="row">
                                        @foreach ($prodcats as $prodcat)
                                        <div class="col-md-2 col-sm-6">
                                            <div class="category-thumbnail border-hover" style="background-color: #f5f5f5;height: 200px;">
                                                <a href="{{ route('shops', ['category' => $prodcat->slug]) }}"><img src="{{ Storage::url($prodcat->logo) }}" class="card-img-top " alt="..."></a>
                                            </div>
                                            <p class="card-title p-3" style="font-size: 15px;text-align:center">
                                                {{ $prodcat->name }}
                                            </p>
                                        </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                        </div>
                        @endforeach
                    </div>
                </div>
            </div> --}}
                <div class="row ">
                    <div class="ec_cat_slider">
                        @foreach ($prodcats as $prodcat)
                            <div class="ec_cat_content">
                                <div class="ec_cat_inner">
                                    <div class="category-thumbnail border-hover"
                                        style="background-color: #f5f5f5;height: 200px;">
                                        <a href="{{ route('shops', ['category' => $prodcat->slug]) }}"><img
                                                style="height: 100%" src="{{ Storage::url($prodcat->logo) }}"
                                                class="card-img-top " alt="..."></a>
                                    </div>
                                    <p class="card-title p-3" style="font-size: 15px;text-align:center">
                                        {{ $prodcat->name }}
                                    </p>
                                </div>
                            </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--category Section End -->

    <!-- Product tab Area Start -->

    <section class="section ec-product-tab section-space-p ">
        <div class="container">
            <div class="row">



                <!-- Product area start -->
                @if ($latest_products->count() > 0)
                    <section class="section ec-new-product">
                        <div class="">
                            <div class="row">
                                <div class="col-md-12 text-left">
                                    <div class="section-title">

                                        <h2 id="trending" class="related-product-sec-title"> Trending Products</h2>
                                    </div>
                                    <div class="ec-spe-section data-animation=" slideInLeft">

                                        <div class="ec-spe-products">
                                            @foreach ($latest_products->chunk(6) as $products)
                                                <div class="ec-fs-product">
                                                    <div class="ec-fs-pro-inner">

                                                        <div class="row">
                                                            @foreach ($products as $product)
                                                                <x-products.product-1 :product="$product" />
                                                            @endforeach



                                                        </div>

                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!-- New Product Content -->


                    </section>
                @else
                    <h3 class="text-center text-danger my-5"> Please increase the location to see more products.</h3>
                @endif
                <!-- product area end -->
                <!-- Offer section  -->
                <div class="container">
                    <x-offer2 />
                </div>
                <!-- Offer section end -->
                <!-- Product area start -->
                @if ($bestsaleproducts->count() > 0)
                    <section class="section ec-new-product">
                        <div class="">
                            <div class="row">
                                <div class="col-md-12 text-left">
                                    <div class="section-title">

                                        <h2 id="bestSeller" class="related-product-sec-title"> Recommended For You</h2>
                                    </div>
                                    <div class="ec-spe-section  data-animation=" slideInLeft">


                                        <div class="ec-spe-products">
                                            @if ($recommandProducts->count() > 0)
                                                @foreach ($recommandProducts->chunk(6) as $products)
                                                    <div class="ec-fs-product">
                                                        <div class="ec-fs-pro-inner">

                                                            <div class="row">
                                                                @foreach ($products as $product)
                                                                    <x-products.product-1 :product="$product" />
                                                                @endforeach




                                                            </div>

                                                        </div>
                                                    </div>
                                                @endforeach
                                            @else
                                                @foreach ($bestsaleproducts->chunk(6) as $products)
                                                    <div class="ec-fs-product">
                                                        <div class="ec-fs-pro-inner">

                                                            <div class="row">
                                                                @foreach ($products as $product)
                                                                    <x-products.product-1 :product="$product" />
                                                                @endforeach




                                                            </div>

                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif

                                        </div>
                                    </div>



                                </div>
                            </div>
                            <!-- New Product Content -->

                        </div>
                    </section>
                @endif
            </div>
        </div>

    </section>
    <div class="container border-bottom mb-5"></div>
    <!-- ec Product tab Area End -->
    <!-- Explore shop -->
    @if ($latest_shops->count() > 0)
        <section class="section ec-new-product">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-left">
                        <div class="section-title">

                            <h2 class="related-product-sec-title"> Trending Shops</h2>
                        </div>
                        <div class="ec-spe-section  data-animation=" slideInLeft">


                            <div class="ec-spe-products">
                                @foreach ($latest_shops->chunk(4) as $shops)
                                    <div class="ec-fs-product">
                                        <div class="ec-fs-pro-inner">

                                            <div class="row">


                                                @foreach ($shops as $shop)
                                                    <x-shops-card.card-3 :shop="$shop" />
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
    @endif
    <!-- New Product end -->
    <!-- Explore shop end -->
    <!-- Product tab Area Start -->
    @if ($latest_shops->count() > 0)
        <section class="section ec-product-tab section-space-p">
            <div class="container">
                <div class="row">
                    <!-- Product area start -->
                    <div class=" col-md-12">
                        <!-- Product tab area start -->
                        <div class="row space-t-50">
                            <!-- <div class="col-md-12">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="section-title">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <h2 class="ec-title">New Products</h2>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    </div> -->
                            <h2 class="related-product-sec-title my-5"> Recommended For You</h2>
                        </div>

                        <!-- 1st Product tab start -->
                        <div class="tab-pane fade show active" id="all">
                            <div>
                                @foreach ($latest_shops as $shop)
                                    @if ($shop->products->count())
                                        <div class="row mb-4">
                                            <div class="col-md-3">
                                                <x-shops-card.card-1 :shop="$shop" />
                                            </div>
                                            <div class="col-md-9">
                                                <div class="ec-spe-products">
                                                    @foreach ($shop->products->whereNull('parent_id')->chunk(4) as $products)
                                                        <div class="ec-fs-product">
                                                            <div class="ec-fs-pro-inner">

                                                                <div class="row">
                                                                    @php
                                                                        $last = $loop->last;
                                                                        $count = $shop->products->count();
                                                                    @endphp
                                                                    @foreach ($products as $product)
                                                                        <x-products.product-4 :product="$product" />
                                                                    @endforeach

                                                                    @if ($last && $count >= 8)
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 pro-gl-content d-flex align-items-center"
                                                                            style="margin-bottom: 35px;">
                                                                            <a href="{{ route('store_front', $shop->slug) }}"
                                                                                class="btn btn-dark">View More</a>
                                                                        </div>
                                                                    @endif


                                                                </div>

                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                    @endif
                                @endforeach
                                {{-- <livewire:shops /> --}}
                            </div>


                            <!-- Product tab area end -->

                            <div class=" d-flex justify-content-center  align-items-center mt-4">
                                <a href="{{ route('vendors') }}" class="btn btn-dark rounded rounded-3 px-5">View More
                                    Shops <i class="fa-solid fa-angle-right ms-2"></i></a>
                            </div>

                        </div>
                    </div>
                </div>


        </section>
    @endif
    <!-- ec Product tab Area End -->

    </div>
    </div>
    </div>
    <!-- Product tab area end -->
@endsection
@section('js')
    {{-- <livewire:scripts /> --}}
    <script src="{{ asset('assets/frontend-assets/js/demo-8.js') }}"></script>
    <script src="{{ asset('assets/frontend-assets/js/demo-3.js') }}"></script>
@endsection

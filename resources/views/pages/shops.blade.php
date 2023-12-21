@php
    $route = route('shops');
@endphp

@extends('layouts.app')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
    <link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/shops.css') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
    <link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/shops.css') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <style>
        .ec-product-inner .ec-pro-image .ec-pro-actions .wishlist {
            position: absolute !important;
            right: 6px !important;
            bottom: 62px !important;
            border: 1px solid #eeeeee;
        }

        label {
            display: block;
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }

        #price-range {
            margin-top: 20px;
        }

        #price-display {
            margin-top: 10px;
        }
        /* .rating-container .filled-stars{
            left: 5px;
        } */
    </style>
@endsection
@section('content')
    <x-app.header />
    <div class="">
        <div class="row container-fluid">
            <aside class="col-md-3 col-sm-12">
                <div class="wrapper">
                    <div class="content py-md-0 py-3">
                        <aside id="sideba" class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <a href="{{ route('shops') }}" class="w-100 btn btn-dark">Remove Filter</a>
            
                            <div id="price-range">
                                <h4 class="font-weight-bold" for="price-slider">Price Range:</h4>
                                <div id="price-slider"></div>
                                <div id="price-display">
                                    Min: <span id="minPriceDisplay"></span>, Max: <span id="maxPriceDisplay"></span>
                                </div>
                            </div>
                            <div class="py-3">
                                <h5 class="font-weight-bold">Categories</h5>
                                <ul class="list-group">
                                    @foreach ($categories as $category)
                                        <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category"
                                            style="cursor: default">
                                            <a href="javascript::void(0)"
                                                onclick='updateSearchParams("category","{{ $category->slug }}","{{ $route }}")'>
                                                {{ $category->name }}
                                            </a>
                                            <span class="badge badge-primary badge-pill">{{ $category->products->count() }}</span>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="py-3">
                                <h5 class="font-weight-bold">Rating</h5>
                                <form class="rating" id="ratingForm">
                                    <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span
                                                class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                                class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                                class="fas fa-star"></span> <input type="checkbox" value="5"
                                                {{ request('ratings') == 5 ? 'checked' : '' }}> <span class="check"></span>
                                        </label> </div>
                                    <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span
                                                class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                                class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <input type="checkbox"
                                                value="4" {{ request('ratings') == 4 ? 'checked' : '' }}> <span
                                                class="check"></span> </label> </div>
                                    <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span
                                                class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                                class="fas fa-star"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <input type="checkbox"
                                                value="3" {{ request('ratings') == 3 ? 'checked' : '' }}> <span
                                                class="check"></span> </label> </div>
                                    <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span
                                                class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <input type="checkbox"
                                                value="2" {{ request('ratings') == 2 ? 'checked' : '' }}> <span
                                                class="check"></span> </label> </div>
                                    <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span
                                                class="fas fa-star"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <span
                                                class="far fa-star px-1 text-muted"></span> <input type="checkbox"
                                                value="1" {{ request('ratings') == 1 ? 'checked' : '' }}> <span
                                                class="check"></span> </label> </div>
                                </form>
                            </div>
                        </aside>
                    </div>
                </div>
            </aside>
            
            <div class="col-md-9">

                <section class="ec-page-content section-space-p">
                    <div class="container">
                        <div class="row">
                            <div class="ec-shop-rightside col-lg-12 col-md-12">
                                <!-- Shop Top Start -->
                                <div class="ec-pro-list-top d-flex ">
                                    <div class="col-md-6 ec-grid-list">
                                        <div class="ec-gl-btn">
                                            <p>Results For “ <span style="color:#3BB77E ">{{ request()->search }}</span> ”
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 ec-sort-select">
                                        <span class="sort-by text-end">Sort by:</span>
                                        <div class="ec-select-inner" style="border: none">
                                            <select name="ec-select"
                                                onchange='updateSearchParams("filter_products",this.value,"{{ $route }}")'
                                                id="ec-select" style="font-weight: 600;">

                                                <option value="most-sold"
                                                    {{ request()->filter_products == 'most-sold' ? 'selected' : '' }}>Most
                                                    Sold
                                                </option>
                                                <option value="price-low-high "
                                                    {{ request()->filter_products == 'price-low-high' ? 'selected' : '' }}>
                                                    Price, low
                                                    to
                                                    high</option>
                                                <option value="price-high-low"
                                                    {{ request()->filter_products == 'price-high-low' ? 'selected' : '' }}>
                                                    Price, high
                                                    to
                                                    low</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- Shop Top End -->

                                <!-- Shop content Start -->
                                <div class="shop-pro-content">
                                    <div class="shop-pro-inner">
                                        <div class="row">
                                            @foreach ($products as $shopId => $items)
                                                @foreach ($items as $product)
                                                    <x-products.product-2 :product="$product" />
                                                @endforeach
                                            @endforeach
                                        </div>
                                    </div>
                                    {{-- {{$products->links()}} --}}
                                    <!-- Ec Pagination Start -->
                                    {{-- <div class="col d-flex justify-content-center">
                                    <div class="pagination d-flex justify-content-center  align-items-center">
                                        <button class="btn btn-dark-light rounded"><i class="fi-rr-arrow-alt-left"></i></button>
                                        <p>View More</p>
                                        <button class="btn btn-dark rounded"><i class="fi-rr-arrow-alt-right"></i></button>
                                    </div>
                                </div> --}}
                                    <!-- Ec Pagination End -->
                                    {{-- Start sort by popular --}}
                                    <div class="col hr-border">

                                    </div>
                                    <!-- Shop Top Start -->
                                    <div class="ec-pro-list-top d-flex " style="margin-top: 40px">
                                        {{-- <div class="col-md-6 ec-grid-list">
                                    <div class="ec-gl-btn">
                                        <p>Results For “ <span style="color:#3BB77E ">{{request()->search}}</span> ”</p>
                                </div>
                                </div> --}}
                                            {{-- <div class="col-md-12 ec-sort-select">
                                    <span class="sort-by text-end">Sort by:</span>
                                    <div class="ec-select-inner" style="border: none">
                                        <select onchange='updateSearchParams("shop_products",this.value,"{{ $route }}")' name="ec-select" id="ec-select" style="font-weight: 600;">

                                            <option value="most-populer" {{ request()->filter_products == 'most-populer' ? 'selected' : '' }}>Most
                                                Popular
                                            </option>
                                            <option value="price-low-hight" {{ request()->filter_products == 'price-low-hight' ? 'selected' : '' }}>Price,
                                                low
                                                to high</option>
                                            <option value="price-high-low" {{ request()->filter_products == 'price-high-low' ? 'selected' : '' }}>Price,
                                                high
                                                to low</option>
                                        </select>
                                    </div>
                                </div> --}}
                                    </div>
                                    <div>
                                        @foreach ($products as $shopId => $items)
                                            <div class="row mb-4">
                                                <div class="col-md-3">
                                                    <x-shops-card.card-1 :shop="$items[0]->shop" />
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="ec-spe-products">
                                                        @foreach ($items->whereNull('parent_id')->chunk(4) as $products)
                                                            <div class="ec-fs-product">
                                                                <div class="ec-fs-pro-inner">

                                                                    <div class="row">
                                                                        @php
                                                                            
                                                                            $last = $loop->last;
                                                                            $count = $items[0]->shop->products->count();
                                                                        @endphp
                                                                        @foreach ($products as $product)
                                                                            <x-products.product-4 :product="$product" />
                                                                        @endforeach

                                                                        @if ($last && $count >= 8)
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 pro-gl-content d-flex align-items-center"
                                                                                style="margin-bottom: 35px;">
                                                                                <a href="{{ route('store_front', $items[0]->shop->slug) }}"
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
                                        @endforeach
                                    </div>
                                    <div class=" d-flex justify-content-center  align-items-center mt-4">
                                        <a href="{{ route('vendors') }}" class="btn btn-dark rounded rounded-3 px-5">View
                                            More Shops <i class="fa-solid fa-angle-right ms-2"></i></a>
                                    </div>
                                    {{-- <livewire:shops /> --}}
                                    <!-- Shop Top End -->
                                    {{-- End sort by popular --}}
                                </div>

                            </div>
                            <!-- Sidebar Area Start -->
                            <div class="filter-sidebar-overlay"></div>
                            <div class="ec-shop-leftside filter-sidebar">
                                <div class="ec-sidebar-heading">
                                    <h1>Filter Products By</h1>
                                    <a class="filter-cls-btn" href="javascript:void(0)">×</a>
                                </div>
                                <div class="ec-sidebar-wrap">
                                    <!-- Sidebar Category Block -->
                                    <div class="ec-sidebar-block">
                                        <div class="ec-sb-title">
                                            <h3 class="ec-sidebar-title">Category</h3>
                                        </div>
                                        <div class="ec-sb-block-content">
                                            <ul>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" checked /> <a
                                                            href="#">clothes</a><span class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" /> <a href="#">Bags</a><span
                                                            class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" /> <a href="#">Shoes</a><span
                                                            class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" /> <a href="#">cosmetics</a><span
                                                            class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" /> <a href="#">electrics</a><span
                                                            class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" /> <a href="#">phone</a><span
                                                            class="checked"></span>
                                                    </div>
                                                </li>
                                                <li id="ec-more-toggle-content" style="padding: 0; display: none;">
                                                    <ul>
                                                        <li>
                                                            <div class="ec-sidebar-block-item">
                                                                <input type="checkbox" /> <a href="#">Watch</a><span
                                                                    class="checked"></span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="ec-sidebar-block-item">
                                                                <input type="checkbox" /> <a href="#">Cap</a><span
                                                                    class="checked"></span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item ec-more-toggle">
                                                        <span class="checked"></span><span id="ec-more-toggle">More
                                                            Categories</span>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Sidebar Size Block -->
                                    <div class="ec-sidebar-block">
                                        <div class="ec-sb-title">
                                            <h3 class="ec-sidebar-title">Size</h3>
                                        </div>
                                        <div class="ec-sb-block-content">
                                            <ul>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" value="" checked /><a
                                                            href="#">S</a><span class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" value="" /><a
                                                            href="#">M</a><span class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" value="" /> <a
                                                            href="#">L</a><span class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" value="" /><a
                                                            href="#">XL</a><span class="checked"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item">
                                                        <input type="checkbox" value="" /><a
                                                            href="#">XXL</a><span class="checked"></span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Sidebar Color item -->
                                    <div class="ec-sidebar-block ec-sidebar-block-clr">
                                        <div class="ec-sb-title">
                                            <h3 class="ec-sidebar-title">Color</h3>
                                        </div>
                                        <div class="ec-sb-block-content">
                                            <ul>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#c4d6f9;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#ff748b;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#000000;"></span>
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#2bff4a;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#ff7c5e;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#f155ff;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#ffef00;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#c89fff;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#7bfffa;"></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="ec-sidebar-block-item"><span
                                                            style="background-color:#56ffc1;"></span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Sidebar Price Block -->
                                    <div class="ec-sidebar-block">
                                        <div class="ec-sb-title">
                                            <h3 class="ec-sidebar-title">Price</h3>
                                        </div>
                                        <div class="ec-sb-block-content es-price-slider">
                                            <div class="ec-price-filter">
                                                <div id="ec-sliderPrice" class="filter__slider-price" data-min="0"
                                                    data-max="250" data-step="10"></div>
                                                <div class="ec-price-input">
                                                    <label class="filter__label"><input type="text"
                                                            class="filter__input"></label>
                                                    <span class="ec-price-divider"></span>
                                                    <label class="filter__label"><input type="text"
                                                            class="filter__input"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- End Shop page -->
@endsection
@section('js')

    {{-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --}}
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="{{ asset('assets/frontend-assets/js/vendor/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>

    <script src="{{ asset('assets/frontend-assets/js/main.js') }}"></script>
@endsection

@extends('layouts.app')
@section('css')
<link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
<link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
<link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
<link rel="stylesheet" href="{{ asset('assets/css/product_details.css') }}">
{{-- <link rel="stylesheet" href="{{ asset('assets/css/star-rating.css') }}"> --}}
<link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/shops.css') }}">

<style>
    .ec-product-inner .ec-pro-image .ec-pro-actions .wishlist {
        right: 10px;
    }
</style>
@endsection
@section('content')
<x-app.header />
@php
$images = json_decode($product->images) ?? [];

@endphp
<!-- Sart Single product -->
<section class="ec-page-content section-space-p product_details-body">
    <div class="container">
        <div class="row">
            <div class="ec-pro-rightside ec-common-rightside col-lg-12 col-md-12">

                <!-- Single product content Start -->
                <div class="single-pro-block">
                    <div class="single-pro-inner">
                        <div class="row">
                            <div class="single-pro-img single-pro-img-no-sidebar ">
                                <div class="single-product-scroll">

                                    <div class="single-product-cover">
                                        <div class="single-slide zoom-image-hover" style="height: 500px">
                                            <img class="img-responsive" style="object-fit: contain;
                                                width: 100%;
                                                height: 100%;" src="{{ Storage::url($product->image) }}" alt="">
                                        </div>
                                        @if ($images)
                                        @foreach ($images as $key => $image)
                                        <div class="single-slide zoom-image-hover" style="height: 500px">
                                            <img class="img-responsive" style="object-fit: cover;
                                                width: 100%;
                                                height: 100%;" src="{{ Storage::url($image) }}" alt="">
                                        </div>
                                        @endforeach
                                        @endif

                                    </div>

                                    <div class="single-nav-thumb">
                                        <div class="single-slide" style="">
                                            <img class="img-responsive" style="object-fit: cover; height:100px" src="{{ Storage::url($product->image) }}" alt="">
                                        </div>
                                        @if ($images)
                                        @foreach ($images as $key => $image)
                                        <div class="single-slide">
                                            <img class="img-responsive" style="height:100px" src="{{ Voyager::image($image) }}" alt="">
                                        </div>
                                        @endforeach
                                        @endif

                                    </div>
                                </div>
                            </div>
                            <div class="single-pro-desc single-pro-desc-no-sidebar">
                                <div class="single-pro-content d-flex flex-column justify-content-between" style="height
                                    :100%">
                                    <div>
                                        <h5 class="ec-single-title mb-2 " style="font-family: 'Inter', sans-serif; font-weight: 500">
                                            {{ $product->name }}
                                        </h5>
                                        <span>Shop:

                                            <a href="{{ route('store_front', $product->shop->slug) }}">
                                                {{ $product->shop->name }}</a>
                                        </span>

                                        <div class="ec-single-rating-wrap mt-3">
                                            <div class="ec-single-rating">
                                                <input value="{{ Sohoj::average_rating($product->ratings) }}" class="rating published_rating" data-size="sm">
                                            </div>

                                        </div>
                                        <div class="ec-single-desc ">
                                            <span>{!! $product->short_description !!}</span>
                                        </div>
                                    </div>

                                    <div class="mb-5">
                                        <div class="stock product_details-body">
                                            <span>Availability: <span style="color: #D81919E5">{{ $product->quantity }}</span> in Stock
                                            </span>
                                        </div>

                                        <div class="ec-single-price-stoke">
                                            <div class="ec-single-price product-price">
                                                <span class="ec-single-ps-title price-currency product_details-body">usd</span>
                                                <div class="d-flex align-items-center">
                                                    {{-- <span class="new-price product-ammount product_details-body">{{ Sohoj::price($product->sale_price) }}</span>
                                                    <span class="old-price product-ammount product_details-body">{{ Sohoj::price($product->price) }}</span> --}}
                                                    <span class="ec-price d-flex align-items-center">
                                                        <span class="new-price product-ammount product_details-body">{{ Sohoj::price($product->sale_price ?? $product->price) }}</span>
                                                        @if($product->sale_price)
                                                        <del><span class="old-price ">{{ Sohoj::price($product->price) }}</span></del>
                                                        @endif

                                                    </span>
                                                    @if($product->is_offer==true)
                                                    <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#offerModal"><span class="mx-3">Make an
                                                            Offer?</span></a>
                                                    @endif
                                                    <!-- Modal  -->
                                                    <div class="modal fade" id="offerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                                                                        Send Offer</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="{{ route('offer', $product) }}" method="post">
                                                                        @csrf
                                                                        <div class="form-group">
                                                                            <label for="email">Price</label>
                                                                            <input type="text" class="form-control" required name="price" id="price" aria-describedby="emailHelp" placeholder="Enter price">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="massage">Quantity</label>
                                                                            <input type="text" class="form-control" required name="qty" id="qty" aria-describedby="emailHelp" placeholder="Enter Qty">
                                                                        </div>



                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                                </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Modal -->


                                                </div>
                                                <span>Sku: <span>{{ $product->sku }}</span>

                                                </span>

                                            </div>

                                        </div>
                                        <form action="{{ route('cart.boynow') }}" method="POST">
                                            @csrf
                                            @if ($product->is_variable_product && count($product->subproductsuser) > 0)
                                            @foreach ($product->attributes as $attribute)
                                                <div class="row mt-2 pt-2 w-100 mb-2">
                                                    <div class="form-group col-md-12 pl-0 ">
                                                        <h5 class="ms-3">{{ str_replace('_', ' ', $attribute->name) }}</h4>
                                                        <div class="btn-group ms-2" role="group">
                                                            @foreach ($attribute->value as $value)
                                                                <input type="radio"
                                                                    class="btn-check {{ str_replace(' ', '_', $attribute->name) }}"
                                                                    name="variable_attribute[{{ $attribute->name }}]"
                                                                    id="{{ str_replace(' ', '_', $value) }}"
                                                                    value="{{ $value }}" required
                                                                    onclick="change_variable()">
                                                                <label class="btn btn-outline-primary"
                                                                    for="{{ str_replace(' ', '_', $value) }}">{{ str_replace('_', ' ', $value) }}</label>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif
                                        <div class="ec-single-qty align-items-center">

                                            <div class="ec-single-cart ">
                                   
                                                    <div class="ec-single-qty">

                                                        <input type="hidden" class="" name="product_id" value="{{ $product->id }}" />

                                                        <div class="qty-plus-minus">
                                                            <input class="qty-input qty" type="text" name="quantity" value="1" />
                                                        </div>
                                              
                                                        <div class="ec-single-cart ">
                                                            <button class="btn btn-sm btn-dark" type="submit">Buy
                                                                Now</button>
                                                        </div>
                                                        <div class="ec-single-cart ">
                                                            @if (!in_array($product->id, session()->get('wishlist', [])))
                                                            <a href="{{ route('wishlist.add', ['productId' => $product->id]) }}" class=" btn btn-outline-dark wishlist">Add to
                                                                wishlist</i></a>
                                                            @else
                                                            <a href="{{ route('wishlist.remove', ['productId' => $product->id]) }}" class="btn btn-dark wishlist ">Remove from
                                                                wishlist</a>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>



                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Single product tab start -->
                <div class="ec-single-pro-tab" id="ratings">
                    <div class="ec-single-pro-tab-wrapper">
                        <div class="ec-single-pro-tab-nav d-flex justify-content-center">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link {{Request()->has('id') ? '' : 'active'}} " data-bs-toggle="tab" data-bs-target="#ec-spt-nav-details" role="tablist">Detail</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#ec-spt-nav-info" role="tablist">More Information</a>
                                </li>
                              
                                <li class="nav-item">
                                    <a class="nav-link {{Request()->has('id') ? ' active' : ''}}" data-bs-toggle="tab" data-bs-target="#ec-spt-nav-review" role="tablist">Reviews</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content  ec-single-pro-tab-content">
                            <div id="ec-spt-nav-details" class="tab-pane fade show active">
                                <div class="ec-single-pro-tab-desc">
                                    <p>{!! $product->description !!}
                                    </p>

                                </div>
                            </div>
                            <div id="ec-spt-nav-info" class="tab-pane fade">
                                <div class="ec-single-pro-tab-moreinfo">
                                    <ul>
                                        <li><span>Weight</span> {{ $product->weight }}g</li>
                                        <li><span>Dimensions</span> {{ $product->dimensions }} cm</li>
                                        <li><span>Shipping Cost</span> {{ Sohoj::price($product->shipping_cost) }}</li>
                           

                                      


                                    </ul>
                                </div>
                            </div>

                            <div id="ec-spt-nav-review"  class="tab-pane fade {{Request()->has('id') ? 'show active' : ''}}">
                                <div class="row">
                                    <div class="ec-t-review-wrapper">
                                        @foreach ($product->ratings as $rating)
                                        <div class="ec-t-review-item">
                                            <div class="ec-t-review-avtar">
                                                <img src="{{ asset('assets/img/single_product/person.png') }}" alt="" />
                                            </div>
                                            <div class="ec-t-review-content">
                                                <div class="ec-t-review-top">
                                                    <div class="ec-t-review-name">{{ $rating->name }}</div>
                                                    <div class="ec-t-review-rating">
                                                        <input name="rating" type="number" value="{{ $rating->rating }}" class="rating published_rating" data-size="sm">
                                                    </div>
                                                </div>

                                                <div class="ec-t-review-bottom">
                                                    <p>
                                                        {{ $rating->review }}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        @endforeach


                                    </div>
                                    @php
                                    $user = Auth()->id();
                                    $rating = App\Models\Rating::where('user_id', $user)
                                    ->where('product_id', $product->id)
                                    ->get();
                               

                                    @endphp
                                    @if (Auth::check())
                                    @if ( $rating->count() == 0)
                                    <div class="ec-ratting-content">
                                        <h3>Add a Review</h3>
                                        <div class="ec-ratting-form">
                                            <form action="{{ route('rating', ['product_id' => $product->id]) }}" method="POST">
                                                @csrf
                                                <div class="ec-ratting-star">
                                                    <span>Your rating:</span>
                                                    <input value="1" name="rating" class="rating product_rating" data-size="xs">
                                                </div>
                                                <div class="ec-ratting-input">
                                                    <input name="name" placeholder="Name" class="@error('name') is-invalid @enderror" placeholder="Your Name" type="text" />
                                                </div>
                                                @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror
                                                <div class="ec-ratting-input">
                                                    <input name="email" placeholder="Email*" class="@error('email') is-invalid @enderror" placeholder="Your Email" type="email" required />
                                                </div>
                                                @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror

                                                <div class="ec-ratting-input form-submit">
                                                    <textarea name="review" placeholder="Enter Your Comment"></textarea>
                                                    <button class="btn btn-dark" type="submit" value="Submit">Submit</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    @endif
                                    @endif

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- product details description area end -->
</section>
<!-- End Single product -->

<!-- Related Product Start -->
<section class="section ec-new-product " style="margin-bottom: 100px">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-left">
                <div class="section-title">

                    <h2 class="related-product-sec-title"> Related products</h2>
                </div>
                <div class="ec-spe-section  data-animation=" slideInLeft">


                    <div class="ec-spe-products">
                        @foreach ($related_products->chunk(6) as $products)
                        <div class="ec-fs-product">
                            <div class="ec-fs-pro-inner">

                                <div class="row margin-minus-b-30">
                                    <!-- Related Product Content -->
                                    @foreach ($products as $product)
                                    <x-products.product-2 :product="$product" />
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





<!-- Related Product end -->
<!-- Related Product end -->
@endsection
@section('js')
<script src="{{ asset('assets/frontend-assets/js/vendor/jquery.magnific-popup.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/slick.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>

<script src="{{ asset('assets/frontend-assets/js/main.js') }}"></script>
{{-- <script src="{{ asset('assets/js/star-rating.js') }}"></script>

<script>
    $("#product_rating").rating({
        showCaption: true
    });
    $(".published_rating").rating({
        showCaption: false,
        readonly: true,
    });
</script> --}}
@endsection
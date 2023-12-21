<style>
    .ec-product-inner .ec-pro-actions .quickview {
        right: 6px !important;
        bottom: 25px !important;
    }
</style>
<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 col-6 pro-gl-content" style="margin-bottom: 35px;">
    <div class="ec-product-inner">
        <div class="ec-pro-image-outer">
            <div class="ec-pro-image">
                <a href="{{ route('product_details', $product->slug) }}" class="image">
                    <img class="main-image" src="{{ Storage::url($product->image) }}" alt="Product" />
                    <img class="hover-image" src="{{ Storage::url($product->image) }}" alt="Product" />
                </a>


                <div class="ec-pro-actions">
                    <a href="JavaScript:void(0)" onclick="quickView({{ $product->id }})" class="quickview "><i
                            class="fi-rr-eye"></i></a>
                    @if (!in_array($product->id, session()->get('wishlist', [])))
                        <a href="javascript:void(0)" onclick="wishlist({{ $product->id }})"
                            class="ec-btn-group wishlist " style="border-radius: 10px 10px 0 0"><i
                                class="add-wish-new_{{ $product->id }} fa-regular fa-heart"></i></a>
                    @else
                        <a href="{{ route('wishlist.remove', ['productId' => $product->id]) }}"
                            class="ec-btn-group wishlist " style="border-radius: 10px 10px 0 0"><i
                                class="fa-solid fa-heart " style="color: #3BB77E"></i></a>
                    @endif


                    {{-- <a class="ec-btn-group wishlist active" title="Wishlist"></a> --}}
                </div>
            </div>
        </div>
        <div class="ec-pro-content text-center" style="margin-top: 14px;height: 100px;">
            <h5 class="ec-pro-title"><a href="{{ route('product_details', $product->slug) }}" style="font-size:15px">{{ $product->name }}</a>
            </h5>
            <div class="ec-pro-list-desc py-2">
                <p style="font-size: 13px; color: #787885">
                    {{-- {{ Str::limit(strip_tags($product->short_description), $limit = 40, $end = '...') }}</p> --}}
            </div>




        </div>
        <div class="d-flex justify-content-between button-size">
            <span class="ec-price">

                <span class="new-price">{{ Sohoj::price($product->sale_price ?? $product->price) }}</span>
            </span>
            <form class="addToCartForm_{{ $product->id }}">
                @csrf
                <input type="hidden" class="form-control qty" value="1" min="1" name="quantity">
                <input type="hidden" name="product_id"value="{{ $product->id }}" />
                <button class="btn btn-sm btn-dark cart-store" data-product-id="{{ $product->id }}" type="button"><i
                        class="fi-rr-shopping-cart"></i>
                    ADD
                </button>
            </form>
        </div>
    </div>
</div>

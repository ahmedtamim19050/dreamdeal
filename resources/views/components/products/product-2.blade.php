<div class="col-lg-2 col-md-4 col-sm-6 col-6 col-xs-6 mb-5 col-6">
    <div class="ec-product-inner">
        <div class="ec-pro-image-outer">
            <div class="ec-pro-image">
                <a href="{{ route('product_details', $product->slug) }}" class="image">
                    <img class="main-image" src="{{ Storage::url($product->image) }}" alt="Product" />
                    <img class="hover-image" src="{{ Storage::url($product->image) }}" alt="Product" />
                </a>
                <div class="ec-pro-actions">

                    <a href="JavaScript:void(0)" onclick="quickView({{ $product->id }})" class="quickview"><i
                            class="fi-rr-eye"></i></a>
                    <a href="javascript:void(0)" onclick="wishlist({{ $product->id }})" class="ec-btn-group wishlist " style="border-radius: 10px 10px 0 0"
                        title="Wishlist"><i class="fi-rr-heart"></i></a>
                </div>
            </div>
        </div>
        <div class="ec-pro-content  text-center " style="margin-top: 14px">
            <div class="height-shops">
                <h5 class="ec-pro-title"><a
                        href="{{ route('product_details', $product->slug) }}">{{ $product->name }}</a></h5>
                <div class="ec-pro-list-desc">
                    <p style="font-size: 9px; color: #787885">
                        {{ Str::limit(strip_tags($product->short_description), $limit = 40, $end = '...') }}
                    </p>
                </div>
            </div>
            <div class="ec-pro-rating reco-ratting d-flex justify-content-center">
                <input value="{{ Sohoj::average_rating($product->ratings) }}" class="rating published_rating"
                    data-size="xs">
            </div>
            <div class="d-flex justify-content-between button-size " style="margin-top: 23px">
                <span class="ec-price">

                    <span class="new-price">{{ Sohoj::price($product->sale_price ?? $product->price) }}</span>

                </span>
                <form class="addToCartForm_{{ $product->id }}">
                    @csrf
                    <input type="hidden" class="form-control qty" value="1" min="1" name="quantity">
                    <input type="hidden" name="product_id" value="{{ $product->id }}" />
                    <button class="btn btn-sm btn-dark cart-store" type="button" data-product-id="{{ $product->id }}"><i class="fi-rr-shopping-cart"></i>
                        ADD
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

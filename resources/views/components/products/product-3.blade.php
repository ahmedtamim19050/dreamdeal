<div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 mb-6  pro-gl-content col-6">
    <div class="ec-product-inner" style="border-radius: 5px; position:relative">
        <div class="ec-pro-image-outer">
            <div class="ec-pro-image">
                <a href="{{ route('product_details', $product->slug) }}" class="image">
                    <img class="main-image" src="{{ Storage::url($product->image) }}" alt="Product" />
                    <img class="hover-image" src="{{ Storage::url($product->image) }}" alt="Product" />
                </a>


                <div class="ec-pro-actions">
                    <a href="JavaScript:void(0)" onclick="quickView({{ $product->id }})" class="quickview"><i
                            class="fi-rr-eye"></i></a>
                    <form action="{{ route('cart.store') }}" method="post">
                        @csrf
                        <input type="hidden" class="form-control qty" value="1" min="1" name="quantity">
                        <input type="hidden" name="product_id"value="{{ $product->id }}" />
                        <button title="Add To Cart" class="add-to-cart" style="right: 6px; bottom: 86px"
                            type="submit"><i class="fi-rr-shopping-basket"></i> Add To
                            Cart</button>
                    </form>
                    @if (!in_array($product->id, session()->get('wishlist', [])))
                        <a href="javascript:void(0)" onclick="wishlist({{ $product->id }})"
                            class="ec-btn-group wishlist" style="bottom: 50px"><i class="fa-regular fa-heart"></i></a>
                    @else
                        <a href="{{ route('wishlist.remove', ['productId' => $product->id]) }}"
                            class="ec-btn-group wishlist" style="bottom: 50px"><i class="fa-solid fa-heart "
                                style="color: #3BB77E"></i></a>
                    @endif
                </div>
            </div>
        </div>
        <div class="ec-pro-content text-center" style="margin-top: 14px;height: 100px;">
            <h5 class="ec-pro-title">
                <a href="{{ route('product_details', $product->slug) }}">{{ $product->name }}</a>
            </h5>

            <div class="ec-pro-list-desc" style="font-size: 9px; color: #787885">
                {{ Str::limit(strip_tags($product->short_description), $limit = 50, $end = '...') }}</div>




        </div>
        <div class="ec-pro-rating d-flex justify-content-center">
            <input value="{{ Sohoj::average_rating($product->ratings) }}" class="rating published_rating"
                data-size="xs">
        </div>
    </div>
</div>

<div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 mb-6 col-6">
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
                    <form class="addToCartForm_{{ $product->id }}">
                        @csrf
                        <input type="hidden" class="form-control qty" value="1" min="1" name="quantity">
                        <input type="hidden" name="product_id" value="{{ $product->id }}" />
                        @if ($product->is_variable && count($product->subproductsuser) > 0)
                            <div class="row mt-2 pt-2 w-100 mb-2">
                                @foreach ($product->attributes as $attribute)
                                    <div class="form-group col-md-4 pl-0 ">
                                        <label for="{{ $attribute->name }}">
                                            {{ str_replace('_', ' ', $attribute->name) }}</label>
                                        <select class="form-control w-100"
                                            id="{{ str_replace(' ', '_', $attribute->name) }}"
                                            name="variable_attribute[{{ $attribute->name }}]"
                                            onchange="change_variable()" onload="" required>

                                            @foreach ($attribute->value as $value)
                                                <option value="{{ $value }}">{{ $value }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                @endforeach

                            </div>
                        @endif
                        <button title="Add To Cart" data-product-id="{{ $product->id }}"
                            class="add-to-cart cart-store" style="right: 6px; bottom: 86px" type="button"><i
                                class="fi-rr-shopping-basket"></i></button>
                    </form>
                    @if (!in_array($product->id, session()->get('wishlist', [])))
                        <a href="javascript:void(0)" onclick="wishlist({{ $product->id }})"
                            class="ec-btn-group wishlist" style="bottom: 51px;right: 6px;"><i
                                class="add-wish-new_{{ $product->id }} fa-regular fa-heart"></i></a>
                    @else
                        <a href="javascript:void(0)" onclick="wishlist({{ $product->id }})"
                            class="ec-btn-group wishlist" style="bottom: 51px;right: 6px;"><i
                                class="add-wish-new_{{ $product->id }} fa-regular fa-solid fa-heart"
                                style="color: #3BB77E"></i></a>
                    @endif
                </div>
            </div>
        </div sty>
        <div class="ec-pro-content text-center" style="height: 180px;position:relative">
            <h5 class="ec-pro-title text-center" style=" color:#19191D">
                <a href="{{ route('product_details', $product->slug) }}"
                    style="font-size: 15px;">{{ $product->name }}</a>
            </h5>

            <div class="ec-pro-list-desc text-center" style="font-size: 12px; color: #787885;height: 35px;">
                {{ Str::limit(strip_tags($product->short_description), $limit = 55, $end = '...') }}
            </div>
            <div style="position:absolute;bottom:0;width:100%">

                <div class="ec-pro-rating reco-ratting d-flex justify-content-center">
                    <input value="{{ Sohoj::average_rating($product->ratings) }}" class="rating published_rating"
                        data-size="xs">
                </div>

                <div class="d-flex justify-content-between button-size align-items-center">
                    <span class="ec-price">
                        <span class="new-price"
                            style="font-size: 20px; font-weight:700;color:000000;">{{ Sohoj::price($product->price) }}</span>
                    </span>
                    <form class="addToCartForm_{{ $product->id }}" id="">
                        @csrf
                        <input type="hidden" class="form-control qty" value="1" min="1" name="quantity">
                        <input type="hidden" name="product_id" value="{{ $product->id }}" />
                        <button id="addToCartBtn" class="btn btn-sm btn-dark cart-store"
                            data-product-id="{{ $product->id }}" type="button"><i class="fi-rr-shopping-cart"></i>
                            ADD
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

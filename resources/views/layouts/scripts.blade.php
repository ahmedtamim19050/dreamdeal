
<x-alert :exclude="[route('user.update_profile')]" />

<!-- Vendor JS -->
<script src="{{ asset('assets/frontend-assets/js/vendor/jquery-3.5.1.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/vendor/popper.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/vendor/bootstrap.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/vendor/jquery-migrate-3.3.0.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/vendor/modernizr-3.11.2.min.js') }}"></script>

<!--Plugins JS-->

<script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/swiper-bundle.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/countdownTimer.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/nouislider.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/scrollup.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/jquery.zoom.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/slick.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/owl.carousel.min.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/infiniteslidev2.js') }}"></script>
<script src="{{ asset('assets/frontend-assets/js/plugins/click-to-call.js') }}"></script>

<!-- Main Js -->
<!-- <script src="{{ asset('assets/js/filter.js') }}"></script> -->
<script src="{{ asset('assets/frontend-assets/js/vendor/index.js') }}"></script>
<script src="{{ asset('assets/js/star-rating.js') }}"></script>
<script src="cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
    function cartQnty() {
        $.ajax({
            type: 'get',
            url: '/cart-qty',
            success: function(response) {
                console.log(response);

                $('#cartQty').text(response);
                $('#cartQty2').text(response);
                if (response == 0) {
                    $('#cartQty').hide();
                } else {
                    $('#cartQty').show();
                }
            },
            error: function(xhr) {
                // Handle the error response
                console.log(xhr.responseText);
            }
        });
    }

    cartQnty();
    console.log(cartQnty())
    $(document).ready(function() {
        $('.cart-store').click(function() {
            var addToCartBtn = $(this);
            var productId = $(this).data('product-id');
            var quantity = $('.addToCartForm_' + productId).find('.qty').val();
            var oldQty = "{{ Cart::getTotalQuantity() }}";
            var parentDiv = $(this).closest('.ec-product-inner');

            $.ajax({
                type: 'POST',
                url: '/add-cart',
                data: {
                    _token: '{{ csrf_token() }}',
                    product_id: productId,
                    quantity: quantity
                },
                success: function(response) {
                    // Handle the success response
                    console.log(response);
                    cartQnty();
                    addToCartBtn.attr('disabled', true);
                    parentDiv.find('.fi-rr-shopping-basket').addClass('text-success').attr(
                        'disabled', true);
                    parentDiv.find('#addToCartBtn').text('added').attr('disabled', true);

                },
                error: function(xhr) {
                    // Handle the error response
                    console.log(xhr.responseText);
                }
            });
        });
    });
</script>

<script>
    function quickView(id) {

        $.ajax({
            url: '/quickview',
            method: 'GET',
            data: {
                product_id: id
            },
            success: function(response) {
                $('#ec_quickview_modal').modal('show')
                $('#quick_view').html(response)
            },

        });
    }
</script>


<script>
    function wishlist(id) {

        $.ajax({
            url: '/wishlist/add',
            method: 'GET',
            data: {
                productId: id
            },
            success: function() {
                var element = $('.add-wish-new_' + id);
                if (element.hasClass('fa-solid')) {
                    element.addClass('fa-regular').removeClass('fa-solid text-success');
                } else {
                    element.addClass('fa-solid text-success').removeClass('fa-regular ');
                }


            }

        });
    }
</script>

<script>
    var shopUrl = "{{ route('shops') }}";

    $(document).ready(function() {
        $('#ratingForm input[type="checkbox"]').on('change', function() {
            if ($(this).is(':checked')) {
                updateSearchParams("ratings", $(this).val(), shopUrl);
            } else {
                removeSearchParam("ratings", shopUrl);
            }
        });

        $("#price-slider").slider({
            range: true,
            min: {{ request()->has('priceMin') ? request('priceMin') : 0 }},
            max: {{ request()->has('priceMax') ? request('priceMax') : 1000 }},
            values: [0, 1000],
            slide: function(event, ui) {
                $("#minPriceDisplay").text(ui.values[0]);
                $("#maxPriceDisplay").text(ui.values[1]);
            },
            stop: function(event, ui) {
                updateSearchParams('', '', shopUrl, ui.values[0], ui.values[1]);
            }
        });

        // Display initial price values
        $("#minPriceDisplay").text($("#price-slider").slider("values", 0));
        $("#maxPriceDisplay").text($("#price-slider").slider("values", 1));
    });

    function updateSearchParams(searchParam, searchValue, route, priceMin, priceMax) {
        var url;
        console.log(searchValue);

        if (window.location.pathname !== "/shops" || (new URL(route)).pathname == '/vendors') {
            url = new URL(route);
        } else {
            url = new URL(window.location.href);
        }

        url.searchParams.set(searchParam, searchValue);

        // Set the price range parameters if provided
        if (priceMin !== undefined) {
            url.searchParams.set('priceMin', priceMin);
        }

        if (priceMax !== undefined) {
            url.searchParams.set('priceMax', priceMax);
        }

        var existingParams = new URLSearchParams(window.location.search);
        existingParams.delete(searchParam);

        // Remove existing price range parameters
        existingParams.delete('priceMin');
        existingParams.delete('priceMax');

        existingParams.forEach(function(value, key) {
            url.searchParams.set(key, value);
        });

        var newUrl = url.href;
        window.location = newUrl;
    }

    function removeSearchParam(searchParam, route) {
        var url;

        if (window.location.pathname !== "/shops" || (new URL(route)).pathname == '/vendors') {
            url = new URL(route);
        } else {
            url = new URL(window.location.href);
        }

        var existingParams = new URLSearchParams(window.location.search);
        existingParams.delete(searchParam);

        var newUrl = url.href.split('?')[0] + '?' + existingParams.toString();
        window.location = newUrl;
    }
</script>


<script>
    $("#product_rating").rating({
        showCaption: true
    });
    $(".published_rating").rating({
        showCaption: false,
        readonly: true,
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

@yield('js')

<script>
    $(document).ready(function() {
        $('.toast').toast('show');
    })
    $('.toast_close').click(function() {
        $('.toast').toast('hide');
    })
</script>
@if (session()->has('subscribeEmail'))
    <script>
        var dataValue = true;
        ecCreateCookie('ecPopNewsLetter', dataValue, 1);
    </script>
@endif
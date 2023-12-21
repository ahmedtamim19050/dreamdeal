@extends('layouts.app')
@section('content')
    <x-app.header />
    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="section-title">
                        {{-- <h2 class="ec-bg-title">Log In</h2> --}}

                        <h2 class="ec-title">2nd Step Verification <span class="text-success">AhroMart</span> </h2>
                        <p class="sub-title mb-3">{{ __('Register as vendor') }}</p>
                    </div>
                </div>

                <div class="ec-login-wrapper" style="max-width: 730px;">
                    <div class="d-flex justify-content-center text-center mb-4">
                        <div class="card col-md-11 bg-danger text-white">
                            <div class="card-body">

                                <span>Monthly payout of $24.5 from a store</span>
                            </div>
                        </div>
                   


                    </div>
                    <div class="ec-login-container" style="border: none">
                        <div class="ec-login-form">
                            <form method="POST" action="{{ route('vendor.second.step.store') }}"
                                enctype="multipart/form-data">
                                @csrf
                                <label for="">Personal Info</label>
                                <fieldset class="border p-3">
                                    <div class="row">

                                        <span class="ec-login-wrap col-md-6">
                                            <label for="phone">Phone<span class="text-danger">*</span></label>
                                            <input id="phone" type="text" placeholder="Phone"
                                                class="form-control bg-light @error('phone') is-invalid @enderror"
                                                name="phone" value="{{ old('phone') ?? '' }}" required
                                                autocomplete="phone" autofocus>

                                            @error('phone')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                        <span class="ec-login-wrap col-md-6">
                                            <label for="birth_date">Date Of Birth<span class="text-danger">*</span></label>
                                            <input id="birth_date" type="date" id="dob"  max="2003-05-29" placeholder="Date Of Birth"
                                                class="form-control bg-light @error('dob') is-invalid @enderror"
                                                name="dob" value="{{ old('dob') ?? '' }}" required
                                                autocomplete="birth_date" autofocus>

                                            @error('dob')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                    </div>
                                    <div class="row">

                                        <span class="ec-login-wrap col-md-12">
                                            <label for="tax_no">Employer identification number (EIN) <span
                                                    class="text-danger">*</span></label>
                                            <input id="tax_no" type="text"
                                                placeholder="Leave blank if you don't have an EIN number."
                                                class="form-control bg-light @error('tax_no') is-invalid @enderror"
                                                name="tax_no" value="{{ old('tax_no') ?? '' }}" autocomplete="phone"
                                                autofocus>

                                            @error('tax_no')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                    </div>




                                    <div class="row mt-3">
                                        <p>Please provide a valid government ID for identify verification</p>
                                        <span class="ec-login-wrap col-md-6">
                                            <label for="govt_id_front">ID Front side <span
                                                    class="text-danger">*</span></label>
                                            <input id="govt_id_front" type="file"
                                                class="form-control bg-light @error('govt_id_front') is-invalid @enderror"
                                                name="govt_id_front" value="{{ old('govt_id_front') ?? '' }}" required
                                                autofocus>

                                            @error('govt_id_front')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                        <span class="ec-login-wrap col-md-6">
                                            <label for="govt_id_back">ID Back side <span
                                                    class="text-danger">*</span></label>
                                            <input id="govt_id_back" type="file" multiple
                                                placeholder="One Government ID for verification"
                                                class="form-control bg-light @error('govt_id_back') is-invalid @enderror"
                                                name="govt_id_back" value="{{ old('govt_id_back') ?? '' }}" required
                                                autofocus>

                                            @error('govt_id_back')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                    </div>
                                </fieldset>
                                <label for="" class="mt-3">Bank Info</label>
                                <fieldset class="border p-3 mt-2">
                                <legend class="text-primary" style="font-size: 15px; font-weight:600;">This info will be used to send sales earnings</legend>
                                    <div class="row">
                                      
                                        <span class="ec-login-wrap col-md-12">
                                            <label for="paypal_email">Paypal Email<span class="text-danger">*</span></label>
                                            <input id="paypal_email" type="text" placeholder="Paypal Email"
                                                class="form-control bg-light @error('paypal_email') is-invalid @enderror"
                                                name="paypal_email" value="{{ old('paypal_email') ?? '' }}" required
                                                autocomplete="paypal_email" autofocus>

                                            @error('paypal_email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                           

                             


                                        <span class="ec-login-wrap col-md-12 ">
                                            <label for="paypal_email_confirmation">Confirm paypal email<span class="text-danger">*</span></label>
                                            <input id="paypal_email_confirmation" type="text"
                                                placeholder="Confirm Email"
                                                class="form-control bg-light @error('paypal_email_confirmation') is-invalid @enderror"
                                                name="paypal_email_confirmation" value="{{ old('paypal_email_confirmation') ?? '' }}"
                                                required autocomplete="paypal_email_confirmation" autofocus>

                                            @error('paypal_email_confirmation')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror

                                        </span>
                         


                               
                                  
                                    </div>
                                </fieldset>
                                <label class="mt-3" for="">Shop address</label>
                                <fieldset class="border p-3 my-2">
                                    <div class="row">
                                        <span class="ec-login-wrap col-md-6">
                                            <label for="inputCity">Country<span class="text-danger">*</span></label>
                                            <x-country />
                                        </span>

                                        <span class="ec-login-wrap col-md-6">
                                            <label for="inputState" class="form-label">State<span
                                                    class="text-danger">*</span></label>
                                            <x-state />
                                            @error('state')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                        <span class="ec-login-wrap col-md-6">
                                            <label for="inputCity" class="form-label mt-2">City<span
                                                    class="text-danger">*</span></label>
                                            <input type="text"
                                                class="form-control @error('city') is-invalid @enderror bg-light"
                                                value="{{ auth()->user()->shop ? auth()->user()->shop->city : ' ' }}"
                                                name="city" id="city" required>
                                            @error('city')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                        <span class="ec-login-wrap col-md-6">
                                            <label for="inputZip" class="form-label">Zip</label>
                                            <input type="text" placeholder="post code"
                                                class="form-control bg-light p-2  @error('post_code') is-invalid @enderror"
                                                value="{{ auth()->user()->shop ? auth()->user()->shop->post_code : ' ' }}"
                                                name="post_code" id="post_code" required>
                                            @error('post_code')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>
                                        <span class="ec-login-wrap col-md-12">

                                            <label class="mt-2" for="address">Street address<span
                                                    class="text-danger">*</span></label>
                                            <textarea id="address" placeholder="Address"
                                                class="form-control mb-3 bg-light @error('address') is-invalid @enderror" name="address" required>{{ old('address') ?? '' }}</textarea>

                                            @error('address')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </span>



                                    </div>
                                </fieldset>
                                <label class="mt-3" for="">Credit/Debit card</label>
                                <fieldset class="border p-3 my-2">
                                <input id="card-holder-name" type="hidden" value="{{ auth()->user()->name }}">
                                <input name="payment_method" id="card-payment-method" type="hidden">



                                <!-- Stripe Elements Placeholder -->
                                <div class="form-group">
                                    <label for="card_info">Provide a valid Credit or Debit card to pay for monthly subscription.
<span class="text-danger">*</span></label>
                                    <div id="card-element" class="form-control bg-light"></div>
                                </div>
                                <p class="mb-2">This card will be take monthly payment every month</p>
                                <p class="text-primary">Each and every merchant must consent to having autopay enabled. At any moment, you are free to deactivate your shop or cancel your membership.</p>
                                <div class="d-flex" style="height: 40px;">

                                <input type="checkbox" required class="@error('ismonthly_charge') is-invalid @enderror"id="ismonthly_charge" style="width: 25px;" value="1" name="ismonthly_charge"><a
                                    href="#" style="" class="mt-3 ms-3">Auto pay</span>
                                    @error('ismonthly_charge')
                                    <span class="invalid-feedback " role="alert">
                                    <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                    </div>  
                            
                                <button id="card-button" type="button" class="mt-2 px-3"
                                    style="padding:10px;background-color:red;color:white"
                                    data-secret="{{ $intent->client_secret }}">
                                    Verify
                                </button>
                                
                                </fieldset>



                                <div class="d-flex">

                                    <input type="checkbox" required class="@error('terms') is-invalid @enderror"
                                        id="terms" style="width: 25px;" value="1" name="terms"><a
                                        href="#" style="" class="mt-4 ms-3 ">I have
                                        read and agree to the <span>Terms &amp; Conditions</span></a><span
                                        class="checked"></span>
                                    @error('terms')
                                        <span class="invalid-feedback " role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <span class="ec-login-wrap ec-login-btn">
                                    <div class="col-md-12 ">
                                        <button type="submit" id="submit" disabled
                                            class="btn btn-dark rounded rounded-4">
                                            Submit
                                        </button>

                                </span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('js')
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script src="https://js.stripe.com/v3/"></script>

    <script>
        var verified = false;
        const stripe = Stripe("{{ env('STRIPE_KEY') }}");

        const elements = stripe.elements();
        const cardElement = elements.create('card');

        cardElement.mount('#card-element');
        const cardHolderName = document.getElementById('card-holder-name');
        const cardButton = document.getElementById('card-button');
        const clientSecret = cardButton.dataset.secret;

        cardButton.addEventListener('click', async (e) => {
            console.log('clicked')
            const {
                setupIntent,
                error
            } = await stripe.confirmCardSetup(
                clientSecret, {
                    payment_method: {
                        card: cardElement,
                        billing_details: {
                            name: cardHolderName.value
                        }
                    }
                }
            );

            if (error) {
                console.log(error);
                {{-- document.getElementById('card-payment-method').value = error.setupIntent.payment_method; --}}
                toastr.error(error.message)
            } else {
                document.getElementById('card-button').style.display = "none";
                document.getElementById('submit').disabled = false;
                document.getElementById('card-payment-method').value = setupIntent.payment_method;
                toastr.info('Payment method is verified')
            }
        });
    </script>
@endsection

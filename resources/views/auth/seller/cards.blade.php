@extends('layouts.seller-dashboar')
@section('dashboard-content')
    <div class="ec-shop-rightside col-lg-9 col-md-12">
        <div class="ec-vendor-dashboard-card space-bottom-30">
            <div class="ec-vendor-card-header">
                <h5>Subscriptions </h5>


            </div>

<div class="container mt-4">
    <form id="cardAddFrom" class="" action="{{route('user.card.add')}}" method="POST">
        @csrf
        <div class="row justify-content-between">
            <div class="ec-checkout-leftside col-md-12 ">
                <!-- checkout content Start -->
                <div class="ec-checkout-content">
                    <div class="ec-checkout-inner">
                        <div class="ec-checkout-wrap margin-bottom-30">

                            <div class="ec-checkout-block ec-check-login">
                                <div class="">
                                    <div class="accordion" id="accordionExample">

                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button class="accordion-button h5 text-dark" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseOne"
                                                    aria-expanded="true" aria-controls="collapseOne">
                                                    Add a new card ?
                                                </button>
                                            </h2>
                                            <div id="collapseOne" class="accordion-collapse collapse show"
                                                aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <input id="card-holder-name" type="hidden"
                                                        value="{{ auth()->user()->name }}">

                                                            <input class=" " type="hidden"
                                                            id="paymentmethod" name="payment_method" value="">

                                                        
                                                    <!-- Stripe Elements Placeholder -->
                                                    <div id="card-element"></div>
                                                    <div class="">



                                                        <!-- Stripe Elements Placeholder -->
                                                        <div id="card-element"></div>
                                                        <div class="row">
                                                          
                                                            <div class="col-md-6" style="margin-top: 15px; ">
                                                                <button class="btn  btn-dark btn-lg rounded shadow"
                                                                    style="border-radius: 10px" type="button"
                                                                    id="card-button"
                                                                    data-secret="{{ $intent->client_secret }}">Add</button>
                                    
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

    </form>
</div>
@php
$methods = auth()
->user()
->paymentMethods();
@endphp
<div class="row">

@foreach ($methods as $payment)
<div class="col-md-6 col-12 mb-3">
    <div class="card rounded shadow ">
        <div class="card-body ">
            <h2>{{ ucwords($payment->card->brand) }}</h2>

            <div class="d-flex justify-content-between">

                <h5 style="float:right"> XXXX XXXX
                    XXXX
                    {{ $payment->card->last4 }}</h5>
                <h5>
                    {{ $payment->card->exp_month }}/{{ $payment->card->exp_year }}
                </h5>
            </div>
            <p>
                {{ $payment->billing_details->name }}
            </p>
        </div>

        <div class="card-footer">
            @if (auth()->user()->getCard() && auth()->user()->getCard()->id == $payment->id)
                
                    <span class="text-success btn">Default</span>
                
            @else
                <a href="{{ route('user.setCardAsDefault', ['method' => $payment->id]) }}"
                    class="text-primary btn">Set as default</a>
            @endif

            <a href="{{ route('user.removeCard', ['method' => $payment->id]) }}"
                class="text-danger btn" style="float:right">Remove</a>
        </div>
    </div>

</div>
@endforeach
</div>
    <h3 class="text-center mt-5 mb-3">Cancelation</h3>
            <div class="row mb-4">
                <div class="col-md-6 col-12">
                    <div class="card rounded shadow ">
                        <div class="card-body">
                            <h6>Cancel your Monthly Subscription</h6>
                            <span>Your subscription won't be renewed if you cancel your Subscription.</span>

                            <div class="d-flex justify-content-end">
                                @if ($status == true)
                                <a href="{{ route('vendor.cancelSubscription') }}" onclick="return confirm('Are you sure you want to cancel the subscription? Your subscription will be canceled after the billing cycle');" class="btn btn-warning">Cancel</a>
                                @else
                                <a href="{{ route('vendor.resumeSubscription') }}" onclick="return confirm('Do you want to resume your subscription?');" class="btn btn-warning">Resume</a>
                                @endif
                            </div>


                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-12">
                    <div class="card rounded shadow ">
                        <div class="card-body">
                            <h6>Deactivate your Shop</h6>
                            <span>Your Shop will be Deactivated. You won't be able to access any vendor
                                feature.</span>
                            <div class="d-flex justify-content-end">
                                <a href="{{ route('vendor.cancelSubscriptionNow') }}" onclick="return confirm('Are you sure you want Deactived your shop?');" class="btn btn-danger bg-danger">Deactivate</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
</div>
</div>
@endsection
@section('js')
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script src="https://js.stripe.com/v3/"></script>

<script>
const stripe = Stripe("{{ env('STRIPE_KEY') }}");

const elements = stripe.elements();
const cardElement = elements.create('card');

cardElement.mount('#card-element');

const cardHolderName = document.getElementById('card-holder-name');
const cardButton = document.getElementById('card-button');
const clientSecret = cardButton.dataset.secret;

cardButton.addEventListener('click', async (e) => {
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
if (error?.setupIntent) {
document.getElementById('paymentmethod').value = error.setupIntent.payment_method
toastr.success('Card added');
} else {
toastr.error('Something went wrong. Try again letter');
}

} else {
document.getElementById('paymentmethod').value = setupIntent.payment_method
toastr.success('Card added');
$('#cardAddFrom').submit();
}
});

</script>
@endsection
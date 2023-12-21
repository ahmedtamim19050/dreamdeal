<?php

namespace App\Http\Controllers;

use App\Mail\VerifyEmail;
use App\Models\Address;
use App\Models\Notification;
use App\Models\Offer;
use App\Models\User;
use App\Models\Product as ProductModel;
use App\Models\Shop;
use App\Models\Verification;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use PhpParser\Node\Stmt\Return_;
use Stripe\Price;
use Stripe\Product;
use Stripe\Stripe;
use Illuminate\Support\Str;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    // public function index()
    // {
    //     return view('home');
    // }

    public function againVerifyEmail()
    {
        $verify_token = Str::random(20);
        $user = auth()->user();
        Mail::to($user->email)->send(new VerifyEmail($user, $verify_token));
        return back()->with('success_msg', 'Resend email send successfully send');
    }

    public function verifyEmail()
    {
        $user = Auth()->user();
        $user->update([
            'remember_token' => request('token'),
            'email_verified_at' => now(),
        ]);
        return redirect()->route('vendor.second.step');
    }
    public function verifyMassage()
    {
        return view('verify_massage');
    }
    public function vendorSecondStep()
    {
        $user = auth()->user();
        return view('auth.seller.second_step', [
            'intent' => $user->createSetupIntent()
        ]);
    }
    public function vendorSecondStepStore(Request $request)
    {


        $data = $request->validate(
            [
                "payment_method" => "required",
                "phone" => "required",
                "dob"  => "required",
                "tax_no" =>  "nullable",
                "address" => "required",
                "terms" => "required",
                "country" => "required",
                "state" => "required",
                "city" => "required",
                "post_code" => "required",
                "govt_id_back" => "required|image|mimes:jpeg,png",
                "govt_id_front" => "required|image|mimes:jpeg,png",
                "paypal_email" => "required",
                'paypal_email_confirmation' => 'required|same:paypal_email',

            ]


        );

        auth()->user()->createOrGetStripeCustomer();
        auth()->user()->addPaymentMethod($data['payment_method']);
        Stripe::setApiKey(env('STRIPE_SECRET'));
        $product = Product::create([
            'name' => 'Basic Plan',
        ]);

        $price = Price::create([
            'product' => $product->id,
            'unit_amount' => 2495,
            'currency' => 'usd',
            'recurring' => [
                'interval' => 'month',
            ],
            'nickname' => 'basic-monthly',
        ]);
        $user = User::find(auth()->id());

        $sub = $user->newSubscription('basic', $price->id);
        if (setting('site.free_trial') == "on") {
            $sub->trialUntil(Carbon::now()->addDays(30));
        }
        $sub->create($data['payment_method']);
        Verification::create([
            'user_id' => Auth()->id(),
            'phone' => $request->phone,
            'dob' => $request->dob,
            'card_no' => $request->payment_method,
            'govt_id_front' => $request->file('govt_id_front')->store('verifications'),
            'govt_id_back' => $request->file('govt_id_back')->store('verifications'),
            'address' => $request->address,
            'paypal_email' => $request->paypal_email,
            'ismonthly_charge' => $request->ismonthly_charge,

        ]);

        Address::create([
            'country' => $request->country,
            'state' => $request->state,
            'city' => $request->city,
            'post_code' => $request->post_code,
            'user_id' => auth()->id(),
            'address_1' => $request->address,
            'phone' => $request->phone,
        ]);
        return redirect()->route('vendor.shop')->with('success_msg', 'Thanks for your informations');
    }
    public function offer(ProductModel $product, Request $request)
    {
        if ($product->sale_price) {
            $price = $product->sale_price;
        } else {
            $price = $product->price;
        }
        if ($request->price < $price) {
            Offer::create([
                'price' => $request->price,
                'qty' => $request->qty,
                'product_id' => $product->id,
                'shop_id' => $product->shop_id,
                'user_id' => Auth()->id(),
            ]);
            $this->notification(Auth()->id(), $product->shop_id);
            return redirect()->back()->with('success_msg', 'Offer create successfull ');
        } else {
            return back()->withErrors('Sorry! your price greater then product price');
        }
    }

    protected function notification($user, $shop)
    {
        Notification::create([
            'url' => env('APP_URL') . '/vendor/dasboard/offers',
            'title' => 'Offer Created',

            'shop_id' => $shop,
        ]);
    }

    public function shopActive(Shop $shop)
    {
        if ($shop->status == 0) {
            $shop->update([
                'status' => true,
            ]);
        } else {
            $shop->update([
                'status' => false,
            ]);
        }
        return back()->with([
            'message'    => "Shop Action create",
            'alert-type' => 'success',
        ]);
    }

    public function freeforlife(Shop $shop)
    {
        try {
            if ($shop->user->ffl == 0) {
                $shop->user->cancelSubscriptionNow();
                $shop->user->update([
                    'ffl' => true,
                ]);
            } else {
                $shop->user->update([
                    'ffl' => false,
                ]);
            }
            return back()->with([
                'message'    => "Shop is now free",
                'alert-type' => 'success',
            ]);
        } catch (Exception $e) {
            return back()->with([
                'message'    => $e->getMessage(),
                'alert-type' => 'error',
            ]);
        }
    }

}

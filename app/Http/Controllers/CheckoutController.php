<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Mail\OrderPlaced;
use App\Models\Address;
use App\Models\Notification;
use Sohoj;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\User;
use Cart;
use Error;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Voyager;

class CheckoutController extends Controller
{
    public function store(Request $request)
    {

        $request->validate([
            'prevoius_address' => ['required'],
            'first_name' => ['required', 'max:40'],
            'last_name' => ['required', 'max:40'],
            'email' => ['required', 'max:40', 'email'],
            'terms' => ['required'],
            'payment_method' => 'required'
        ], [
            'prevoius_address.required' => 'You need to set a address first  by clicking "Add Address" bellow'
        ]);

         auth()->user()->createOrGetStripeCustomer();

        auth()->user()->addPaymentMethod($request->payment_method[0]);
        $address = Address::find($request->prevoius_address);

        $shipping = [
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'address_1' => $address->address_1,
            'address_2' => $address->address_2,
            'city' => $address->city,
            'post_code' => $address->post_code,
            'country' => $address->country,
            'state' => $address->state,
            'phone' => $address->phone,
            'shipping_method' => null,
            'shipping_url' => null,
        ];

        if ($this->productsAreNoLongerAvailable()) {

            return back()->withErrors('Sorry! One of the items in your cart is no longer Available!');
        }
        // try {
            DB::beginTransaction();
            $platform_fee = Sohoj::flatCommision(Cart::getSubTotal());
            $total = (Cart::getSubTotal() + $platform_fee + Sohoj::shipping()) - Sohoj::discount();

            $order = Order::create([
                'user_id' => auth()->user() ? auth()->user()->id : null,
                'shop_id' => null,
                'product_id' => null,
                'shipping' => json_encode($shipping),
                'aptment' => $request->aptment,
                'subtotal' => Cart::getSubTotal(),
                'discount' => Sohoj::round_num(Sohoj::discount()),
                'discount_code' => Sohoj::discount_code(),
                'tax' => null,
                'shipping_total' => Sohoj::round_num(Sohoj::shipping()),
                'platform_fee' => $platform_fee,
                'total' => Sohoj::round_num($total),
                'quantity' => null,
                'vendor_total' => null,
                'payment_method' => $request->payment_method[0],
            ]);
            
            foreach (Cart::getContent() as $item) {
                OrderProduct::create([
                    'quantity' => $item->quantity,
                    'order_id' => $order->id,
                    'product_id' => $item->model->id,
                    'price' => $item->price,
                    'total_price' => $item->price * $item->quantity,
                    'variation' => $item->model->variations,
                    'shop_id' => $item->model->shop_id,
                ]);
                $childOrder=Order::create([
                    'user_id' => auth()->user() ? auth()->user()->id : null,
                    'parent_id'=>$order->id,
                    'shop_id' => $item->model->shop_id,
                    'product_id' => $item->id,
                    'shipping' => json_encode($shipping),
                    'aptment' => $request->aptment,
                    'subtotal' => $item->price * $item->quantity,
                    'discount' => null,
                    'discount_code' => null,
                    'tax' => null,
                    'shipping_total' =>$item->model->shipping_cost,
                    'platform_fee' =>Sohoj::flatCommision($item->price) ,
                    'total' => Sohoj::round_num(($item->price * $item->quantity) + $item->model->shipping_cost),
                    'quantity' => $item->quantity,
                    'vendor_total' => $item->model->vendor_price * $item->quantity,
                    'payment_method' => $request->payment_method[0],
                    'product_price'=>$item->price,
                ]);
                OrderProduct::create([
                    'quantity' => $item->quantity,
                    'order_id' => $childOrder->id,
                    'product_id' => $item->model->id,
                    'price' => $item->price,
                    'total_price' => $item->price * $item->quantity,
                    'variation' => $item->model->variations,
                    'shop_id' => $item->model->shop_id,
                ]);

            }

            $payment = auth()->user()->charge(($order->total * 100), $request->payment_method[0]);
            if ($payment->status == 'succeeded') {
                $order->transaction_id = $payment->id;
                $order->status = 1;
                $order->save();
                $childOrders = $order->childs;
                foreach ($childOrders as $childOrder) {
                    $childOrder->update(['status' => 1]);
                    Mail::to($childOrder->shop->email)->send(new OrderPlaced($childOrder));
                }
                Mail::to($order->user->email)->send(new OrderPlaced($order));
                $this->decreaseQuantities();
                DB::commit();
                Cart::clear();
                session()->forget('discount');
                session()->forget('discount_code');
                return redirect('/thankyou')->with('thank', 'Order Created successfully!');
            } else {
                throw (new Exception('Something wrong with payment method'));
            }
            // if ($parent) {

            //     $data['parent_id'] = $parent->id;
            //     $order = Order::create($data);
            //     $orderProduct['order_id'] = $order->id;
            //     OrderProduct::create($orderProduct);
            //     Mail::to($request->email)->send(new OrderPlaced($order));
            //     $this->notification(auth()->user() ? auth()->user()->id : null, $data['shop_id']);
            // } else {

            //     $parent = Order::create($data);
            //     $orderProduct['order_id'] = $parent->id;

            //     OrderProduct::create($orderProduct);
            //     $this->notification(auth()->user() ? auth()->user()->id : null, $parent->shop->id);
            //     Mail::to($request->email)->send(new OrderPlaced($parent));
            // }




            // foreach (Cart::getContent() as $item) {

            // }
            // $payment = auth()->user()->charge(($parent->total * 100), $request->payment_method[0]);
            // if ($payment->status == 'succeeded') {
            //     $parent->transaction_id = $payment->id;
            //     $parent->status = 1;
            //     $parent->save();
            //     $this->decreaseQuantities();
            //     DB::commit();
            //     Cart::clear();
            //     session()->forget('discount');
            //     session()->forget('discount_code');
            //     return redirect('/thankyou')->with('thank', 'Order Created successfully!');
            // } else {
            //     throw (new Exception('Something wrong with payment method'));
            // }
        // } catch (Exception $e) {
        //     DB::rollBack();
        //     return redirect()->back()->withErrors($e->getMessage());
        // } catch (Error $e) {
        //     DB::rollBack();
        //     return redirect()->back()->withErrors($e->getMessage());
        // }
    }

    protected function decreaseQuantities()
    {
        foreach (Cart::getContent() as $item) {
            $product = Product::find($item->model->id);
            $product->increment('total_sale');
            $product->update(['quantity' => $product->quantity - $item->quantity]);
        }
    }
    protected function notification($user, $shop)
    {
        Notification::create([
            'url' => env('APP_URL') . '/vendor/dashboard/orders/index',
            'title' => 'Order Created',
            'shop_id' => $shop,
        ]);
    }

    protected function productsAreNoLongerAvailable()
    {
        foreach (Cart::getContent() as $item) {
            $product = Product::find($item->model->id);
            if ($product->quantity < $item->quantity) {
                return true;
            }
        }
        return false;
    }
    public function userAddress(Request $request)
    {

        Address::create([
            'address_1' => $request->address_1,
            'address_2' => $request->address_2,
            'country' => $request->country,
            'state' => $request->state,
            'city' => $request->city,
            'post_code' => $request->post_code,
            'user_id' => auth()->id(),
        ]);
        return redirect()->back()->with('success_msg', 'Address create successfull ');
    }
}

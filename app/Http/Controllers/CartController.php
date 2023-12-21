<?php

namespace App\Http\Controllers;

use App\Models\Offer;
use Illuminate\Http\Request;
use Cart;
use App\Models\Product;
use Darryldecode\Cart\Cart as CartCart;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
	public function add(Request $request)
	{
		$this->cart($request);

		return response()->json(['success' => 'Item has been added to cart']);
	}
	public function update(Request $request)
	{

		Cart::update($request->product_id, array(
			'quantity' => array(
				'relative' => false,
				'value' => $request->quantity
			),
		));
		return back()->with('success_msg', 'Item has been updated!');
	}
	public function destroy($id)
	{
		Cart::remove($id);
		return back()->with('success_msg', 'Item has been removed!');
	}

	public function offerToCart(Request $request)
	{

		$product = Product::find(request('product_id'));
		$offer = Offer::find(request('offer'));
		if ($offer->is_offer == 1) {

			// if ($product->sale_price) {
			// 	$price = ($product->sale_price - $request->offer_price);
			// } else {
			// 	$price = ($product->price - $request->offer_price);
			// }
			$price = request('offer_price');
			Cart::add($product->id, $product->name, $price, request('quantity'), 'is_offer')->associate('App\Models\Product');

			$offer->update([
				'is_offer' => 0,
			]);
			//session()->flash('errors', collect(['Please Check Length,Width,Height,Weight again of this product']));
			return redirect()->route('cart')->with('success_msg', 'Item has been added to cart!');
		} else {
			return redirect(env('APP_URL') . '/product/' . $product->slug)->withErrors('Sorry! Please again Offer send');
		}
	}
	public function cartQty()
	{
		$cartqty = Cart::getTotalQuantity();

		return response()->json($cartqty);
	}

	public function buynow(Request $request)
	{

		$this->cart($request);

		return redirect('/cart')->with('success_msg', 'Item has been updated!');;
	}

	private function cart($request)
	{

		if ($request->variable_attribute) {
		    $variation = json_encode($request->variable_attribute);
			$product = DB::table('products')->where('parent_id', $request->product_id)->whereRaw("JSON_CONTAINS(variations, ?)", [$variation])->first();

			if (!$product) {
				return response()->json(['error' => 'Sorry! This variation is no longer available'], 404);
			}
		} else {
			$product = Product::find($request->product_id);
		}

		if ($product->sale_price) {
			$price = $product->sale_price;
		} else {
			$price = $product->price;
		}


		Cart::add($product->id, $product->name, $price, $request->quantity, 'no_offer')->associate('App\Models\Product');
	}
}

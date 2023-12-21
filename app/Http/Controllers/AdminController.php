<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function orderDetails(Order $order) {
        return view('auth.admin.order.details',compact('order'));
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected $fillable = ['name', 'email', 'review', 'rating', 'product_id','user_id','shop_id'];
}

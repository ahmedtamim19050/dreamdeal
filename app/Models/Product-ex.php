<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function shop()
    {
        return $this->belongsTo(Shop::class);
    }
    public function wishlists()
    {
        return $this->hasMany(Wishlist::class);
    }

    public function discount()
    {
        $discount_amount  = $this->price - $this->sale_price;
        $discount_percantage = ($discount_amount / $this->price) * 100;
        return round($discount_percantage);
    }
    public function prodcats()
    {
        return $this->belongsToMany(Prodcat::class)->withTimestamps();
    }

    public function path()
    {
        return route('product', $this->slug);
    }

    public function scopeFilter($query)
    {
        return $query
            ->when(request()->has('category'), function ($q) {
                return $q->whereHas('prodcats', function ($query) {
                    $query->where('slug', request()->category);
                });
            })
            ->when(request()->has('search'), function ($q) {
                return $q->where(function ($query) {
                    $query->where('name', 'LIKE', '%' . request()->search . '%')
                        ->orWhere('short_description', 'LIKE', '%' . request()->search . '%');
                });
            })
            ->when(request()->has('shop'), function ($q) {
                return $q->whereHas('shop', function ($query) {
                    $query->where('name', request()->shop);
                });
            })
            ->when(request()->has('filter_products') && request()->filter_products == 'price-low-high', function ($q) {
                return $q->orderBy('sale_price', 'asc');
            })
            ->when(request()->has('filter_products') && request()->filter_products == 'price-high-low', function ($q) {
                return $q->orderBy('sale_price', 'desc');
            })
            ->when(request()->has('filter_products') && request()->filter_products == 'most-popular', function ($q) {
                return $q->orderBy('total_sale', 'desc');
            })
            ->orderBy('created_at', 'desc'); // default order
    }
    public function ratings()
    {
        return $this->hasMany(Rating::class)->where('status', 1)->latest();
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Session;

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
    public function parentproduct(){
        return $this->belongsTo(Product::class, 'parent_id', 'id');
    }
    public function path()
    {
        return route('product', $this->slug);
    }
    public function attributes()
    {
      return $this->hasMany(Attribute::class);
    }
    public function subproducts(){
        return $this->hasMany(Product::class, 'parent_id', 'id');
    }
    public function subproductsuser(){
        return $this->hasMany(Product::class, 'parent_id', 'id')->where('price','>', 0)->whereNotNull('variations');
    }
    public function scopeFilter($query)
    {
        //new
        return $query
            ->when(request()->filled('category'), function ($q) {
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
            ->when(request()->has('featured'), function ($q) {
                return $q->where('featured', 1);
            })
            ->when(request()->has('shop'), function ($q) {
                return $q->whereHas('shop', function ($query) {
                    $query->where('name', request()->shop);
                });
            })
            ->when(
                request()->has('ratings'),
                function ($q) {
                    return  $q->whereHas('ratings', function ($q) {
                        $q->where('rating',request()->ratings);
                    });
                }
            )

            ->when(request()->has('filter_products') && request()->filter_products == 'price-low-high', function ($q) {
                return $q->orderBy('price', 'asc');
            })
            ->when(request()->has('filter_products') && request()->filter_products == 'price-high-low', function ($q) {
                return $q->orderBy('price', 'desc');
            })
            ->when(request()->has('filter_products') && request()->filter_products == 'most-popular', function ($q) {
                return $q->orderBy('total_sale', 'desc');
            })
            ->when(request()->has('filter_products') && request()->filter_products == 'trending', function ($q) {
                return $q->orderBy('views', 'desc');
            })
            ->when(request('priceMin') && request('priceMax'),function ($q){
                 return $q->whereBetween('price', [request('priceMin'), request('priceMax')]);
            })
            ->when(Session::has('post_city'), function ($q) {
                $post_city = Session::get('post_city');
                return $q->whereHas('shop', function ($qr) use($post_city) {
                    $qr->where(function($qp) use ($post_city){
                        $qp->whereIn('city',$post_city);
                    });
                });
            })->when(Session::has('state'), function ($q) {
                $state = Session::get('state');
                return $q->whereHas('shop', function ($qr) use($state) {
                    $qr->where('state','like','%'.$state.'%');
                });
            }); 
    }
    public function ratings()
    {
        return $this->hasMany(Rating::class)->where('status', 1)->latest();
    }

    public function setVariationsAttribute($value)
    {
      $this->attributes['variations'] = json_encode($value);
    }
    public function getVariationsAttribute($value)
    {
 
      if ($value) {
        return json_decode($value);
      }
    }
}

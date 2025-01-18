<?php

namespace App;

use App\Model\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductLandingPage extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function landingPageSection(){
        return $this->hasMany(ProductLandingPageSection::class);
    }
    public function product(){
        return $this->belongsTo(Product::class);
    }
}

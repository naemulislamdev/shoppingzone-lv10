<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductLandingPageSection extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function productLandingpage(){
        return $this->belongsTo(ProductLandingPage::class);
    }
}

<?php

namespace App\Model;

use App\Model\Order;
use Illuminate\Database\Eloquent\Model;

class OrderHistory extends Model
{
    protected $casts = [
        'order_id' => 'integer',
        'created_at' => 'datetime',
    ];



    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }


}
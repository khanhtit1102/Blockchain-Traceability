<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductHistory extends Model
{
    use HasFactory;

    public function stage()
    {
        return $this->belongsTo(Stage::class, 'stage_id', 'id');
    }
}

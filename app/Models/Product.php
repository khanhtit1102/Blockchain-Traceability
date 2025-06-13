<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (auth()->check()) {
                $model->created_by = auth()->id();
            }
        });
    }

    public function productHistory()
    {
        return $this->hasMany(ProductHistory::class, 'trace_code', 'trace_code');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}

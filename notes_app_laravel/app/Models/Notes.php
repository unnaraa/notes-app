<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notes extends Model
{
    protected $table = 'notes';

    protected $fillable = [
        'title',
        'deskripsi',
        'image',
        'user_id',
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}

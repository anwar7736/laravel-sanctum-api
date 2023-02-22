<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Str;
class Post extends Model
{
    use HasFactory;

    protected $guarded = [];

    
    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public function comments(){
        return $this->morphMany(Comment::class);
    }

    public function getRouteKeyName(){
        return 'slug';
    }

    
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function users(){
        return $this->belongsToMany(User::class);
    }

    public function permissions(){
        return $this->belongsToMany(Permission::class, 'role_has_permissions');
    }

    public function setNameAttribute($value){
        return $this->attributes['name'] = strtolower($value);
    }    
    
    public function getNameAttribute($value){
        return ucfirst($value);
    }


}

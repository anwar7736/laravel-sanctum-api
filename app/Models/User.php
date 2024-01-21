<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Events\UserCreated;
use App\Events\UserUpdated;
use App\Events\UserDeleted;
use Hash;
use App\ModelActionCauser;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, ModelActionCauser;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'country_id',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

      protected $dispatchesEvents = [
        'created' => UserCreated::class,
        'saved' => UserCreated::class,
        'updated' => UserUpdated::class,
        'deleted' => UserDeleted::class,
    ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make($value);
    }
    
    public function profile(){
        return $this->hasOne(Profile::class);
    }

    public function posts(){
        return $this->hasMany(Post::class);
    }

    public function country(){
        return $this->belongsTo(Country::class);
    }    
    
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
}

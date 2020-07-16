<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticate;

class usuario extends Authenticate
{
    //
    use Notifiable;
    public $timestamps = false;
    protected $table = 'usuario';
    protected $guarded = [];
    protected $hidden = [
        'password', 'remember_token'
    ];
}

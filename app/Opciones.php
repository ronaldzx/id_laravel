<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Opciones extends Model
{
    //
    protected $table = 'opcion';
    protected $hidden = [
        'fecha_creacion', 'url','controlador_id'
    ];
}

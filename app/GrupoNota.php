<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class GrupoNota extends Model
{
    //
    protected $table = "grupo_nota";

    public static function buscarNotasIdXGrupoId($grupoId)
    {
        $respuesta = DB::table('grupo_nota')
        ->select('nota_id')
        ->where('grupo_id', $grupoId)
        ->get()
        ->pluck('nota_id')
        ->toArray();
        return $respuesta;
    }
}

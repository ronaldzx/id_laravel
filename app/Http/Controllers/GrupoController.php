<?php

namespace App\Http\Controllers;

use App\Grupo;
use App\UsuarioGrupo;
use App\Nota;
use Highlight\Autoloader;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GrupoController extends Controller
{
    //
    public function obtenerMisGrupos()
    {
        $usuarioId = Auth::id();
        $UsuarioGrupo = UsuarioGrupo::where('usuario_id', $usuarioId)->get();
        $gruposId = [];
        $notasId = [];
        $gruposNotas = [];
        foreach ($UsuarioGrupo as $key => $value) {
            array_push($gruposId, $value['grupo_id']);
        }
        foreach ($gruposId as $index => $value) {
            $gruposNotas[$index]['grupo'] = Grupo::where('id', $value)->get();
            $notasId = NotaController::buscarNotasIdXGrupoId($value);
            $gruposNotas[$index]['nota'] = Nota::whereIn('id', $notasId)->get();
        }
        return $gruposNotas;
    }
    public function obtenerGrupos()
    {
        $usuarioId = Auth::id();
        $UsuarioGrupo = UsuarioGrupo::where('usuario_id', $usuarioId)->get();
        $gruposId = [];
        foreach ($UsuarioGrupo as $key => $value) {
            array_push($gruposId, $value['grupo_id']);
        }
        return Grupo::whereNotIn('id', $gruposId)->get();
    }

    public function registrarseGrupos(Request $request)
    {
        $usuarioId = Auth::id();
        $usuarioGrupo = new UsuarioGrupo();
        $usuarioGrupo->usuario_id = $usuarioId;
        $usuarioGrupo->grupo_id = $request->id;
        return $usuarioGrupo->save();
    }
    public function salirGrupo(Request $request)
    {
        $usuarioId = Auth::id();
        $grupoId = $request->grupo_id;
        return UsuarioGrupo::where('grupo_id', $grupoId)->where('usuario_id', $usuarioId)->delete();
    }
}

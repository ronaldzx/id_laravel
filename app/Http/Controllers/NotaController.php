<?php

namespace App\Http\Controllers;

use App\Grupo;
use App\GrupoNota;
use App\Nota;
use App\usuario;
use App\UsuarioGrupo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class NotaController extends Controller
{
    //
    public static function buscarNotasIdXGrupoId($grupoId)
    {
        $notas = GrupoNota::buscarNotasIdXGrupoId($grupoId);
        return $notas;
    }

    public function guardarNota(Request $request)
    {
        $usuarios=[];
        $nota = new Nota;
        if ($request->file('imagen')) {
            $guardar = Storage::disk('public')->put('images', $request->file('imagen'));
            $path = asset($guardar);
            $nota->imagen = $path;
        }
        $nota->titulo = $request->titulo;
        $nota->descripcion = $request->descripcion;
        $nota->save();
        if ($nota->save()) {
            $nota_id = $nota->id;
            $grupoNota = new GrupoNota();
            $grupoNota->nota_id = $nota_id;
            $grupoNota->grupo_id = $request->grupo_id;
            if ($grupoNota->save()) {
                $grupo = Grupo::find($grupoNota->grupo_id);
                $usuariosId = UsuarioGrupo::where('grupo_id', $grupoNota->grupo_id)->pluck('usuario_id')
                    ->toArray();
                    foreach($usuariosId as $item){
                        $usuario=usuario::find($item);
                        array_push($usuarios,$usuario->usuario);
                    }
                $contenido = [
                    'grupo' => $grupo->titulo,
                    'nota' => $nota->titulo,
                ];
                SendEmailController::sendMail($usuarios, $contenido);
                return 1;
            }
        }
    }
}

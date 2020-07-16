<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginFormRequest;
use App\Opciones;
use App\RolOpcion;
use App\UsuarioRol;
use App\usuario;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AutenticacionesController extends Controller
{
    public function iniciarSesion(LoginFormRequest $request){
        if (Auth::attempt(['usuario' => $request->usuario, 'password' => $request->password], false))    {
            return response()->json($request->all(),200);
        }else{
            return response()->json(['errors'=>['login' =>['Los datos que ingresaste son incorrectos']]],422);
        }
        
    }
    public function cerrarSesion(){
        if (Auth::user()){
            Auth::logout();
        }        
    }
    public function obtenerMenu(){
        $usuarioId = Auth::id();
        $roles = UsuarioRol::where('usuario_id',$usuarioId)->get(); 
        $rolesId=[];
        $opcionId=[];
        $opciones=[];
        foreach($roles as $index =>$item){
            array_push($rolesId,$item['rol_id']);
        }
        $opcion = RolOpcion::whereIn('rol_id',$rolesId)->distinct('opcion_id')->get();    
        foreach($opcion as $index =>$item){
            array_push($opcionId,$item['opcion_id']);
        }
        $padre = Opciones::whereIn('id',$opcionId)->where('estado',1)->whereNull('padre_id')->orderBy('orden')->get(); 
        $opciones = $padre;
        foreach($padre as $index =>$item){
            $hijo = Opciones::where('padre_id',$item['id'])->where('estado',1)->get();
            $opciones[$index]['hijo'] = $hijo;            
        }    
        return $opciones;
    }
}

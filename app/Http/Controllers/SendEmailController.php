<?php

namespace App\Http\Controllers;

use App\Jobs\SendEmail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class SendEmailController extends Controller
{
    //
    public static function sendMail($usuarios, $contenido)
    {
        return SendEmail::dispatch(
            'Grupo: ' . $contenido['grupo'] . ' - Nota: ' . $contenido['nota'],
            $usuarios
        );
    }
}

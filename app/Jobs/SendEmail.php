<?php

namespace App\Jobs;

use App\Mail\MailClass;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class SendEmail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $titulo;
    protected $email = [];
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($titulo, $email)
    {
        $this->titulo = $titulo;
        $this->email = $email;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $email = new MailClass($this->titulo);
        foreach ($this->email as $usuario) {
            Mail::to($usuario)->send($email);
        }
    }
}

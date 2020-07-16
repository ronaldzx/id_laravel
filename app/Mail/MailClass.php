<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MailClass extends Mailable
{
    use Queueable, SerializesModels;

    protected $titulo;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($titulo)
    {
        $this->titulo = $titulo;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('backend@id.com', 'BackEnd')->subject($this->titulo)
            ->view('mail.mail')
            ->view([
                'titulo' => $this->titulo
            ]);
    }
}

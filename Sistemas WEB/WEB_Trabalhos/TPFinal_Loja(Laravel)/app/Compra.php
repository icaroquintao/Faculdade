<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Compra extends Model
{
    protected $fillable = [
        'usuario_id', 'pago',
    ];

    public function cliente()
    {
        return $this->belongsTo('App\Usuario','usuario_id', 'id');
    }

    public function transacoes()
    {
        return $this->hasMany('App\Transacao');
    }
}

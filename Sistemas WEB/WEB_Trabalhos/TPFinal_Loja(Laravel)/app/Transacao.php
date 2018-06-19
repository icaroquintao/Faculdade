<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transacao extends Model
{
    protected $table = 'transacoes';

    protected $fillable = [
        'compra_id', 'produto_id', 'quantidade', 'cor', 'bordado'
    ];

    public function compra()
    {
        return $this->belongsTo('App\Compra');
    }

    public function produto()
    {
        return $this->belongsTo('App\Produto');
    }
}

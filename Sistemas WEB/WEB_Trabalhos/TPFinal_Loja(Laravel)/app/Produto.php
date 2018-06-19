<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    protected $fillable = [
        'nome', 'preco', 'caminho_imagem', 'tipo_produto_id'
    ];

    public function tipo()
    {
        return $this->belongsTo('App\TipoProduto', 'tipo_produto_id', 'id');
    }
}

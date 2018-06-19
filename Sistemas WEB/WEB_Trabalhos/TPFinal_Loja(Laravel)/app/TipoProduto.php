<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoProduto extends Model
{
    protected $table = 'tipos_produtos';

    protected $fillable = [
        'nome',
    ];

    public function produtos()
    {
        return $this->hasMany('App\Produto', 'tipo_produto_id', 'id');
    }
}

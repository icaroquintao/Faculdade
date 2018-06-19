<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoUsuario extends Model
{

    protected $table = 'tipos_usuarios';

    protected $fillable = [
        'nome'
    ];

    public function usuarios()
    {
        return $this->hasMany('App\Usuario', 'tipo_usuario_id', 'id');
    }
}

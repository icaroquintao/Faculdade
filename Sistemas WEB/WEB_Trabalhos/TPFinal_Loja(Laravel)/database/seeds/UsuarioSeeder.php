<?php

use Illuminate\Database\Seeder;
use App\Usuario;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Usuario::create([
            'nome' => 'Administrador',
            'email' => 'admin@selmabordados.com',
            'senha' => bcrypt('admin'),
            'tipo_usuario_id' => 1,
            'endereco' => 'Seu computador',
            'telefone' => null
        ]);
    }
}

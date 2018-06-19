<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(TipoProdutoSeeder::class);
        $this->call(TipoUsuarioSeeder::class);
        $this->call(UsuarioSeeder::class);
    }
}

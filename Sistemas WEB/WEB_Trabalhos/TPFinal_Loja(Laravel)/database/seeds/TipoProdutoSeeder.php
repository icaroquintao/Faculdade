<?php

use Illuminate\Database\Seeder;
use App\TipoProduto;

class TipoProdutoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        TipoProduto::create([
            'nome' => 'Toalha de banho'
        ]);

        TipoProduto::create([
            'nome' => 'Toalha de rosto'
        ]);

        TipoProduto::create([
            'nome' => 'Banho de prato'
        ]);

        TipoProduto::create([
            'nome' => 'Caminho de mesa'
        ]);

        TipoProduto::create([
            'nome' => 'Fralda de boca'
        ]);
    }
}

<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransacoesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transacoes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('compra_id')->unsigned();
            $table->integer('produto_id')->unsigned();
            $table->integer('quantidade');
            $table->string('cor');
            $table->string('bordado');
            $table->timestamps();

            $table->foreign('compra_id')->references('id')->on('compras')->onDelete('restrict')->onUpdate('cascade');
            $table->foreign('produto_id')->references('id')->on('produtos')->onDelete('restrict')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transacoes');
    }
}

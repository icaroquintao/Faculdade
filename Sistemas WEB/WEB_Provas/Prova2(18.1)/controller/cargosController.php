<?php

namespace Controller;

use Model\cargos;

class cargosController {

  public function goToAreaGeral(){

    include './view/areaGeral.php';
  }

  public function listar(){
    $cargos = new cargos;
    $lista = $cargos->all();
    //var_dump($lista);
    include './view/cargos/lista.php';
  }

}
 ?>

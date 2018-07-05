<?php

namespace Controller;

use Model\registros;
use Model\pessoas;
use Model\cargos;

class registrosController {

  public function listar(){
    $registros = new registros;
    $lista = $registros->all();
    //var_dump($lista);
    include './view/registros/lista.php';
  }

  public function adcregi(){
    $cargos = new cargos;
    $pessoas = new pessoas;
    $lista = $cargos->all();
    $lista2 = $pessoas->all();
    include './view/registros/create.php';
  }

  public function store($request) {
    $registros = new registros;
    $pessoa_id = $request['pessoa_id'];
    $cargo_id = $request['cargo_id'];
    $salario = $request['salario'];
    $horas = $request['horas'];
    $turno = $request['turno'];
    $registros->incluir($pessoa_id,$cargo_id,$salario,$horas,$turno);
    $this->redir();
    }

    private function redir() {
      header("Location: http://localhost:8080/router.php?op=5");
      exit();
    }

}
 ?>

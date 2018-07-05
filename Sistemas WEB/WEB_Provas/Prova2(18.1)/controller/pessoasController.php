<?php

namespace Controller;

use Model\pessoas;

class pessoasController {

  public function listar(){
    $pessoas = new pessoas;
    $lista = $pessoas->all();
    //var_dump($lista);
    include './view/pessoas/lista.php';
  }

  public function goToAreaAdmi(){

    include './view/areaAdministrativa.php';
  }

  public function adcPessoa(){

    include './view/pessoas/create.php';
  }

  public function store($request) {
    $pessoas = new pessoas;
    $nome = $request['nome'];
    $pessoas->incluir($nome);
    $this->redir();
    }

    private function redir() {
      header("Location: http://localhost:8080/router.php?op=3");
      exit();
    }

}
 ?>

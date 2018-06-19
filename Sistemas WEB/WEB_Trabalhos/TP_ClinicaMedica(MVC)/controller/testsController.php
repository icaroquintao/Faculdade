<?php

namespace Controller;

use Model\tests;

class testsController {

  public function listar(){

    $tests = new tests;
    session_start();
    $lista = $tests->all($_SESSION['id']);
    session_start();
    $valor = $tests->somaValor($_SESSION['id']);
    session_start();
    $contador = $tests->contador($_SESSION['id']);
    include './view/tests/lista.php';

  }

  public function listarTodos(){
    $tests = new tests;
    $lista = $tests->todos();

    include './view/tests/listaTodos.php';
  }

  public function create() {

    // Exibir a view
    include './view/tests/create.php';
  }


  public function store($request) {
    $tests = new tests;
    $procedimento = $request['id'];
    $data = $request['data'];
    session_start();
    $tests->insert($_SESSION['id'], $procedimento, $data);
    //$this->listar();
    $this->redir();
  }

  private function redir() {
    header("Location: http://localhost:8080");
    exit();
  }
}
 ?>

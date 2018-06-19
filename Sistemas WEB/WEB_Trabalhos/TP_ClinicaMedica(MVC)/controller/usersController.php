<?php

namespace Controller;

use Model\users;

class usersController {


  // Exibir o formulario para insercao da cidade
  public function create() {

    // Exibir a view
    include './view/users/create.php';
  }

  public function store($request) {
    $users = new users;
    $nome = $request['nome'];
    $email = $request['email'];
    $senha = $request['senha'];
    if($nome == '' || $email == '' || $senha == ''){
      print "<script> alert('reveja os campos.'); window.history.go(-1); </SCRIPT>\n";
    }
    $users->insert($nome, $email, $senha);
    //$this->listar();
  }

  private function redir() {
    header("Location: http://localhost:8080");
    exit();
  }

  public function acess() {
    // Exibir a view
    include './view/users/acesso.php';
  }


  public function acesso($request){
    $users = new users;
    $email = $request['email'];
    $senha = $request['senha'];
    $lista = $users->acessa($email, $senha);
    foreach( $lista as $linha ){
    if($linha['type'] == 3){
      session_start();
      $_SESSION['id'] = $linha['id'];
      include './view/users/areacliente.php';
    }elseif ($linha['type'] == 1) {
      session_start();
      $_SESSION['id'] = $linha['id'];
      include './view/users/areaadministrador.php';
    }elseif ($linha['type'] == 2) {
      session_start();
      $_SESSION['id'] = $linha['id'];
      include './view/users/areaoperador.php';
    }
    die();
    }
    print "<script> alert('usuario não encontrado.'); window.history.go(-1); </SCRIPT>\n";
  }

}

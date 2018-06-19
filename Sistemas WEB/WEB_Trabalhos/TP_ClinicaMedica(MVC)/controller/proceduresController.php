<?php

namespace Controller;

use Model\procedures;
use Model\tests;

class proceduresController {

  public function listar(){

    $procedures = new procedures;

    $lista = $procedures->all();

    include './view/procedures/lista.php';

  }

  public function redirect(){
    include './view/procedures/editPrice.php';
  }

  public function alterar($request){
    $procedures = new procedures;
    $id = $request['id'];
    $price = $request['price'];
    $procedures->alterar($id, $price);
    $this->redir();
  }

  public function alterarN($request){
    $procedures = new procedures;
    $id = $request['id'];
    $name = $request['name'];
    $procedures->alterarN($id,$name);
    $this->redir();
  }

  public function redirecionar(){
    include './view/procedures/delete.php';
  }
  public function redirecionarName(){
    include './view/procedures/editName.php';
  }

  public function deletar($request){
    $procedures = new procedures;
    $tests = new tests;
    $id = $request['id'];
    $lista = $tests->buscaProcedimento($id);
      foreach( $lista as $linha ){
        if ($linha['procedure_id'] != ' ') {
          echo "Improssivel deletar o procedimeto";
          die();
        }
      }
    $procedures->remove($id);
    $this->redir();
  }

  // Exibir o formulario para insercao da cidade
  public function create() {

    // Exibir a view
    include './view/procedures/createProcediment.php';
  }

  public function store($request) {
    $procedures = new procedures;
    $nome = $request['nome'];
    $preço = $request['preço'];
    $medico_id = $request['medico_id'];
    $procedures->insert($nome, $preço, $medico_id);
    //$this->listar();
    $this->redir();
  }
  private function redir() {
    header("Location: http://localhost:8080");
    exit();
  }

}
 ?>

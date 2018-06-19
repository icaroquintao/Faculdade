<?php

namespace Controller;

use Model\alunos;

class alunosController {

  public function redirectMenu(){

    include './view/alunos/alunosmenu.php';

  }

  public function redirectBuscaForm(){

    include './view/alunos/formBusca.php';

  }

  public function buscaArea($request){
    $alunos = new alunos;
    $area = $request['busca'];
    $lista = $alunos->all($area);
    include './view/alunos/listarprofessor.php';
    }

    public function buscaProjetos(){
    $alunos = new alunos;
    $lista = $alunos->all2();
    include './view/alunos/listarprojetos.php';
  }

  }
 ?>

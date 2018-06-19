<?php

namespace Controller;

use Model\administrativo;

class administrativoController {

  public function redirectMenu(){

    include './view/administrativo/administrativomenu.php';

  }
  public function redirectAdiciona(){

    $administrativo = new administrativo;
    $lista = $administrativo->all();
    $lista2 = $administrativo->all2();

    include './view/administrativo/Adicionar.php';

  }

  public function buscaAluno(){
    $administrativo = new administrativo;
    $lista = $administrativo->all();
    include './view/administrativo/listarAlunos.php';
  }

  public function buscaProf(){
    $administrativo = new administrativo;
    $lista = $administrativo->all2();
    include './view/administrativo/listarprofessor.php';
    }

    public function store($request) {
      $administrativo = new administrativo;
      $aluno = $request['id_aluno'];
      $professor = $request['id_professor'];
      $titulo = $request['titulo'];
      $semestre = $request['semestre'];
      $ano = $request['ano'];
      if($aluno == '' || $professor == ''|| $titulo == '' || $semestre == '' || $ano == ''){
        print "<script> alert('reveja os campos.'); window.history.go(-1); </SCRIPT>\n";
      }
      $administrativo->insert($aluno, $professor, $titulo, $semestre, $ano);
      $this->redir();
    }

    private function redir() {
      header("Location: http://localhost:8080/router.php?op=4");
      exit();
    }

  }
 ?>

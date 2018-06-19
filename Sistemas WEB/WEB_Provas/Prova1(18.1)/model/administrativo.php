<?php

namespace Model;

use Model\Database;

class administrativo {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function all() {
    $sql = "SELECT * FROM alunos ORDER BY curso ASC, nome ASC";
    return $this->db->query($sql);
  }
  public function all2() {
    $sql = "SELECT * FROM professors ORDER BY area ASC";
    return $this->db->query($sql);
  }

  public function insert($aluno, $professor, $titulo, $semestre, $ano){
    $sql = "INSERT INTO projetos (aluno_id, professor_id, titulo, semestre, ano)
          VALUES ('$aluno', '$professor', '$titulo', '$semestre', '$ano')";

    $this->db->query($sql);
  }
}

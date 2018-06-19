<?php

namespace Model;

use Model\Database;

class alunos {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function all($area) {
    $sql = "SELECT * FROM professors WHERE area LIKE '%$area%' ORDER BY area ASC";
    return $this->db->query($sql);
  }

  public function all2(){
    $sql = "SELECT alunos.nome as nomealuno , projetos.*,professors.nome,area FROM alunos INNER JOIN projetos on alunos.id = projetos.aluno_id
    INNER JOIN professors on professors.id = projetos.professor_id
    ORDER BY ano DESC, semestre DESC, alunos.nome ASC";
    return $this->db->query($sql);
  }
}

<?php

namespace Model;

use Model\Database;

class registros {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function all(){
    $sql = "SELECT pessoas.nome,pessoas.id,turno,cargos.nome as cnome,salario,horas FROM registros
INNER JOIN pessoas ON registros.pessoa_id = pessoas.id
INNER JOIN cargos ON registros.cargo_id = cargos.id ORDER BY cargos.nome, turno, pessoas.nome ASC";
    return $this->db->query($sql);

  }


  public function incluir($pessoa_id,$cargo_id,$salario,$horas,$turno){
      $sql = "INSERT INTO registros(pessoa_id,cargo_id,salario,horas,turno)
            VALUES ('$pessoa_id','$cargo_id','$salario','$horas','$turno')";
      $this->db->query($sql);
    }


}

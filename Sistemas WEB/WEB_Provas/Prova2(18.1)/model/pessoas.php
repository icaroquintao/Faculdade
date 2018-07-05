<?php

namespace Model;

use Model\Database;

class pessoas {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function all(){
    $sql = "SELECT id,nome FROM pessoas ORDER BY nome ASC";
    return $this->db->query($sql);

  }
  public function incluir($nome){
      $sql = "INSERT INTO pessoas(nome)
            VALUES ('$nome')";
      $this->db->query($sql);
    }



}

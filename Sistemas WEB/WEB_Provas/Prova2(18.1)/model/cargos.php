<?php

namespace Model;

use Model\Database;

class cargos {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function all(){
    $sql = "SELECT id,nome FROM cargos ORDER BY nome ASC";
    return $this->db->query($sql);

  }


}

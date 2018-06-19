<?php

namespace Model;

use Model\Database;

class tests {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function all($id) {
    $sql = "SELECT tests.*,procedures.* FROM tests INNER JOIN procedures on tests.procedure_id = procedures.id WHERE tests.user_id = $id ORDER BY name ASC";
    return $this->db->query($sql);
  }

  public function somaValor($id){
    $sql = "SELECT SUM(price) FROM tests INNER JOIN procedures on tests.procedure_id = procedures.id WHERE tests.user_id = $id ";
    return $this->db->query($sql);
  }

  public function contador($id){
    $sql = "SELECT COUNT(tests.id) FROM tests INNER JOIN procedures on tests.procedure_id = procedures.id WHERE tests.user_id = $id ";
    return $this->db->query($sql);
  }

  public function buscaProcedimento($id) {
    $sql = "SELECT procedure_id FROM tests WHERE procedure_id = $id ";
    return $this->db->query($sql);
  }

  public function insert($user, $procedure, $data) {
    $sql = "INSERT INTO tests (user_id, procedure_id, date)
          VALUES ('$user','$procedure','$data')";

    $this->db->query($sql);
  }

  public function todos() {
    $sql = "SELECT tests.*,procedures.price FROM tests INNER JOIN procedures on tests.procedure_id = procedures.id ";

    return $this->db->query($sql);
  }

  

}

<?php

namespace Model;

use Model\Database;

class procedures {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function alterar($id,$price) {
    $sql = "UPDATE procedures SET price = $price WHERE id = $id";

    $this->db->query($sql);
  }

  public function alterarN($id, $name) {
    $sql = "UPDATE procedures SET name = '$name' WHERE id = $id";

    $this->db->query($sql);
  }


  public function all() {
    $sql = "SELECT * FROM procedures ORDER BY name ASC";
    return $this->db->query($sql);
  }

  public function insert($nome, $preço, $id_medico) {
    $sql = "INSERT INTO procedures (name, price, user_id)
          VALUES ('$nome','$preço','$id_medico')";

    $this->db->query($sql);
  }

  public function remove($id){
    $sql = "DELETE FROM procedures WHERE id = $id";
    $this->db->query($sql);
  }

}

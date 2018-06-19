<?php

namespace Model;

use Model\Database;

class users {

  protected $db = null;

  public function __construct() {
    $this->db = Database::getInstance()->getDB();
  }

  public function insert($nome, $email, $senha) {
    $sql = "INSERT INTO users (name, email, password, type)
          VALUES ('$nome','$email','$senha','3')";

    $this->db->query($sql);

  }

  public function acessa($email, $senha){
    $sql = "SELECT id,type FROM users WHERE email='$email' AND password ='$senha'";
      return $this->db->query($sql);

  }


}

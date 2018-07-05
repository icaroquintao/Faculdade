<?php

// Includes - framework
include './model/Database.php';
include './model/cargos.php';
include './model/pessoas.php';
include './model/registros.php';
include './controller/cargosController.php';
include './controller/registrosController.php';
include './controller/pessoasController.php';
// Tratamento das rotas
use Controller\cargosController;
use Controller\pessoasController;
use Controller\registrosController;

$op = $_GET['op'];

// Definição das rotas

if ( $op == 1 ) {
  $cargosController = new cargosController;
  $cargosController->goToAreaGeral();
}
if ( $op == 2 ) {
  $cargosController = new cargosController;
  $cargosController->listar();
}
if ( $op == 3 ) {
  $pessoasController = new pessoasController;
  $pessoasController->listar();
}
if ( $op == 4 ) {
  $pessoasController = new pessoasController;
  $pessoasController->goToAreaAdmi();
}
if ( $op == 5 ) {
  $registrosController = new registrosController;
  $registrosController->listar();
}
if ( $op == 6 ) {
  $pessoasController = new pessoasController;
  $pessoasController->adcPessoa();
}
if ( $op == 7 ) {
  $pessoasController = new pessoasController;
  $pessoasController->store($_POST);
}
if ( $op == 8 ) {
  $registrosController = new registrosController;
  $registrosController->adcregi();
}
if ( $op == 9 ) {
  $registrosController = new registrosController;
  $registrosController->store($_POST);
}

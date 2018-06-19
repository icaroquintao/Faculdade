<?php

// Includes - framework
include './model/Database.php';
include './model/procedures.php';
include './model/users.php';
include './model/tests.php';
include './controller/proceduresController.php';
include './controller/usersController.php';
include './controller/testsController.php';

// Tratamento das rotas
use Controller\proceduresController;
use Controller\usersController;
use Controller\testsController;

$op = $_GET['op'];

// Definição das rotas

if ( $op == 1 ) {
  $proceduresController = new proceduresController;
  $proceduresController->listar();
}
if ( $op == 2 ) {
  $usersController = new usersController;
  $usersController -> create();
}
if ( $op == 3) {
  $usersController = new usersController;
  $usersController -> store($_POST);
}
if ($op == 4) {
  $usersController = new usersController;
  $usersController -> acess();
}
if ($op == 5) {
  $usersController = new usersController;
  $usersController -> acesso($_POST);
}
if ($op == 6) {
  $testsController = new testsController;
  $testsController -> create();
}
if ($op == 7) {
  $testsController = new testsController;
  $testsController -> store($_POST);
}
if ($op == 8) {
  $testsController = new testsController;
  $testsController -> listar();
}
if ($op == 9 ) {
  $proceduresController = new proceduresController;
  $proceduresController->create();
}
if ($op == 10 ) {
  $proceduresController = new proceduresController;
  $proceduresController->store($_POST);
}
if ($op == 11 ) {
  $proceduresController = new proceduresController;
  $proceduresController->redirecionar();
}
if ($op == 12 ) {
  $proceduresController = new proceduresController;
  $proceduresController->deletar($_POST);
}
if ($op == 13) {
  $testsController = new testsController;
  $testsController->listarTodos();
}
if ($op == 14 ) {
  $proceduresController = new proceduresController;
  $proceduresController->redirect();
}
if ($op == 15) {
  $proceduresController = new proceduresController;
  $proceduresController->alterar($_POST);
}
if ($op == 16) {
  $proceduresController = new proceduresController;
  $proceduresController->redirecionarName();
}
if ($op == 17) {
  $proceduresController = new proceduresController;
  $proceduresController->alterarN($_POST);
}

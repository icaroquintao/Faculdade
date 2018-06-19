<?php

// Includes - framework
include './model/Database.php';
include './model/alunos.php';
include './model/administrativo.php';
include './controller/alunosController.php';
include './controller/administrativoController.php';

// Tratamento das rotas
use Controller\alunosController;
use Controller\administrativoController;

$op = $_GET['op'];

// Definição das rotas

if($op == 1){
  $alunosController = new alunosController;
  $alunosController->redirectMenu();
}
if($op == 2){
  $alunosController = new alunosController;
  $alunosController->redirectBuscaForm();
}
if($op == 3){
  $alunosController = new alunosController;
  $alunosController->buscaArea($_POST);
}
if($op == 4){
  $alunosController = new alunosController;
  $alunosController->buscaProjetos();
}
if($op == 5) {
  $administrativoController = new administrativoController;
  $administrativoController->redirectMenu();
}
if($op == 6) {
  $administrativoController = new administrativoController;
  $administrativoController->buscaAluno();
}
if($op == 7) {
  $administrativoController = new administrativoController;
  $administrativoController->buscaProf();
}
if($op == 8) {
  $administrativoController = new administrativoController;
  $administrativoController->redirectAdiciona();
}
if($op == 9) {
  $administrativoController = new administrativoController;
  $administrativoController->store($_POST);
}

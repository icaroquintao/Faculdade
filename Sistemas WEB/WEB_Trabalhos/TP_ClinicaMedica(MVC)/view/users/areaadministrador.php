<html>
  <head>
    <meta charset="utf-8">
    <title>Menu Inicial</title>

    <style>
  .bg-1 {
       background-color:#b3d0e9;
        color: #ffffff;
    }
  </style>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

  </head>
  <body>


    <div class="bg-1">

    <br><br><br><br><br><br><br><br>
        <div class="col-sm-17">
          <div class="text-center">
        <h1>AREA DO ADMINISTRADOR</h1>
      </div>
    </div>
    <br><br><br><br><br><br><br><br>
    <div class="container">
      <div class="row">
        <div class="col-sm-3 text-center" >
          <h1>LISTAR</h1>
          <h3> <center><a href="../router.php?op=13">Listar Exames</a></center></h3>
          <p>Selecione este menu para listar todos os procedimentos existentes</p>
        </div>
        <div class="col-sm-3 text-center">
          <h1>CADASTRAR</h1>
          <h3><center><a href="../router.php?op=9">Incluir Exames</a></center></h3>
          <p>Selecione este menu para registrar um procedimento</p>
        </div>
        <div class="col-sm-3 text-center">
          <h1>ALTERAR</h1>
          <h3><center><a href="../router.php?op=14">Alterar Preço do Exames</a></center></h3>
          <h3><center><a href="../router.php?op=16">Alterar Nome do Exames</a></center></h3>
          <p>Selecione o atributo que deseja alterar</p>
        </div>
        <div class="col-sm-3 text-center">
          <h1>EXCLUIR</h1>
          <h3><center><a href="../router.php?op=11">Excluir Exames</a></center></h3>
          <p>Este menu exclui um procedimento, caso o mesmo não esteja sendo usado</p>
        </div>

      </div>
    </div>

    </div>

  </body>

  </html>

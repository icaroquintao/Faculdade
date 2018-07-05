<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Inserir Procedimentos</title>

    <style>
    .bg-1 {
       background-color:#b3d0e9;
        color: #ffffff;
    }
    </style>

      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

  </head>
  <body class="bg-1">


      <!-- GRID //-->
      <div class="row">

      <div class="col-md-4">
      </div>

      <div class="col-md-6">
        <form method="post" action="router.php?op=7">

          <div class="form-group">
            <label for="nome">Nome da Pessoa:</label>
            <div class="col-sm-10">
            <input type="text" name="nome">
          </div>
        </div>
        <input type="submit" value="Cadastrar"><br><br>
        <input type="reset" value="Limpar">
      </div>
      <br><br>


    </form>
  </div>
</div>
  </body>
</html>

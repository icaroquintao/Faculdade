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
<body>

    <!-- GRID //-->
    <div class="row">

    <div class="col-md-4">
    </div>

    <div class="bg-1">
    <div class="col-md-6">
        <form name="dados" method="post" action="router.php?op=3">

        <div class="form-group">
          <label for="busca">Area:</label>
          <div class="col-sm-10">
          <input type="text" name="busca">
        </div>
      </div>

    <br> <input type="submit" value="Buscar"><br>
    <br> <input type="reset" value="Limpar"> <br>

  </form>
</div>
</div>
</div>

  </body>
</html>

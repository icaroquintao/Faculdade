<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Cadastrar</title>

  <style>
  .bg-1 {
     background-color:#b3d0e9;
      color: #ffffff;
  }
  </style>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <script>
      function validar(){
        if ( document.dados.email.value.length == 0){
            alert('campo de email vazio');
            document.dados.email.focus();
        }
        if ( document.dados.senha.value.length == 0){
          alert('campo de senha vazio');
          document.dados.senha.focus();
        }
        if ( document.dados.nome.value.length == 0){
          alert('campo de Nome vazio');
          document.dados.nome.focus();
        }
    }
    </script>

</head>
<body >


    <!-- GRID //-->
    <div class="row">

    <div class="col-md-4">
    </div>

    <div class="bg-1 col-md-2">
        <form name="dados" method="post" action="router.php?op=3">

        <div class="form-group">
          <label for="nome">Nome:</label>
          <div class="col-sm-10">
          <input type="text" name="nome">
        </div>
      </div>

      <div class="form-group">
        <label for="email">E-mail:</label>
        <div class="col-sm-10">
        <input type="text" name="email">
      </div>
    </div>

    <div class="form-group">
        <label for="senha">Senha:</label>
        <div class="col-sm-10">
        <input type="text" name="senha">
      </div>
    </div>
    <br> <input class="btn-success" type="submit" value="Cadastrar" onclick="validar()"><br>
    <br> <input class="btn-warning" type="reset" value="Limpar"><br>

  </form>
</div>
</div>

  </body>
</html>

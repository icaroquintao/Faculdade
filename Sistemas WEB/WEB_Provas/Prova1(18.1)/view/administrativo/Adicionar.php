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
    <div class="bg-1 col-md-2">
        <form name="dados" method="post" action="router.php?op=9">


          <div class="form-group">
            <div class="col-sm-10">
              <select name="id_aluno">
                <option value="">Selecione o Aluno:</option>
                <!-- Estados //-->
                <?php foreach( $lista as $e ): ?>
                  <option value="<?= $e['id'] ?>"><?= $e['nome'] ?></option>
                <?php endforeach ?>
              </select>
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-10">
            <select name="id_professor">
              <option value="">Selecione o Professor:</option>
              <!-- Estados //-->
              <?php foreach( $lista2 as $e ): ?>
                <option value="<?= $e['id'] ?>"><?= $e['nome'] ?></option>
              <?php endforeach ?>
            </select>
        </div>
      </div>


        <div class="form-group">
          <label for="titulo">Titulo:</label>
          <div class="col-sm-10">
          <input type="text" name="titulo">
        </div>
      </div>

      <div class="form-group">
        <label for="semestre">Semestre:</label>
        <div class="col-sm-10">
        <input type="text" name="semestre">
      </div>
    </div>

    <div class="form-group">
        <label for="ano">Ano:</label>
        <div class="col-sm-10">
        <input type="text" name="ano">
      </div>
    </div>
    <br> <input class="btn-success" type="submit" value="Cadastrar" onclick="validar()"><br>
    <br> <input class="btn-warning" type="reset" value="Limpar"><br>

  </form>
</div>
</div>

  </body>
</html>

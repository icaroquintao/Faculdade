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
        if ( document.dados.senha.value.length == 0){
          alert('campo de Nome vazio');
          document.dados.senha.focus();
        }
    }
    </script>

</head>
<body class="bg-1">


    <!-- GRID //-->
    <div class="row">

    <div class="col-md-4">
    </div>

    <div class="col-md-6">
        <form name="dados" method="post" action="router.php?op=9">

          <div class="form-group">
            <div class="col-sm-10">
              <select name="cargo_id">
                <option value="">Selecione o Cargo:</option>
                <!-- Estados //-->
                <?php foreach( $lista as $e ): ?>
                  <option value="<?= $e['id'] ?>"><?= $e['nome'] ?></option>
                <?php endforeach ?>
              </select>
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-10">
            <select name="pessoa_id">
              <option value="">Selecione o Funcionario:</option>
              <!-- Estados //-->
              <?php foreach( $lista2 as $e ): ?>
                <option value="<?= $e['id'] ?>"><?= $e['nome'] ?></option>
              <?php endforeach ?>
            </select>
        </div>
      </div>

        <div class="form-group">
          <label for="salario">Salario:</label>
          <div class="col-sm-10">
          <input type="text" name="salario">
        </div>
      </div>

      <div class="form-group">
        <label for="horas">Horas:</label>
        <div class="col-sm-10">
        <input type="text" name="horas">
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-10">
      <select name="turno">
        <option value="1">Manhã</option>
        <option value="2">Tarde</option>
        <option value="3">Noite</option>
      </select>
      </div>
    </div>
    <input type="submit" value="Cadastrar" onclick="validar()">
    <input type="reset" value="Limpar">

  </form>
</div>
</div>

  </body>
</html>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Procedimentos</title>

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
      <div class="alert alert-success">
      <strong>Atenção!</strong> Dados Exibidos com sucesso.
    </div>

<div class="table-responsive">
    <table class="table table-bordered table-striped table-hover table-condensed">
      <tr>
        <th>Código</th>
        <th>Nome</th>
      </tr>

      <?php foreach( $lista as $linha ): ?>
      <tr>
        <td><?= $linha['id'] ?></td>
        <td><?= $linha['nome'] ?></td>
      </tr>
    <?php endforeach ?>
    
    </table>
</div>
</div>
  </body>
</html>

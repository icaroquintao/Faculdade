<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Exames</title>

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
        <th>Código Procedimento</th>
        <th>Data</th>
        <th>Preço</th>
        <th>Nome Exame</th>
      </tr>

      <?php foreach( $lista as $linha ): ?>
      <tr>
        <td><?= $linha['procedure_id'] ?></td>
        <td><?= $linha['date'] ?></td>
        <td><?= $linha['price'] ?></td>
        <td><?= $linha['name']?></td>
      </tr>
    <?php endforeach ?>
    <?php foreach( $valor as $linhaval ): ?>
    <tr>
      <td colspan="2">Total a pagar = </td>
      <td colspan="2"><?= $linhaval['SUM(price)'] ?></td>
    </tr>
  <?php endforeach ?>
  <?php foreach( $contador as $linhacnt ): ?>
  <tr>
    <td colspan="2">Quantidade de procedumentos = </td>
    <td colspan="2"><?= $linhacnt['COUNT(tests.id)'] ?></td>
  </tr>
  <?php endforeach ?>

    </table>
</div>
</div>
  </body>
</html>

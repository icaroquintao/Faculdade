
$(document).ready(function(){
  $("input[ name ='imagem']").click(function(){
    if(["sabonete" , "algodao" , "maquina" , "ferramenta"].includes($(this).attr('id'))) {
      alert("resposta correta!");
    }else{
      alert("resposta errada!");
    }
  });

  $("#quadrado").mouseout(function(){
    if($(this).val() == "2"){
      $(this).removeClass("alert alert-danger");
      $(this).addClass("alert alert-success");
      alert("resposta correta!");
    }else{
      $(this).addClass("alert alert-danger");
      alert("resposta errada!");
    }
  });

  $("#circulo").mouseout(function(){
    if($(this).val() == "4"){
      $(this).removeClass("alert alert-danger");
      $(this).addClass("alert alert-success");
      alert("resposta correta!");
    }else{
      $(this).addClass("alert alert-danger");
      alert("resposta errada!");
    }
  });

  $("#retangulo").mouseout(function(){
    if($(this).val() == "3"){
      $(this).removeClass("alert alert-danger");
      $(this).addClass("alert alert-success");
      alert("resposta correta!");
    }else{
      $(this).addClass("alert alert-danger");
      alert("resposta errada!");
    }
  });

  $("#triangulo").mouseout(function(){
    if($(this).val() == "1"){
      $(this).removeClass("alert alert-danger");
      $(this).addClass("alert alert-success");
      alert("resposta correta!");
    }else{
      $(this).addClass("alert alert-danger");
      alert("resposta errada!");
    }
  });



});

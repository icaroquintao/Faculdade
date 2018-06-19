
function calcular(){
  var x = parseFloat(document.calc.amp.value);
  if (document.calc.amp.value.length == 0) {
    window.alert("Informe a Amplitude!");
    document.calc.amp.focus();
  } else if (document.calc.int.value.length == 0) {
    window.alert("Informe o intervalo de tempo!");
    document.calc.altura.focus();
  }
  var y = parseFloat(document.calc.int.value);
  var z = ((Math.log10(x)) + 3 * (Math.log10(8 * y)) - 2.92);
  document.calc.mag.value = z;

  if (document.calc.mag.value < 3.5){
    document.calc.anls.value = "Geralmente não sentido mas gravado";
  }else if(document.calc.mag.value >= 3.5 && document.calc.mag.value < 5.4){
    document.calc.anls.value = "As vezes sentido, raramente causa danos";
  }else if (document.calc.mag.value >= 5.4 && document.calc.mag.value < 6) {
    document.calc.anls.value = "Pode causa pequenos danos a contruiçoes bem feitas e grandes danos as mas planejadas";
  }else if (document.calc.mag.value >= 6 && document.calc.mag.value < 6.9) {
    document.calc.anls.value = "pode ser destrutivo em uma area de até 100km do epicentro";
  }else if (document.calc.mag.value >=6.9 && document.calc.mag.value < 7.9) {
    document.calc.anls.value = "Grande terremoto, pode causar serios danos numa grande faixa";
  }else if (document.calc.mag.value >= 7.9) {
    document.calc.anls.value = "Enorme terremoto. Pode causar muitos danos em muitas areas, mesmo a centenas de km de distancia";
  }


}

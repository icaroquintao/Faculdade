
function calcularIMC(){
  var x = parseFloat(document.calcIMC.peso.value);
  if (document.calcIMC.peso.value.length == 0) {
    window.alert("Informe o peso!");
    document.calcIMC.peso.focus();
  } else if (document.calcIMC.altura.value.length == 0) {
    window.alert("Informe a altura!");
    document.calcIMC.altura.focus();
  }
  var y = parseFloat(document.calcIMC.altura.value);
  var z = x / (y * y);
  document.calcIMC.valorIMC.value = z;
  if (document.calcIMC.valorIMC.value <= 18.5){
    window.alert("Subnutrição!");
  }else if(document.calcIMC.valorIMC.value > 18.5 && document.calcIMC.valorIMC.value < 25){
    window.alert("Peso Saudavel!");
  }else if (document.calcIMC.valorIMC.value >= 25 && document.calcIMC.valorIMC.value < 30) {
    window.alert("Sobrepeso!");
  }else if (document.calcIMC.valorIMC.value >= 30 && document.calcIMC.valorIMC.value < 35) {
    window.alert("Obesidade grau I!");
  }else if (document.calcIMC.valorIMC.value >=35 && document.calcIMC.valorIMC.value < 40) {
    window.alert("Obesidade grau II! (severa)");
  }else if (document.calcIMC.valorIMC.value >= 40) {
    window.alert("Obesidade grau III! (mórbida)");
  }

var k = 18.6 * (y * y);
document.calcIMC.valorMinimo.value = k;
var p = 24.9 * (y * y);
document.calcIMC.valorMaximo.value = p;

}

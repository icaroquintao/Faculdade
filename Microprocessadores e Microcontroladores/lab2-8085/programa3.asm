// 8085 - Lab2 - Segundo Programa
# ORG 2000H
# BEGIN 2000H
	   MVI A,01     //move o valor 01 para o acumulador
	   LXI B,2050   //move o valor para o par BC 2050
	   STAX B       //endereço o valor do par 2050 e adiciono o valor do acumulador
	   
	   MVI D,02    //adiciono o valor 02 no par DE
	   ADD D       //é somado o valor o registrador D ao acumulador
	   LXI H,2050  //move o valor 2050 no par HL 
	   ADD M       //soma o valor do conteúdo do par HL ao acumulador       
	   ADI FF     //é somado mais 1 no valor do acumulador
	   ACI 00     // diminui o valor do acumulador em 1
	   LXI H,0102 //move o valor ao par HL
	   LXI B,0304 //move o valor ao par DC
	   LXI D,0506 //move o valor ao par DE
	   DAD B      //soma o valor do par BC ao par HL e adciona o resultado no par HL
	   DAD D      //soma o valor do par DE ao par HL e adciona o resultado no par HL
	   HLT


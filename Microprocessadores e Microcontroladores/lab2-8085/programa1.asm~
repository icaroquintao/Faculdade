// 8085 - Lab2 - Primeiro Programa
# ORG 2000H
# BEGIN 2000H
	   LXI H,2050    //move o valor 2050 para o par HL
	   MVI M,70     // move o valor do par HL como endereço de memória e adiciona o conteúdo 70
	   MVI A,20    // move o valor 20 para o acumulador
	   STA 2051   //move usa o valor 2050 como endereço de memória e move o conteúdo do acumualdor para ele
	   LHLD 2050 // copio o conteúdo o endereço 2050 para o par HL, em L é substituido pelo conteúdo de memória endereço 
	   MOV M,A     // move o valor A utilizando como endereço de memória o conteúdo do par HL
	   SHLD 2052  // pega o endereço do par HL e transforma em conteúdo, em que primeiro endereça uma região de memória com o valor de L, depois aumenta o valor do operando(aumenta o valor do 2050 para 2053) e adicionar o valor do par H como conteúdo da região enderaçada na memória
	   LXI B,2052 //move o valor para o par BC 
	   LDAX B     // move o conteúdo do par BC para acumulador  
	   MVI A,40   //move o valor para o acumualdor 
	   LXI D,2072 //move o valor para o par DE
	   STAX D     // move o valor do par DE como endereço de memória e adiciona o valor do acumulador
	   XCHG       //troca os valores do par HL com DE
	   HLT


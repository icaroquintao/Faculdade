// 8085 - Lab2 - Segundo Programa
# ORG 2000H
# BEGIN 2000H
	MVI A, 01     //move o valor 01 para o acumulador
	LXI B,2050   //move o valor 2050 ao par BC
	STAX B      //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	MVI A, 02 //move o valor 02 para o acumulaodr
	LXI B,2051 //move o valor 2051 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	
	MVI A, 03  //move o valor 03 para o acumulador
	LXI B,2052 //move o valor 2052 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	MVI A, 04 //move o valor 04 para o acumulador
	LXI B,2053 //move o valor 2053 ao par BC
	STAX B//enderaça o valor do par BC na memória com o contéudo do acumulador
	
	
	MVI A, 05 //move o valor 05 para o acumulador
	LXI B,2054 //move o valor 2054 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	

	MVI A, 06 //move o valor 06 para o acumulador
	LXI B,2080 //move o valor 2080 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	
	MVI A, 07 //move o valor 07 para o acumulador
	LXI B,2081 //move o valor 2080 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	
	MVI A, 08 //move o valor 08 para o acumulador
	LXI B,2082 //move o valor 2082 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	
	MVI A, 09 //move o valor 09 para o acumulador
	LXI B,2083 //move o valor 2083 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	
	
	MVI A, 0A //move o valor 0A para o acumulador
	LXI B,2084 //move o valor 2084 ao par BC
	STAX B //enderaça o valor do par BC na memória com o contéudo do acumulador
	

	LXI D, 2050 //move o valor 2050 para o par DE
	LDAX D      //pega o valor da memória do par DE
	
	MOV B,A       // move o valor do registrador b para acumulador
	LXI D, 2080   //carrego o valor no par DE
	LDAX D       //pego o conteúdo do par DE e coloco no acumulador
	ADD B        // somo o valor do registrador B com acumulador
	LXI H, 2090  //Carrego o valor para o par HL 
	MOV M,A      //move o conteúdo do acumulador para o par HL

	LXI D, 2051  //move o valor para o par DE
	LDAX D       //Carrego o conteúdo do enreço do par DE
	MOV B,A      //troco o valor do registrador A com B
	LXI D, 2081  //move o valor para o par DE
	LDAX D       //Carrego o conteúdo do enreço do par DE
	ADD B        //Soma o valor do registrador b com acumulador
	LXI H, 2091  //move para o par HL o valor
	MOV M,A      // move o valor do acumulador no endereço do par HL

	LXI D, 2052  //move o valor para o par DE
	LDAX D       //Carrego o conteúdo do enreço do par DE
	MOV B,A      //troco o valor do registrador A com B
	LXI D, 2082  //move o valor para o par DE
	LDAX D       //Carrego o conteúdo do enreço do par DE
	ADD B        //Soma o valor do registrador b com acumulador
	LXI H, 2092  //move para o par HL o valor
	MOV M,A      // move o valor do acumulador no endereço do par HL

	LXI D, 2053   //move o valor para o par DE
	LDAX D       //Carrego o conteúdo do enreço do par DE
	MOV B,A       //troco o valor do registrador A com B
	LXI D, 2083   //move o valor para o par DE
	LDAX D        //Carrego o conteúdo do enreço do par DE
	ADD B         //Soma o valor do registrador b com acumulador
	LXI H, 2093   //move para o par HL o valor
	MOV M,A       // move o valor do acumulador no endereço do par HL

	LXI D, 2054   //move o valor para o par DE
	LDAX D        //Carrego o conteúdo do enreço do par DE
	MOV B,A       //troco o valor do registrador A com B
	LXI D, 2084   //move o valor para o par DE
	LDAX D        //Carrego o conteúdo do enreço do par DE
	ADD B         //Soma o valor do registrador b com acumulador
	LXI H, 2094  //move para o par HL o valor
	MOV M,A      // move o valor do acumulador no endereço do par HL
	
	
	HLT

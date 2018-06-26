.data

	vetor:					.space 		36
	jogador:				.word  		0
	string_solicita_jogador_inicial:	.asciiz		"Máquina: O, Voce: X\nQuem começara jogando: (1) Voce ou (2) Máquina ?"	
	opcao_do_jogador:			.word 		1
	pedir_posicao_para_jogador:		.asciiz		"\nEntre com a posicao desejada[1 ... 9]: "
	quebra_linha:	.asciiz "\n"
	espaco_branco:	.asciiz " "
	opcao_de_entrada_jogador:		.word		0
	caractere_X:				.asciiz		"X"
	caractere_0:				.asciiz		"O"
	n_quebra_linhas:			.asciiz		"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"		
	pipe:					.asciiz		"|"
	maquina_ganhou:				.asciiz		"\nA maquina ganhou!!!\n\n"
	empate:					.asciiz 	"\nEmpate\n\n"
    opcao_de_jogador_inicial: 			.word 		1

.text
main:

#----------------------------------------------------------------------------------#

	#ZERANDO TODOS OS VALORES DO VETOR


	addi $s0, $zero, 1 # indice 
	addi $t0, $zero, 9 # indice 
	
	#preenche o vetor com 0
	loop_zera_vetor:	
		beq $s0, $t0, exit_zera_vetor
			#carrega o ponteiro da matriz
			la $t2, vetor
			#multiplica i por 4
			sll $t1, $s0, 2
			#soma base do vetor + indice 
			add $t1, $t1, $t2		
			#salva o valor 0, na posicao da matriz
			sw $zero, 0($t1)
		
			#incrementa i
			addi $s0, $s0, 1
	j loop_zera_vetor

exit_zera_vetor:	

#-----------------------------------------------------------------------------------#

	#**************************************************************
	#
	#	Laco de repeticao do jogo, é um laco de reticao que vai ate 9
	#	assim tera uma variavel para controle e um indice
	#
	#	OBS: s0-7 | t0-9
	#**************************************************************


	addi $s7, $zero, 9		# flag necessaria para controle de jogadas
	addi $s6, $zero, 0		#indice i para controle de tentativas

	
	#imprime a string de solicitacao do jogador inicial
        li $v0, 4
        la $a0, string_solicita_jogador_inicial
        syscall
	
	#recebe a opcao
        li $v0, 5
	syscall
	sw $v0, opcao_de_jogador_inicial

	#carrega o valor da opcao em um registrador
	 la $t6, opcao_de_jogador_inicial
	 lw $t6, 0($t6)


	# registrador auxiliar para decidir qual será o primeiro jogador
	addi $t0, $zero, 1 
   	
   	#comparacao para verifica quem comecara jogando
   	#	Se $t6 = 1 -> vá para jogador_primeiro
   	#
   	beq $t0, $t6, jogador_primeiro
   	
   	#
   	#	SE ESTA PARTE ESTA SENDO EXECUTADA 
   	#	A MAQUINA JOGA PRIMEIRO
   	#  

	#declaracao do laco que executa as 9 'possiveis' jogadas
	loop_de_jogadas:
	
		#imprimindo um conjunto de vários '\n'  
		li $v0, 4
		la $a0, n_quebra_linhas
		syscall
	  
	 	#	A funcao que verifica se ha vencedor sera chamada(verifica_vencedor)
	  	# 	É  necessario passar como parametro o vetor com os dados
	  	# 	Esse endereco deve estar no registrador $a0
	  		
	  	#  carregando o vetor com as jogadas no registrador $a0
	  	la $t7, vetor
	  	move $a0, $t7
	  	
	  	#
	  	# 	CHAMA A FUNCAO VERIFICA VENCEDOR,
	  	#	O RETORNO DA FUNCAO ESTARA NO REGISTRADOR $v0
	  	#
	  	jal verifica_vencedor
	  	
	  	# se as 9 iteracoes ja foram realizadas o programa termina
	  	beq $s6, $s7, end
	  	
	  	# verifica se a funcao verifica vencedor nao retornou 0, caso seje diferente de 0, o programa termina 
	  	bne $v0, $zero, end
	  		
	  		#passa o endereco do vetor para a0 , e chama a vez do pc
	  		la $a0,vetor
	  		addi $a1,$zero,1
	  		jal vez_do_pc
	  		
	  		# incrementa jogada para ver se chegou ao fim
	  		addi $s6, $s6, 1
	  		beq $s6, $s7, end
	  		
	  		# carrega o endereco base e chama a vefica vencedor
	  		la $a0,vetor
	  		jal verifica_vencedor
	  		bne $v0, $zero, end
	  		
	  		 #chama a funcao para desenhar 
	  		la $a0,vetor			
	  		jal desenhar
	  			
	  		# chama a funcao que faz o jogador jogar
	  		la $a0,vetor
	  		jal vez_do_jogador
	  	
	  	#incrementa o contador do laco de repeticao
	  	addi $s6, $s6, 1
	  
	  j loop_de_jogadas
	
#
#	Funcao responsavel por veficar se ha vencedor
#		Recebe o vetor de jogadas como parametro 
#



jogador_primeiro:

#declaracao do laco que executa as 9 'possiveis' jogadas
	  loop_de_jogadas_jogador_primeiro:
	  
	  	#carrega o endereco base do vetor para $a0
	  	la $t7, vetor
	  	move $a0, $t7
	  	
	  	#chama a funcao que verifica vencedor
	  	jal verifica_vencedor

	  	#verifica se as 9 jogadas foram executadas
	  	beq $s6, $s7, end
	  	
	  		# verifica se a funcao verifica vencedor nao retornou 0
	  		bne $v0, $zero, end
	  		
	  			#passa o endereco do vetor para a0 , e chama a vez do pc
                		la $a0,vetor
	  			jal vez_do_jogador
	  			
	  			#imprime conjunto de '\n'
	  			li $v0, 4
				la $a0, n_quebra_linhas
				syscall
	  			
	  			# incrementa jogada para ver se chegou ao fim
	  			addi $s6, $s6, 1
	  			beq $s6, $s7, end
	  			
	  			#verifica se ha vencedor
	  			la $a0,vetor
	  			jal verifica_vencedor
	  			bne $v0, $zero, end
	  			
	  			# procedimento para a vez do pc
	  			la $a0,vetor
	  			la $t7, opcao_de_jogador_inicial	#recebe endereço de quem joga primeiro
	  			lw $a1, 0($t7)				#carrega em $a1 que joga primeiro (1 = jogador ou 2 = PC)
	  			
	  			##transforma $a1 em negativo (-1 ou -2) para uso (otimizando uso de registradores) na função vez_do_pc 
	  			sub $a1, $zero, $a1			
	  			jal vez_do_pc
	  	
	  			# desenha o tabuleiro
	  			la $a0,vetor			
	  			jal desenhar
	  
	  		#incrementa indice
	  		addi $s6, $s6, 1
	  
	  j loop_de_jogadas_jogador_primeiro
	

#funcao que calcula a melhor jogada para o PC

# no caso de o jogador comecar jogando, foi necessario tratar os casos criticos
# que sao as jogadas nas bordas, se o pc comeca jogando estes casos nao precisam ser tratados

vez_do_pc:

	addi $t8, $zero, 1				#numero da maquina
	addi $t9, $zero, -1				#verificar se o jogador joga primeiro		
	beq $a1, $t9, caso_especial			#$t9 também serve pra jogadas do jogador

	j fluxo_normal

caso_especial:

	lw $t1,0($a0)  							#ponta esquerda 1
	lw $t2,8($a0) 							#ponta direita 3
	lw $t3,16($a0) 							#meio
	lw $t4,24($a0) 							#ponta esquerda 7
	lw $t5,32($a0) 							#ponta direita 9
	
	bne $t3, $t8, fluxo_normal 						# se meio for igual a jogada do PC -> verifica (meio ja jogado), senao -> fluxo_normal
	
	bne $t1, $t9, caso_especial_II		
	bne $t5, $t9, caso_especial_II		
	
	#defender caso critico
	la $t7, 4($a0)
	lw $t6, 4($a0)							#carrega uma posição sem ser quina ou meio pra defender do caso critico
	beq $t6, $zero, tenta_defender
	
	j tenta_vencer	
	
	j caso_especial_II
	
caso_especial_II:
	bne $t2, $t9, fluxo_normal
	bne $t4, $t9, fluxo_normal	
	
	#defender caso critico
	la $t7, 4($a0)
	lw $t6, 4($a0)						#carrega uma posição sem ser quina ou meio pra defender do caso critico
	beq $t6, $zero, tenta_defender
	
	j tenta_vencer	
	
	j fluxo_normal

tenta_defender:
	sw $t8, ($t7)
	jr $ra

tenta_vencer:
	lw $t6, 4($a0)						#carrega posição 2
	bne $t6, $t8, fluxo_normal
	lw $t6, 16($a0)						#carrega posição 5
	bne $t6, $t8, fluxo_normal
	lw $t6, 28($a0)						#carrega posição 8 e verifica se é 0
	bne $t6, $zero, fluxo_normal
	
	sw $t8, 28($a0)		
	jr $ra				#joga na posição 8 pra vencer

fluxo_normal:

	lw $t1,0($a0)
	lw $t2,4($a0)
	lw $t3,8($a0)

	beq $t1,$zero,next1
	bne $t1,$t2,next1
	bne $t3,$zero,next1
	sw $t8,8($a0)
	jr $ra

next1:
	beq $t2,$zero,next2
	bne $t2,$t3,next2
	bne $t1,$zero,next2
	sw $t8,0($a0)
	jr $ra

next2:
	beq $t1,$zero,next3
	bne $t1,$t3,next3
	bne $t2,$zero,next3
	sw $t8,4($a0)
	jr $ra

# verifica a possibilidade de ganhar/perder e ganhar/defender na linha 1
next3:
	lw $t1,12($a0)
	lw $t2,16($a0)
	lw $t3,20($a0)

	beq $t1,$zero,next4
	bne $t1,$t2,next4
	bne $t3,$zero,next4
	sw $t8,20($a0)
	jr $ra

next4:
	beq $t2,$zero,next5
	bne $t2,$t3,next5
	bne $t1,$zero,next5
	sw $t8,12($a0)
	jr $ra

next5:
	beq $t1,$zero,next6
	bne $t1,$t3,next6
	bne $t2,$zero,next6
	sw $t8,16($a0)
	jr $ra

# verifica a possibilidade de ganhar/perder e ganhar/defender na linha 2
next6:
	lw $t1,24($a0)
	lw $t2,28($a0)
	lw $t3,32($a0)
	
	beq $t1,$zero,next7
	bne $t1,$t2,next7
	bne $t3,$zero,next7
	sw $t8,32($a0)
	jr $ra

next7:
	beq $t2,$zero,next8
	bne $t2,$t3,next8
	bne $t1,$zero,next8
	sw $t8,24($a0)
	jr $ra

next8:
	beq $t1,$zero,next9
	bne $t1,$t3,next9
	bne $t2,$zero,next9
	sw $t8,28($a0)
	jr $ra

# verifica a possibilidade de ganhar/perder e ganhar/defender na coluna 0
next9:
	lw $t1,0($a0)
	lw $t2,12($a0)
	lw $t3,24($a0)

	beq $t1,$zero,next10
	bne $t1,$t2,next10
	bne $t3,$zero,next10
	sw $t8,24($a0)
	jr $ra

next10:
	beq $t2,$zero,next11
	bne $t2,$t3,next11
	bne $t1,$zero,next11
	sw $t8,0($a0)
	jr $ra

next11:
	beq $t1,$zero,next12
	bne $t1,$t3,next12
	bne $t2,$zero,next12
	sw $t8,12($a0)
	jr $ra

# verifica a possibilidade de ganhar/perder e ganhar/defender na coluna 1
next12:
	lw $t1,4($a0)
	lw $t2,16($a0)
	lw $t3,28($a0)
	
	beq $t1,$zero,next13
	bne $t1,$t2,next13
	bne $t3,$zero,next13
	sw $t8,28($a0)
	jr $ra

next13:
	beq $t2,$zero,next14
	bne $t2,$t3,next14
	bne 	$t1,$zero,next14
	sw $t8,4($a0)
	jr $ra

next14:
	beq $t1,$zero,next15
	bne $t1,$t3,next15
	bne $t2,$zero,next15
	sw $t8,16($a0)
	jr $ra

# verifica a possibilidade de ganhar/perder e ganhar/defender na coluna 2
next15:
	lw $t1,8($a0)
	lw $t2,20($a0)
	lw $t3,32($a0)

	beq $t1,$zero,next16
	bne $t1,$t2,next16
	bne $t3,$zero,next16
	sw $t8,32($a0)
	jr $ra

next16:
	beq $t2,$zero,next17
	bne $t2,$t3,next17
	bne $t1,$zero,next17
	sw $t8,8($a0)
	jr $ra

next17:
	beq $t1,$zero,next18
	bne $t1,$t3,next18
	bne $t2,$zero,next18
	sw $t8,20($a0)
	jr $ra

# verifica a possibilidade de ganhar/perder e ganhar/defender na diagonal
next18:
	lw $t1,0($a0)
	lw $t2,16($a0)
	lw $t3,32($a0)
	
	beq $t1,$zero,next19
	bne $t1,$t2,next19
	bne $t3,$zero,next19
	sw $t8,32($a0)
	jr $ra

next19:
	beq $t2,$zero,next20
	bne $t2,$t3,next20
	bne $t1,$zero,next20
	sw $t8,0($a0)
	jr $ra

next20:
	beq $t1,$zero,next21
	bne $t1,$t3,next21
	bne $t2,$zero,next21
	sw $t8,16($a0)
	jr $ra
	
# verifica a possibilidade de ganhar/perder e ganhar/defender na diagonal
next21:
	lw $t1,8($a0)
	lw $t2,16($a0)
	lw $t3,24($a0)
	
	beq $t1,$zero,next22
	bne $t1,$t2,next22
	bne $t3,$zero,next22
	sw $t8,24($a0)
	jr $ra

next22:
	beq $t2,$zero,next23
	bne $t2,$t3,next23
	bne $t1,$zero,next23
	sw $t8,8($a0)
	jr $ra

next23:
	beq $t1,$zero,next24
	bne $t1,$t3,next24
	bne $t2,$zero,next24
	sw $t8,16($a0)
	jr $ra

# checa se pode jogar no meio
next24:
	lw $t2,16($a0)
	
	bne 	$t2,$zero,next25
	sw $t8,16($a0)
	jr $ra

# checa se pode jogar na quina 0
next25:
	lw $t1,0($a0)

	bne $t1,$zero,next26
	sw $t8,0($a0)
	jr $ra

# checa se pode jogar na quina 2
next26:
	lw $t1,8($a0)
	
	bne $t1,$zero,next27
	sw $t8,8($a0)
	jr $ra

# checa se pode jogar na quina 6
next27:
	lw $t1,24($a0)
	
	bne $t1,$zero,next28
	sw $t8,24($a0)
	jr $ra

# checa se pode jogar na quina 8
next28:
	lw $t1,32($a0)

	bne $t1,$zero,next29
	sw $t8,32($a0)
	jr $ra

#checa se pode jogar na posi��o 1
next29:
	lw $t1,4($a0)
	
	bne $t1,$zero,next30
	sw $t8,4($a0)
	jr $ra

#checa se pode jogar na posicao 3
next30:
	lw $t1,12($a0)

	bne $t1,$zero,next31
	sw $t8,12($a0)
	jr $ra

#checa se pode jogar na posicao 5
next31:
	lw $t1,20($a0)

	bne $t1,$zero,next32
	sw $t8,20($a0)
	jr $ra

#checa se pode jogar na posicao 7
next32:
	lw $t1,28($a0)

	bne 	$t1,$zero,finally
	sw $t8,28($a0)

finally:
	jr $ra


# funcao responsavel por desenhar o jogo	
desenhar:

	la $s1, vetor

	addi $t1, $zero, 1			#indice do laco
	addi $t6,$zero,0			#usado para acesso aos elementos do vetor
	addi $t2, $zero, 10
	addi $t4, $zero, 3
	addi $t9, $zero, -1
	addi $t8, $zero, 1

	loop:
	
		
		li $v0,4			#imprime caractere '|'
		la $a0,pipe
		syscall
	
		beq $t1,$t2, fim		#se t1 == t2, ja chegou o fim do programa
		sll $t3,$t6,2			#deslocamento do indice do vetor -> para acesso
		add $t3,$t3,$s1			#soma com endereco base
		lw $t3,0($t3)			#carrega valor
	


		beq $t3, $zero, print_blank	# se o elemento no vetor for 0, imprime espaco branco
	
		beq $t3, $t8, print_PC		#se t3 = t8 -> va para print_PC

		
		# imprime caractere 'X'
		li $v0,4
		la $a0, caractere_X
		syscall
	
		
		volta:
		
		#Divide indice por 3-> usado para saber qdo dar o '\n' no vetor
		div $t1,$t4
		mfhi $t5 # resto da divisao
	
		beq $t5,$zero,pb # se resto == 0 -> va para pb
	
		volta2:
		addi $t1,$t1,1		#incrementa indice
		addi $t6,$t6,1 		#incrementa auxiliar de acesso ao vetor
		j loop			# volta para o loop 
	
		#imprime espaco em branco
		print_blank:
		li $v0,4
		la $a0,espaco_branco
		syscall
		
		j volta			# vai para a diretiva volta
		
		#imprime caractere '|'
		pb:
		li $v0,4
		la $a0,pipe
		syscall
		
		# imprime '\n'
		li $v0,4
		la $a0,quebra_linha
		syscall
		j volta2		# vai para a diretiva volta2
		
		# imprime caractere do PC
		print_PC:
		li $v0,4
		la $a0,caractere_0
		syscall
		
		j volta			# vai para a diretiva volta
	
	#retorno
	fim:
		jr $ra

vez_do_jogador:

	la $t0, vetor
	addi $t1, $zero, 0

			#imprimindo mensagem para solicitar posicao
			li $v0, 4
			la $a0, pedir_posicao_para_jogador
			syscall
			
			#recebendo valor
			li $v0, 5
			syscall
			sw $v0, opcao_de_entrada_jogador
	
	# registrador com -1(valor que é colocado no vetor para representar a jogada do jogador)
	addi $t6, $zero, -1
	
	#carrega valor da jogada do jogador
	la $t1, opcao_de_entrada_jogador
	lw $t1, ($t1)
	
	#subtrai 1 do valor(as jogadas no console sao de 1-9, mas os acessos ao vetor de 0-8)
	addi $t1, $t1, -1
	
	# multiplica indice por 4 e soma ao endereco base
	sll $t5, $t1, 2
	add $t5, $t5, $t0
	lw $t7, 0($t5)
	
	#verifica se nao foi jogado na posicao desejava
	bne $t7,$zero,vez_do_jogador
	sw $t6, 0($t5)

	#coloca o retorno em $vo
	move $v0, $t0
	# retorna
	jr $ra


# verifica as possibilidades de vencedor
verifica_vencedor:

	lw $t1,0($a0)
	lw $t2,4($a0)
	lw $t3,8($a0)

	beq $t1,$zero,verifica1
	bne $t1,$t2,verifica1
	beq $t2,$t3,returnWin

	verifica1:
	lw $t1,12($a0)
	lw $t2,16($a0)
	lw $t3,20($a0)

	beq $t1,$zero,verifica2
	bne $t1,$t2,verifica2
	beq $t2,$t3,returnWin

	verifica2:
	lw $t1,24($a0)
	lw $t2,28($a0)
	lw $t3,32($a0)

	beq $t1,$zero,verifica3
	bne $t1,$t2,verifica3
	beq $t2,$t3,returnWin

	verifica3:
	lw $t1,0($a0)
	lw $t2,12($a0)
	lw $t3,24($a0)

	beq $t1,$zero,verifica4
	bne $t1,$t2,verifica4
	beq $t2,$t3,returnWin

	verifica4:
	lw $t1,4($a0)
	lw $t2,16($a0)
	lw $t3,28($a0)

	beq $t1,$zero,verifica5
	bne $t1,$t2,verifica5
	beq $t2,$t3,returnWin

	verifica5:
	lw $t1,8($a0)
	lw $t2,20($a0)
	lw $t3,32($a0)

	beq $t1,$zero,verifica6
	bne $t1,$t2,verifica6
	beq $t2,$t3,returnWin

	verifica6:
	lw $t1,0($a0)
	lw $t2,16($a0)
	lw $t3,32($a0)

	beq $t1,$zero,verifica7
	bne $t1,$t2,verifica7
	beq $t2,$t3,returnWin

	verifica7:
	lw $t1,8($a0)
	lw $t2,16($a0)
	lw $t3,24($a0)

	beq $t1,$zero,returnNotWin
	bne $t1,$t2,returnNotWin
	beq $t2,$t3,returnWin
	j returnNotWin
	returnWin:
	move $v0,$t1

	# se a execucao chegou ate aqui, significa que a maquina ganhou
	# uma msg é impressa
	li $v0, 4
	la $a0, maquina_ganhou
	syscall
	
	jr $ra

	# caso em que nao ha um vencedor ainda
	returnNotWin:
	move $v0,$zero
	jr $ra


# esta parte e responsavel por finalizar o programa
end:
	
	
	la $a0, vetor
	jal verifica_vencedor
	
	# se nao houver vencedor, imprime empate
	bne $v0, $zero, pula
	li $v0, 4
	la $a0, empate
	syscall
	
	j pula
	
	pula:
	
	la $a0,vetor			
	jal desenhar					
				
	li $v0, 10
	syscall

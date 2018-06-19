%-------TP1 prolog -------%

help:-
write('
+---------------------------------------------------------------+
| Algoritmo de busca no espaco de estados                       |
|                                                               |
| Para executar, digite:                                        |
| ?- busca(TipoDeBusca). <enter>                                |
|                                                               |
| % selecione o tipo de busca desejada                          |
|    % 1- aleatoria                                             |
|    % 2- largura                                               |
|    % 3- profundidade                                          |
|    % 4- menor custo                                           |
|    % 5- melhor estimativa                                     |
|    % 6- otima (ou A*)                                         |
+---------------------------------------------------------------+
').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Acervo de dados %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Deposito 13 - BE
% Acoes do problema

	acao(1,[2,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[1,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(1,[3,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[1,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(2,[1,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[2,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(3,[1,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[3,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(3,[4,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[3,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(3,[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[3,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(4,[3,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[4,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(4,[6,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[4,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(5,[3,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(5,[6,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(5,[7,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(5,[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],3).

	acao(6,[4,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[6,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(6,[8,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[6,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(6,[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[6,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(7,[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[7,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(7,[8,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[7,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(8,[6,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[8,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(8,[7,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[8,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(9,[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[9,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(9,[10,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[9,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(10,[9,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[10,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(11,[9,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(11,[12,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(11,[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(11,[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],3).

	acao(12,[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[12,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(13,[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(13,[15,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(13,[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(14,[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(14,[16,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(14,[5,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],3).

	acao(15,[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[15,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(15,[16,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[15,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(16,[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[16,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(16,[15,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[16,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(17,[19,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(17,[18,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(17,[26,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],3).

	acao(18,[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[18,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(19,[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[19,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(19,[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[19,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).

	acao(20,[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(20,[19,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(20,[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],3).

	acao(21,[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[21,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(21,[23,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[21,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(22,[21,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(22,[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(22,[24,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(23,[24,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[23,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(23,[21,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[23,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(24,[23,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[24,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(24,[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[24,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(25,[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[25,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(26,[28,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[26,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(26,[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[26,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],3).

	acao(27,[28,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(27,[25,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(27,[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(28,[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[28,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(28,[26,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[28,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(29,[30,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(29,[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).
	acao(29,[31,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(30,[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[30,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(30,[32,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[30,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(31,[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[31,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

	acao(32,[30,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[32,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],2).

% PegarBloco

	acao(pegarBloco,[1,b,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[1,s,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[2,AA,b,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[2,AA,s,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[3,AA,AB,b,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[3,AA,AB,s,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[4,AA,AB,AC,b,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[4,AA,AB,AC,s,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[5,AA,AB,AC,AD,b,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[5,AA,AB,AC,AD,s,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[6,AA,AB,AC,AD,AE,b,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[6,AA,AB,AC,AD,AE,s,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[7,AA,AB,AC,AD,AE,AF,b,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[7,AA,AB,AC,AD,AE,AF,s,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[8,AA,AB,AC,AD,AE,AF,AG,b,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[8,AA,AB,AC,AD,AE,AF,AG,s,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[9,AA,AB,AC,AD,AE,AF,AG,AH,b,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[9,AA,AB,AC,AD,AE,AF,AG,AH,s,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[10,AA,AB,AC,AD,AE,AF,AG,AH,BA,b,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[10,AA,AB,AC,AD,AE,AF,AG,AH,BA,s,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,b,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[11,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,s,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[12,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,b,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[12,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,s,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,b,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[13,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,s,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,b,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[14,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,s,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[15,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,b,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[15,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,s,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[16,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,b,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[16,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,s,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,b,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[17,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,s,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[18,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,b,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[18,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,s,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[19,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,b,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[19,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,s,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,b,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[20,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,s,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[21,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,b,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[21,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,s,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,b,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],[22,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,s,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[23,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,b,CH,DA,DB,DC,DD,DE,DF,DG,DH],[23,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,s,CH,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[24,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,b,DA,DB,DC,DD,DE,DF,DG,DH],[24,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,s,DA,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[25,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,b,DB,DC,DD,DE,DF,DG,DH],[25,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,s,DB,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[26,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,b,DC,DD,DE,DF,DG,DH],[26,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,s,DC,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,b,DD,DE,DF,DG,DH],[27,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,s,DD,DE,DF,DG,DH],1).
	acao(pegarBloco,[28,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,b,DE,DF,DG,DH],[28,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,s,DE,DF,DG,DH],1).
	acao(pegarBloco,[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,b,DF,DG,DH],[29,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,s,DF,DG,DH],1).
	acao(pegarBloco,[30,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,b,DG,DH],[30,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,s,DG,DH],1).
	acao(pegarBloco,[31,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,b,DH],[31,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,s,DH],1).
	acao(pegarBloco,[32,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,b],[32,AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,s],1).

	% SoltarBloco

	acao(soltarBloco,[13,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s],[13,s,s,s,s,s,s,s,s,s,s,s,s,b,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s],1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Busca 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ----- Estado Inicial e Meta

	% Estado Inicial:
		inicial1([13,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,b]).

	% Estado Meta:
		meta1([13,s,s,s,s,s,s,s,s,s,s,s,s,b,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s]).

		% função de busca 1

busca1(T) :-
   inicial1(E),
   busca1(T,[_:_:0:E:[]],[],P:G),
   tipo(T,N),
	 K = P,
	 while1(P),
   format('~nBusca do Tipo.: ~w~n',[N]),
	 format('~nBuscando Primeiro Bloco'),
   format('~nPlano: ~w',[K]),
   format('~nCusto: ~w~n',[G]).
busca1(_,[_:_:G:E:C|_],_,P:G) :-
   meta1(E), !,
   reverse(C,P).
busca1(T,[_:_:G:E:C|F],V,P) :-
   sucessores(T,G:E:C,V,S),
   insere(T,S,F,NF),
   union([E],V,NV),
   busca1(T,NF,NV,P).

 	% Percorre vetor 1

while1([]).
while1([X|Y]) :-
	comprimento(N,[X|Y]),
	N > 0,
	(	X = 'pegarBloco' -> pegue(1)
	; 	X = 'soltarBloco' -> solte(1)
	;	ande(X)
	),

	while1(Y).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Busca 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ----- Estado Inicial e Meta
% Estado Inicial:
	inicial2([13,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,b,s,s,s,s,s,s,s,s,s,s,s,s,s,s]).

% Estado Meta:
	meta2([13,s,s,s,s,s,s,s,s,s,s,s,s,b,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s]).

% função de busca 2

busca2(T) :-
   inicial2(E),
   busca2(T,[_:_:0:E:[]],[],P:G),
   tipo(T,N),
	 K = P,
	 while2(P),
	 format('~nBuscando Segundo Bloco',[N]),
   format('~nPlano: ~w',[K]),
   format('~nCusto: ~w~n',[G]).
busca2(_,[_:_:G:E:C|_],_,P:G) :-
   meta2(E), !,
   reverse(C,P).
busca2(T,[_:_:G:E:C|F],V,P) :-
   sucessores(T,G:E:C,V,S),
   insere(T,S,F,NF),
   union([E],V,NV),
   busca2(T,NF,NV,P).

	 % Percorre vetor 2

	 while2([]).
	 while2([X|Y]) :-
	 comprimento(N,[X|Y]),
	 N > 0,
	 (	X = 'pegarBloco' -> pegue(2)
	 ; 	X = 'soltarBloco' -> solte(2)
	 ;	ande(X)
	 ),

	 while2(Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Busca 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ----- Estado Inicial e Meta

% Estado Inicial:
	inicial3([13,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,b,s,s,s,s,s,s]).

% Estado Meta:
	meta3([13,s,s,s,s,s,s,s,s,s,s,s,s,b,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s]).

% função de busca 3

busca3(T) :-
   inicial3(E),
   busca3(T,[_:_:0:E:[]],[],P:G),
   tipo(T,N),
	 K = P,
	 while3(P),
   format('~nBuscando Terceiro Bloco',[N]),
   format('~nPlano: ~w',[K]),
   format('~nCusto: ~w~n~n',[G]).
busca3(_,[_:_:G:E:C|_],_,P:G) :-
   meta3(E), !,
   reverse(C,P).
busca3(T,[_:_:G:E:C|F],V,P) :-
   sucessores(T,G:E:C,V,S),
   insere(T,S,F,NF),
   union([E],V,NV),
   busca3(T,NF,NV,P).

	 % Percorre vetor 3

	 while3([]).
	 while3([X|Y]) :-
	 comprimento(N,[X|Y]),
	 N > 0,
	 (	X = 'pegarBloco' -> pegue(3)
	 ; 	X = 'soltarBloco' -> solte(3)
	 ;	ande(X)
	 ),

	 while3(Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Interface Grafica %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

agente :-
   inicia,
   new(D,dialog('Agente')),
   send(D,append,bitmap(image('ambiente.bmp'))),
   send(D,display,new(@o1,box(20,20))),
   send(@o1,fill_pattern,colour(yellow)),
   send(@o1,move,point(280,110)),
   send(D,display,new(@o2,box(20,20))),
   send(@o2,fill_pattern,colour(green)),
   send(@o2,move,point(100,80)),
   send(D,display,new(@o3,box(20,20))),
   send(@o3,fill_pattern,colour(red)),
   send(@o3,move,point(20,110)),
   send(D,append,new(@a,bitmap(image('agente.bmp')))),
   send(@a,move,point(210,380)),
   new(@t,timer(1)),
   send(@t,start),
   send(D,open).

:- dynamic pos/2, seg/1.

inicia :-
   forall(member(X,[@t,@a,@o1,@o2,@o3]),free(X)),
   retractall(pos(_,_)),
   retractall(seg(_)),
   assert(pos(agente,13)),
   assert(pos(1,32)),
   assert(pos(2,18)),
   assert(pos(3,26)).

porta(1,2).
porta(1,3).
porta(2,1).
porta(3,1).
porta(3,4).
porta(3,5).
porta(4,3).
porta(4,6).
porta(5,3).
porta(5,6).
porta(5,7).
porta(5,14).
porta(6,4).
porta(6,5).
porta(6,8).
porta(7,5).
porta(7,8).
porta(8,6).
porta(8,7).
porta(9,10).
porta(9,11).
porta(10,9).
porta(11,9).
porta(11,12).
porta(11,13).
porta(11,20).
porta(12,11).
porta(13,11).
porta(13,14).
porta(13,15).
porta(14,5).
porta(14,13).
porta(14,16).
porta(15,13).
porta(15,16).
porta(16,14).
porta(16,15).
porta(17,18).
porta(17,19).
porta(17,26).
porta(18,17).
porta(19,17).
porta(19,20).
porta(20,11).
porta(20,19).
porta(20,22).
porta(21,22).
porta(21,23).
porta(22,20).
porta(22,21).
porta(22,24).
porta(23,21).
porta(23,24).
porta(24,22).
porta(24,23).
porta(25,27).
porta(26,17).
porta(26,28).
porta(27,25).
porta(27,28).
porta(27,29).
porta(28,26).
porta(28,27).
porta(29,27).
porta(29,30).
porta(29,31).
porta(30,29).
porta(30,32).
porta(31,29).
porta(32,30).

passagem(X,Y) :- porta(X,Y).
passagem(X,Y) :- porta(Y,X).

rota(X,X,[X]) :- !.
rota(X,Y,[X|R]) :- passagem(X,Z), rota(Z,Y,R).

% comandos para o agente

ande(L) :-
   pos(agente,L), !.
ande(L) :-
   retract(pos(agente,P)),
   assert(pos(agente,L)),
   length(R,_),
   rota(P,L,R),
   siga(R), !.

pegue(O) :-
   seg(O), !.
pegue(O) :-
   pos(O,P),
   ande(P),
   retract(pos(O,_)),
   assert(seg(O)),
   get(@a,position,X),
   obj(O,No,_),
   send(No,move,X), !.

solte(O) :-
   not(seg(O)), !.
solte(O) :-
   pos(agente,P),
   not(member(P,[5,6])),
   retract(seg(O)),
   assert(pos(O,P)),
   get(@a,position,point(X,Y)),
   obj(O,No,Yo), X1 is X-20, Y1 is Y+Yo,
   send(No,move,point(X1,Y1)), !.

siga([]).
siga([S|R]) :- mova(S), send(@t,delay), siga(R).

mova(S) :-
   sala(S,X,Y),
   forall(seg(O),(obj(O,No,_),send(No,move,point(X,Y)))),
   send(@a,move,point(X,Y)).

   sala(25,  40,  40).
   sala(27, 125,  40).
   sala(29, 210,  40).
   sala(31, 295,  40).
   sala(26,  40, 125).
   sala(28, 125, 125).
   sala(30, 210, 125).
   sala(32, 295, 125).
   sala(17,  40, 210).
   sala(19, 125, 210).
   sala(21, 210, 210).
   sala(23, 295, 210).
   sala(18,  40, 295).
   sala(20, 125, 295).
   sala(22, 210, 295).
   sala(24, 295, 295).
   sala(9,  40,  380).
   sala(11, 125, 380).
   sala(13, 210, 380).
   sala(15, 295, 380).
   sala(10,  40, 465).
   sala(12, 125, 465).
   sala(14, 210, 465).
   sala(16, 295, 465).
   sala(1,  40,  550).
   sala(3, 125,  550).
   sala(5, 210,  550).
   sala(7, 295,  550).
   sala(2,  40,  635).
   sala(4, 125,  635).
   sala(6, 210,  635).
   sala(8, 295,  635).

obj(1, @o1, -20).
obj(2, @o2,   0).
obj(3, @o3, +20).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% funções Generica %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------ funcao heuristica: nula

h(_,0).


sucessores(T,G1:E:C,V,R) :-
   findall(F:H:G:S:[A|C],
	   (acao(A,E,S,G2),
	    not(member(S,V)),
	    h(S,H), G is G1+G2,
	    (T=4 -> F is G
	    ;T=5 -> F is H
	    ;T=6 -> F is G+H
	    ;       F is 0)),R).
insere(1,S,F,NF) :- append(S,F,R),
                    length(R,L), embaralha(L,R,NF), !.
insere(2,S,F,NF) :- append(F,S,NF), !.
insere(3,S,F,NF) :- append(S,F,NF), !.
insere(_,S,F,NF) :- append(S,F,R), sort(R,NF), !.

embaralha(0,F,F) :- !.
embaralha(L,F,[X|NF]) :-
   N is random(L),
   nth0(N,F,X), delete(F,X,R),
   M is L-1,
   embaralha(M,R,NF), !.

tipo(1,aleatoria).
tipo(2,largura).
tipo(3,profundidade).
tipo(4,menor_custo).
tipo(5,melhor_estimativa).
tipo(6,otima).

%-------------- Tamanho da lista
comprimento(0,[]).
comprimento(N,[_|R]):-comprimento(N1,R), N is 1 + N1.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% funções do problema %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

busca(X) :- agente(),busca1(X), busca2(X), busca3(X).

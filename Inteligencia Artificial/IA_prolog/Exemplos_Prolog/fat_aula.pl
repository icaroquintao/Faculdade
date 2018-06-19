% fatorial fat(numero,fatorial)
fat(0,1).
fat(N,F):- N>0, 
	M is N-1, 
	fat(M,R), 
	F is R*N.

% Potencia(Base, Expoente, P)
potencia(_,0,1).
potencia(B,E,P):- E>0,
				E1 is E - 1,
				potencia(B,E1,P1),
				P is P1*B.


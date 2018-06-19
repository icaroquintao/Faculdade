% Mundo de Blocos

% blocos imediatamente acima de outro
sobre(d,c).
sobre(c,b).
sobre(b,a).
sobre(g,f).
sobre(f,e).
sobre(i,h).

% blocos base da pilha
base(a,1).
base(e,2).
base(h,3).

% relação acima
acima(X,Y) :- sobre(X,Y).
acima(X,Y) :- sobre(X,Z), acima(Z,Y).

%relação bloco X à esquerda do bloco Y
esq(X,Y) :- acima(X,Z), acima(Y,W), base(Z,Num1), base(W,Num2), Num2 > Num1.
esq(X,Y) :- acima(X,Z), base(Y,Num1), base(Z,Num2), Num1 > Num2.
esq(X,Y) :- acima(Y,Z), base(X,Num1), base(Z,Num2), Num2 > Num1.
esq(X,Y) :- base(X,Num1), base(Y,Num2), Num2 > Num1.
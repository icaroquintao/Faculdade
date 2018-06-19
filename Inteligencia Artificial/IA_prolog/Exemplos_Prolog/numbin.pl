

sobre(b,a).
sobre(d,b).
sobre(d,c).
sobre(f,d).
acima(X,Y):-sobre(X,Y).
acima(X,Y):-sobre(X,Z), acima(Z,Y).

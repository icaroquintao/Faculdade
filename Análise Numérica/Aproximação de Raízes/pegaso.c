#include<stdio.h>
#include<stdlib.h>
#include<math.h>

float fx(float x){
	return 2*x*x*x-cos(x+1)-3;
}



float pegaso(float Xant, float Xn, float erroMaximo){
	float Xprox;
	float erro=1;
	float FXant = fx(Xant);
	int k=1;
	Xprox = Xn - (fx(Xn)*(Xn-Xant))/(fx(Xn)-fx(Xant));

	

		printf("%3c | %10s | %10s | %10s | %10s | %10s | %10s | %10s \n",'k', "xn-1", "f(xn-1)","xn", "f(xn)","xn+1","f(xn+1)", "erro");
	while(erro>erroMaximo){
		erro = fabsf(Xprox-Xn);
		printf("%3d | %10f | %10f | %10f | %10f | %10f | %10f | %10f \n",k, Xant, FXant,Xn, fx(Xn),Xprox,fx(Xprox), erro);
		if(fx(Xprox)*fx(Xn)< 0){
			Xant = Xn;
			FXant = fx(Xn);
		} else {
			FXant = (FXant*fx(Xn))/(fx(Xn)+fx(Xprox));
		}

		Xn = Xprox;
		k++;
		Xprox = Xn - (fx(Xn)*(Xn-Xant))/(fx(Xn)-FXant);
	}

	return Xprox;
}


int main(){

	printf("********************APROXIMANDO UMA RAIZ PELO METODO PEGASO********************\n\n");
	float raiz = pegaso(-1,2,0.01);

	printf("\n\nRaiz encontrada: %f\n",raiz);
	return 0;
}
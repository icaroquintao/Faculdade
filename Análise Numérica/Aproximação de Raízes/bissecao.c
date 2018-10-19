#include<math.h>
#include<stdio.h>
#include<stdlib.h>

float Fx (float x){
	return  0.05*x*x*x-0.4*x*x+3*x*sin(x);
}

float bissecao(float a, float b, float erroMaximo){
	float xk, xk1;
	xk = a;
	xk1 = b;
	float erro = fabsf(xk1-xk)/2;
	printf("%3c | %10c | %10s | %10c | %10s | %10s | %10s | %10c \n",'k','a',"f(a)",'b',"f(b)","xk","f(xk)",'E');
	int k=0;
	
	while(erro > erroMaximo){
		xk = (a+b)/2;
		printf("%3d | %10f | %10f | %10f | %10f | %10f | %10f | %10f \n",k,a,Fx(a),b,Fx(b),xk,Fx(xk),erro);
		if(Fx(a)*Fx(xk)>0)
			a = xk;
		else b = xk;
		erro = fabsf(xk-xk1)/2;
		xk1 = xk;
		k++;
	}
	xk = (a+b)/2;
	printf("%3d | %10f | %10f | %10f | %10f | %10f | %10f | %10f \n",k,a,Fx(a),b,Fx(b),xk,Fx(xk),erro);
	return (xk);
}


int main(){
	printf("********************Aproximando uma raiz pelo metodo da Bissecao*****************\n\n\n");
	float raiz = bissecao(10,12,0.005);
	printf("\n\nRaiz encontrada: %f\n",raiz);
	return 0;
}
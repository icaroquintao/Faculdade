#include<stdio.h>
#include<stdlib.h>
#include<math.h>

float Fx(float x){
	return 0.05*x*x*x-0.4*x*x+3*x*sin(x);
}

float F1x(float x){
	return 3*0.05*x*x-0.8*x+3*(sin(x) + x*cos(x));
}

float F2x(float x){
	return 6*0.05*x-0.8+3*cos(x)+3*(cos(x)-x*sin(x));
}

float newton_raphson(float a, float b, float erroMaximo){
	float xk, xk1;
	int k=0;

	if(Fx(a)*F2x(a)>0)
		xk = a;
	else xk = b;
	printf("%3c | %10s | %10s | %10s | %10c\n",'k',"xk","F(xk)", "F'x(xk)", 'E');
	float erro = 10000;

	while(erro > erroMaximo){
		printf("%3d | %10f | %10f | %10f | %10f\n",k,xk,Fx(xk), F1x(xk), erro);

		xk1 = xk;
		xk = xk- (Fx(xk)/F1x(xk));
		k++;
		erro = fabsf(xk-xk1);
	}

	printf("%3d | %10f | %10f | %10f | %10f\n\n\n",k,xk,Fx(xk), F1x(xk), erro);

	return xk;

}


int main(){
	printf("********************APROXIMANDO RAIZ COM O METODO DE NEWTON-RAPHSON********************\n\n");
	float raiz = newton_raphson(10,12,0.005);

	printf("Raiz encontrada: %f\n\n",raiz);
	return 0;
}
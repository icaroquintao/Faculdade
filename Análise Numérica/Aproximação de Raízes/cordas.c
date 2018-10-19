#include<math.h>
#include<stdio.h>
#include<stdlib.h>

float Fx (float x){
	return 2*x*x*x - cos(x+1) - 3;
}

float cordas(float a, float b, float erroMaximo){
	float xk, xk1;
	xk = a;
	xk1 = b;
	float erro = fabsf(xk1-xk);
	printf("%3c | %10c | %10s | %10c | %10s | %10s | %10s | %10c \n",'k','a',"f(a)",'b',"f(b)","xk","f(xk)",'E');
	int k=0;
	
	while(erro > erroMaximo){
		xk = (a*Fx(b)-b*Fx(a))/(Fx(b)-Fx(a));
		erro = fabsf(xk-xk1);
		printf("%3d | %10f | %10f | %10f | %10f | %10f | %10f | %10f \n",k,a,Fx(a),b,Fx(b),xk,Fx(xk),erro);
		if(Fx(a)*Fx(xk)>0)
			a = xk;
		else b = xk;
		erro = fabsf(xk-xk1);
		xk1 = xk;
		k++;
	}
	//xk = (a+b)/2;
	//printf("%3d | %10f | %10f | %10f | %10f | %10f | %10f | %10f \n",k,a,Fx(a),b,Fx(b),xk,Fx(xk),erro);
	return (xk);
}


int main(){
	printf("********************Aproximando uma raiz pelo metodo das Cordas*****************\n\n\n");
	float raiz = cordas(-1,2,0.01);
	printf("\n\nRaiz encontrada: %f\n",raiz);
	return 0;
}
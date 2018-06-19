#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void Trapezio(int n, float a, float b, float *Y);
void Simpson2(int n, float a, float b, float *Y);
void Simpson(int n, float a, float b, float *Y);
float* retornaY(int n, float a, float b);
float SenX (int x);

int main()
{
    int k,n;
    float a,b;
    printf("\n-----------------------------------------------------------------------------------------------\n");
    printf("digite o numero de interacoes\n");
    scanf("%i",&n);
    printf("digite o limite inferior\n");
    scanf("%f",&a);
    printf("digite o limite superior\n");
    scanf("%f",&b);
    printf("-----------------------------------------------------------------------------------------------\n");
    printf("Qual o modelo desejado?\n1...Trapezio\n2...Simpson\n3...Simpson2\n");
    scanf("%i",&k);
    printf("-----------------------------------------------------------------------------------------------\n");
    switch(k){
    case 1:
        Trapezio(n,a,b,retornaY(n,a,b));
        break;
    case 2:
        Simpson(n,a,b,retornaY(n,a,b));
        break;
    case 3:
        Simpson2
      (n,a,b,retornaY(n,a,b));
        break;

    }
    return 0;
}

void Trapezio(int n, float a, float b, float *Y){
    float resu = 0 ;
    float h = (b - a)/n;
    int i = 0 ;
    for(i ; i<=n; i++){
        if(i == 0 || i==(n)){
            resu += Y[i];
        }
        else{
            resu += (Y[i]*2);
        }
    }
    printf("%f", ((h/2)*resu));
}

void Simpson(int n, float a, float b, float *Y){


    float resu = 0 ;
    float h = (b - a)/n;
    int i = 0 ;
    for(i ; i<= n; i++){
        if(i == 0 || i==(n)){
            resu += Y[i];
        }
        else if(i%2 == 0){
            resu += (Y[i]*2);
        }
        else{
            resu += (Y[i]*4);
        }
    }
    printf("%f", ((h/3)*resu));

}
void Simpson2(int n, float a, float b, float *Y){
    float resu = 0 ;
    float h = (b - a)/n;
    int i = 0 ;
    for(i ; i<= n; i++){
        if(i == 0 || i==(n)){
            resu += Y[i];
        }
        else if(i%3 == 0){
            resu += (Y[i]*2);
        }
        else{
            resu += (Y[i]*3);
        }
    }
    printf("%f", (((3*h)/8)*resu));

}

float* retornaY(int n, float a, float b){
    float h = (b - a)/n;
    int i = 0,x;
    float *Y ;
    float C1,C2,C3;
    Y = (float*)malloc((n+1)*sizeof(float));

               for(i ; i <= n ; i++){
                    Y[i] = SenX(a);
                    a = a + h;
                  }
    return Y;
}

float SenX(int x){
    return sin(x);
}

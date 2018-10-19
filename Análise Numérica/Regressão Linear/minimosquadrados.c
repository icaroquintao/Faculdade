#include<stdio.h>
#include<stdlib.h>

typedef struct{
	float b0,b1;
}TCoefs;

TCoefs quadrados_minimos(float *x, float *y, int qntd)
{
	TCoefs retorno;
	float xi=0,yi=0,xi2=0,xiyi=0,yi2=0;
	for(int i=0;i<qntd;i++)
	{
		xi+=x[i];
		yi+=y[i];
		xi2+=x[i]*x[i];
		xiyi+=x[i]*y[i];
		yi2+=y[i]*y[i];
	}
	retorno.b1 = (xi*yi - qntd*xiyi)/(xi*xi-qntd*xi2);
	retorno.b0 = (yi-retorno.b1*xi)/qntd;
	return retorno
}
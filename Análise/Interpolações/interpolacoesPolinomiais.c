#include<stdio.h>
#include<stdlib.h>

void newton(int m, float* xpontos, float *ypontos, float num)
{
	float Dyp[m];
	int i,k;
	for(i=0;i<m;i++)
		Dyp[i] = ypontos[i];


	for(k=0;k<m-1;k++)
		for(i=m-1;i>=k+1;i--)
				Dyp[i] = (Dyp[i]-Dyp[i-1])/(xpontos[i]-xpontos[i-k-1]);

	float r=Dyp[m-1];
	for(i=m-2;i>=0;i--)
		r = r*(numxp[i]) + Dyp[i];
	printf("\nP(%f)=%f\n\n\n",num,r);

}

void lagrange(int m, float* xpontos, float* ypontos, float num)
{
	float r = 0;
	int i,j;
	float c,d;
	for(i=0;i<m;i++)
	{
		c=1;d=1;
		for (j=0;j<m;j++)
			if (i!=j)
			{
				c=c*(numxp[j]);
				d=d*(xpontos[i]-xpontos[j]);
			}
		r=r+ypontos[i]*c/d;
	}

	printf("\n\n%f\n\n",r);
}




int main(){
	float xpontos[] = {0.0,0.2,0.4,0.5};
	float ypontos[] = {0,2.008,4.064,5.125};
	lagrange(4,&xpontos[0],&ypontos[0],0.3);
	newton(4,&xpontos[0],&ypontos[0],0.3);
	
	return 0;
}

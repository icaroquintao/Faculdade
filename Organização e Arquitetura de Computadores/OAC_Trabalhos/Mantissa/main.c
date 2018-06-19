#include <stdio.h>
#include <stdlib.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main()
{
   char numero[32];
   int num,i,j=0,mant[23];
   double expoente[8],exp = 0, man = 0;
   printf("Digite um número:");
   gets(numero);

   for(i=1,j=0;i<32;i++,j++){
    if(i<9){
        expoente[j] = (float)numero[i] - 48;
    }
    else if(i==9){
        j=0;
        mant[j]= (int)numero[i] - 48;
    }

    else{
        mant[j] = (int)numero[i] - 48;
    }
   }

   for(i=0,j=7;i<8;i++,j--){
    exp += expoente[j] * pow(10,i);
   }
   //printf("%f\n",exp);

   for(i=0;i<23;i++){
    printf("%d\n",mant[i]);
   }

   printf("\n");
   /*for(i=0,j=22;i<23;i++,j--){
            if (i == 9){
        printf("PONTO 9 ANTES \nman: %f\nmant[i]: %d \n pow(10,j): %f\n",man,mant[i],pow(10,j));
    }
    man = man + mant[i] * pow(10,j);
    if (i == 9){
        printf("PONTO 9 depois \nman: %f\nmant[i]: %d \n pow(10,j): %f\n",man,mant[i],pow(10,j));
    }
    printf("%2d  %35.0f man: %.0f\n",i,mant[i]*pow(10,j),man);
   }*/
   printf ("%lf\n", (double)10000000000000.0+(double)1010101000000000000000.0);
   printf("%.0f\n",man);


    return 0;
}

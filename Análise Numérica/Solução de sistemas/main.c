#include <stdio.h>
#include <stdlib.h>

int main()
{
    double **matriz;
    double *indepedentes;
    int tam, menu;
    double tolerancia;

    //printf("Insira o tamanho da matriz:");
    //scanf("%d",&tam);

    FILE *arquivo = fopen("matrizA.txt","r");
      if (!arquivo) {
         printf("O Arquivo %s nao pode ser aberto.\n");
         getchar();
         exit(1);
      }

    fscanf(arquivo,"%d", &tam);

    matriz = cria_matriz(tam,tam);
    indepedentes = cria_vetor(tam);

    ler_arquivo(arquivo,matriz,indepedentes, tam);

    system("PAUSE");
    system("CLS");



    do{
            menu = menu_principal();
            system("CLS");
        switch(menu){

        case 1: printf("\n******************* Resolucao pelo Metodo de Jacobi ***************************************\n\n");
                printf("Insira a tolerancia desejada:");
                scanf("%lf",&tolerancia);
                printf("\nk\t|\tx1\t|\tx2\t|\tx3\t|\tx4\t|\tTolerancia\n");
                jacobi(matriz,indepedentes,tam,tolerancia);
                system("PAUSE");
                system("CLS");
                break;

        case 2: printf("\n******************* Resolucao pelo Metodo de Gauss-Seidel *********************************\n\n");
                printf("Insira a tolerancia desejada:");
                scanf("%lf",&tolerancia);
                printf("\nk\t|\tx1\t|\tx2\t|\tx3\t|\tx4\t|\tTolerancia\n");
                gauss_seidel(matriz,indepedentes,tam,tolerancia);
                system("PAUSE");
                system("CLS");
                break;

        }
    }while(menu != 0);

    printf("FIM DO PROGRAMA\n\n");


    return 0;
}

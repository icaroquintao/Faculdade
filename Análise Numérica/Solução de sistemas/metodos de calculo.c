#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Menu principal */
int menu_principal()
{
  int escolha;

  do {
    printf("\n******************* Menu Principal ************************* \n\n");

    printf("               (1) Metodo de Jacobi \n");
    printf("               (2) Metodo de Gauss-Seidel \n");
    printf("               (0) Sair \n\n");
    printf("                Escolha: ");
    scanf("%d",&escolha);
  } while (escolha < 0 || escolha > 2);
  return escolha;
}

/* cria memoria para um vetor double de n posicoes */
double *cria_vetor(int n)
{
  double *vetor;

  vetor = (double*) malloc(n*sizeof(double));
  if (!vetor){
  	printf("Falta memoria para alocar o vetor");
    exit(1);
  }
  return vetor;
}

/* Cria matriz de ponteiros para double com n linhas e n colunas */
double **cria_matriz(int nlinhas, int ncolunas)
{
  int i;
  double **matriz;

  matriz = (double**) malloc(nlinhas*sizeof(double*));
  if (!matriz) {
        printf("Falta memoria para alocar a matriz!\n");
        exit(1);
  }
  for (i=0; i < nlinhas; i++) {
    matriz[i] = (double*) malloc(ncolunas*sizeof(double));
    if (!matriz[i]){
      printf("Falta memoria para alocar a matriz!\n");
      exit(1);
    }
  }
  return matriz;
}

/* libera memoria de uma matriz de double */
void free_matriz(double **matriz, int nlinhas)
{
  register int i;

  for (i=nlinhas; i > 0; i--)
    free((double *) matriz[i]);
  free((double *) matriz);
}

/* imprime um vetor de double */
void imprime_vetor(double *vetor, int n)
{
    int i;
    for (i=0; i < n; i++){
        printf("|   %+lf\t",vetor[i]);
    }
}

void imprime_matriz(double **matriz, int n)
{
    int i,j;

    for (i=0; i < n; i++){
        for(j=0; j < n; j++){
            printf("|   %+lf\t",matriz[i][j]);
        }
        printf("\n");
    }
}

/* le um arquivo com matriz "a" de n linhas e n colunas */
void ler_arquivo_matriz(char nomearquivo[], int nlinhas, int ncolunas, double **matriz)
{
  int i,j;
  double valor;
  FILE *arquivo;

  arquivo = fopen(nomearquivo,"r");
  if (!arquivo) {
     printf("O Arquivo %s nao pode ser aberto.\n", nomearquivo);
     getchar();
     exit(1);
  }

  for(i=0; i<nlinhas; i++){
    for(j=0; j<ncolunas; j++){

        fscanf(arquivo, "%lf", &valor);
        matriz[i][j] = valor;
    }
  }
  fclose(arquivo);
}


void ler_arquivo(FILE *arquivo, double **matriz, double *independentes, int n)
{
  int i,j;
  double valor;

  for(i=0; i<n; i++){
    for(j=0; j<n; j++){

        fscanf(arquivo, "%lf", &valor);
        matriz[i][j] = valor;
    }
  }

  printf("\n\nMatriz lida:\n\n");
    imprime_matriz(matriz,n);

  for(i=0; i<n; i++){
    fscanf(arquivo, "%lf", &valor);
    independentes[i] = valor;
  }
  printf("\n\nTermos independentes:\n\n");
  imprime_vetor(independentes,n);
  printf("\n");

  fclose(arquivo);
}

/* le um arquivo com vetor de termos independentes b com n elementos */
void ler_arquivo_vetor(char nomearquivo[], int n, double *vetor)
{
  int i;
  double valor;
  FILE *arquivo;

  arquivo = fopen(nomearquivo,"r");
  if (!arquivo) {
     printf("O Arquivo %s nao pode ser aberto.\n", nomearquivo);
     getchar();
     exit(1);
  }
  for(i=0; i<n; i++){
    fscanf(arquivo, "%lf", &valor);
    vetor[i] = valor;
  }
  fclose(arquivo);
}

void jacobi(double** a, double* b, int tam, double tolerancia){

    double *x, *xanterior;
    int i,j,count=0;
    double epsilon;

    x = cria_vetor(tam);
    xanterior = cria_vetor(tam);

    for(i=0; i<tam; i++)
        x[i] = 0;

    do{
        for(i=0; i<tam; i++){
            xanterior[i] = x[i];
        }

        double erro=0;

        for(i=0; i<tam; i++){
            double soma=0;

            for(j=0; j<tam; j++){

                if(j != i){
                    soma = soma + a[i][j]*xanterior[j];
                }
            }

            x[i] = (b[i]-soma)/a[i][i];

            if((fabs(x[i]-xanterior[i])) > erro){
                erro = fabs(x[i]-xanterior[i]);
            }
        }

        epsilon = erro;
        printf("[%d]\t",count);
        imprime_vetor(x,tam);
        printf("|\t%lf",epsilon);
        printf("\n");
        //system("PAUSE");
        count++;
    }while(epsilon > tolerancia);

    printf("\n\nA solucao do Sistema e:\n\n");
    printf("\n|\tx1\t|\tx2\t|\tx3\t|\tx4\t|\n");
    imprime_vetor(x,tam);
    printf("|\n\n");

    free(xanterior);
    free(x);
}

void gauss_seidel(double** a, double* b, int tam, double tolerancia){

    double *x, *xanterior;
    int i,j,count=0;
    double epsilon;

    x = cria_vetor(tam);
    xanterior = cria_vetor(tam);

    for(i=0; i<tam; i++)
        x[i] = 0;

    do{
        for(i=0; i<tam; i++){
            xanterior[i] = x[i];
        }

        double erro=0;

        for(i=0; i<tam; i++){
            double soma=0;

            for(j=0; j<tam; j++){

                if(j != i){
                    if(j < i)
                        soma = soma + a[i][j]*x[j];
                    else
                        soma = soma + a[i][j]*xanterior[j];
                }
            }

            x[i] = (b[i]-soma)/a[i][i];

            if((fabs(x[i]-xanterior[i])) > erro){
                erro = fabs(x[i]-xanterior[i]);
            }
        }

        epsilon = erro;
        printf("[%d]\t",count);
        imprime_vetor(x,tam);
        printf("|\t%lf",epsilon);
        printf("\n");
        //system("PAUSE");
        count++;
    }while(epsilon > tolerancia);

    printf("\n\nA solucao do Sistema e:\n\n");
    printf("\n|\tx1\t|\tx2\t|\tx3\t|\tx4\t|\n");
    imprime_vetor(x,tam);
    printf("|\n\n");

    free(xanterior);
    free(x);
}

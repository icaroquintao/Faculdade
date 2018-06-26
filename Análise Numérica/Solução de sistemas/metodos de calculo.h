#ifndef METODOS_DE_CALCULO_H_INCLUDED
#define METODOS_DE_CALCULO_H_INCLUDED

/* Menu principal */
int menu_principal();

/* cria memoria para um vetor double de n posicoes */
double *cria_vetor(int n);

/* Cria matriz de ponteiros para double com n linhas e n colunas */
double **cria_matriz(int nlinhas, int ncolunas);

/* libera memoria de uma matriz de double */
void free_matriz(double **matriz, int nlinhas);

/* imprime um vetor de double */
void imprime_vetor(double *vetor, int n);

/* le um arquivo com matriz "a" de n linhas e n colunas */
void ler_arquivo_matriz(char nomearquivo[], int nlinhas, int ncolunas, double **matriz);

/* le um arquivo com vetor de termos independentes b com n elementos */
void ler_arquivo_vetor(char nomearquivo[], int n, double *vetor);


#endif // METODOS_DE_CALCULO_H_INCLUDED

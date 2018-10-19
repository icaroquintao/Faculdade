#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXTEX 1000
#define MAXPAT 32
void leArquivoTexto(char *t, char *nomedoarquivo)
{
    int linha,coluna;
    double valor;
    int m,n;
    int i=0;
    FILE *arq;
    arq = fopen(nomedoarquivo,"r");

    if(arq == NULL){
        printf("Erro, nao foi possivel abrir o arquivo\n");
        return;
    }


    char aux = fgetc(arq);
    while(aux != EOF){
            t[i] = aux;
            aux = fgetc(arq);
            i++;
    }
    t[i] = '\0';
    fclose(arq);

}

void salvaArquivoSaida1(int *ocorrencias, char *nomedoarquivo){
    FILE *arq;
    arq = fopen(nomedoarquivo,"w");

    int tamanho = 0;
    int i=0;
    while(ocorrencias[i]!= -1){
        tamanho++;
        i++;
    }
    fprintf(arq,"%d",tamanho);//salva numero de ocorrencias

    for(i=0;i<tamanho;i++)
        fprintf(arq,"\n%d",ocorrencias[i]);
    fclose(arq);


}
int* shiftand (const char *p, const char *t) {
      const int TABSIZE = 256;
      int *posicoesDoPadrao;

      const unsigned long ONELEFT = 0x80000000;
      int i = 0, j = 0, M = strlen(p), N = strlen(t);
        posicoesDoPadrao = (int*) calloc(N/M,sizeof(int));
        int auxiliar=0;

        for(i=0;i<N/M;i++)
            posicoesDoPadrao[i] = -1;


      unsigned long tabela[TABSIZE];
      for (i = 0; i < TABSIZE; ++i){
            tabela[i] = 0;

      }
      unsigned long mascara = ONELEFT;
      for (j = 0; j < M; ++j) {
            tabela[p[j]] |= mascara;
            mascara >>= 1;
      }

      unsigned long R = 0;
      mascara = ONELEFT >> (M - 1);
      for (i = 0 ; i < N; ++i) {
            R = ((R >> 1) | 0x80000000) & tabela[t[i]];
            if (R & mascara){
                  posicoesDoPadrao[auxiliar] =  i - M + 1; // sucesso
                  auxiliar++;
                  R=0;
            }
      }
      return posicoesDoPadrao; // fracasso
}

void leArquivoSaida1(int *ocorrencias,char *nomedoarquivo)
{

    int i=0;
    FILE *arq;
    arq = fopen(nomedoarquivo,"r");

    if(arq == NULL){
        printf("Erro, nao foi possivel abrir o arquivo\n");
        return;
    }

    int tamanho;
    fscanf(arq,"%d",&tamanho);
    for (i=0;i<tamanho;i++){
        fscanf(arq,"%d",&ocorrencias[i]);
    }

    fclose(arq);

}

int main (){
    //LE ARQUIVO DE TEXTO ONDE SERA PROCURADO O PADRAO
    char *texto;//texto
    texto = (char*) malloc(MAXTEX * sizeof(char));
    leArquivoTexto(texto,"texto.txt");

    //RECEBE O PADRAO DO USUARIO
    char *padrao;
    padrao = (char*) malloc (MAXPAT *sizeof(char));
    printf("\nDigite o padrao a ser buscado no texto: ");
    gets(padrao);

    //DECLARACAO DE VARIAVEIS AUXILIARES
    int i,tamanhotexto = strlen(texto),tamanhopadrao = strlen(padrao);
    int proxocorrencia=0;

    int *teste = shiftand (padrao,texto);//procura o padrao no texto

    salvaArquivoSaida1(teste,"Saida1.txt");//salva o padrao no arquivo saida1

    if(teste[0] == -1)
    {
        printf("\nO padrao nao foi encontrado no texto. ");
        system("pause");
        return 0;
    }

    //LE A SAIDA1 E SALVA AS POSICOES ENCONTRADAS DO PADRAO NO TEXTO NO VETOR OCORRENCIAS
    int *ocorrencias;
    ocorrencias = (int *) malloc (MAXPAT*sizeof(int));
    for(i=0;i<MAXPAT;i++)
        ocorrencias[i] = -1;
    leArquivoSaida1(ocorrencias,"Saida1.txt");

    //RECEBE O NOVO PADRAO DO USUARIO
    char *novopadrao;
    novopadrao = (char*) malloc (MAXPAT*sizeof(char));
    printf("\nDigite o novo padrao a ser inserido no texto: ");
    gets(novopadrao);

    //ESCREVE A SAIDA2
    i=0;
    FILE *arq;
    arq = fopen("Saida2.txt","w");
    while(i<tamanhotexto)
    {
        while((i<ocorrencias[proxocorrencia] || ocorrencias[proxocorrencia] == -1)&&i<tamanhotexto)
        {
            fprintf(arq,"%c",texto[i]);
            i++;
        }
        if(i<tamanhotexto){
            proxocorrencia++;
            fprintf(arq,"%s",novopadrao);
            i+=tamanhopadrao;
        }

    }

    fclose(arq);
    return 0;

}

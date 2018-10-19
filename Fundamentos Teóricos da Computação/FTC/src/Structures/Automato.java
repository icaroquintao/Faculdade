/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Structures;

import Support.Data;
import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedList;

/**
 *
 * @author Guilherme Marx
 */
public class Automato {
    ArrayList<Estado> estados;
    String alfabeto;
    ArrayList<Transicao> transicoes;
    Estado inicial;
    ArrayList<Estado> estadosFinais;

    public ArrayList<Estado> getEstados() {
        return estados;
    }

    public String getAlfabeto() {
        return alfabeto;
    }

    public ArrayList<Transicao> getTransicoes() {
        return transicoes;
    }

    public Estado getInicial() {
        return inicial;
    }

    public ArrayList<Estado> getEstadosFinais() {
        return estadosFinais;
    }


    
    public Automato (char simbolo){//Inicializa o automato que reconhece apenas um simbolo, ele possui um estado inicial e um final e uma transicao entre eles consumindo o simbolo
        
        inicial = new Estado();//instancia o estado inicial
        estados = new ArrayList<>();//instancia o arraylist de estados
        estados.add(inicial);//adiciona o inicial na lista de estados
        estadosFinais = new ArrayList<>();//inicializa a lista de estados finais
        estadosFinais.add(new Estado());//inicializa um estado final
        estados.add(estadosFinais.get(0));//adiciona o estado final na lista de estados
        transicoes = new ArrayList<>();//inicializa o arraylist de transicoes
        transicoes.add(new Transicao(inicial,estadosFinais.get(0),simbolo));//cria uma transicao entre o estado inicial e final
        alfabeto = "" + simbolo;//adiciona o simbolo ao alfabeto
    }
    
    public Automato(Automato at1, Automato at2, char operacao){//cria um automato a partir de dois automatos e uma operacao (pode ser apenas 1 automato se o segundo operando for null), operacoes suportadas eh de Uniao, Concatenacao e fecho de kleene
        switch(operacao){
            case '+'://operacao de uniao de automatos
                inicial = new Estado();//instancia um novo estado inicial
                estados = new ArrayList<>();//instancia uma nova lista de estados
                estados.add(inicial);//adiciona o estado inicial a lista e estados
                estadosFinais = new ArrayList<>();//inicializa a lista de estados finais
                estadosFinais.add(new Estado());//adiciona um novo estado final
                estados.add(estadosFinais.get(0));//adiciona esse novo estado final a lista de estados
                transicoes = new ArrayList<>();//inicializa uma nova lista de transicoes
                transicoes.add(new Transicao(inicial,at1.inicial,Data.lambda));//cria uma transicao Lambda entre o novo inicial e o inicial do primeiro automato
                transicoes.add(new Transicao(inicial,at2.inicial,Data.lambda));//cria uma transicao Lambda entre o novo inicial e o inicial do segundo automato
                for(Estado aux: at1.estados)//adiciona todos os estados do primeiro automato ao automato novo
                    estados.add(aux);
                for(Estado aux: at2.estados)//adiciona todos os estados do segundo automato ao automato novo
                    estados.add(aux);
                for(Estado aux: at1.estadosFinais)//cria uma transicao lambda entre todos os estados finais do primeiro automato e o novo estado final
                    transicoes.add(new Transicao(aux,estadosFinais.get(0),Data.lambda));
                for(Estado aux: at2.estadosFinais)//cria uma transicao lambda entre todos os estados finais do segundo automato e o novo estado final
                    transicoes.add(new Transicao(aux,estadosFinais.get(0),Data.lambda));
                for(Transicao aux: at1.transicoes)//adiciona todas as transicoes do prieiro automato ao automato novo
                    transicoes.add(aux);
                for(Transicao aux: at2.transicoes)//adiciona todas as transicoes do segundo automato ao automato novo
                    transicoes.add(aux);
                alfabeto = alfabetocat(at1.alfabeto,at2.alfabeto);//concatena sem repetir simbolos os alfabetos dos dois automatos
                break;
            case '.'://operacao de concatenacao de automatos, concatena o t2 ao final de t1
                inicial = at1.inicial;//estado inicial do novo automato eh o inicial do primeiro automato
                estados = new ArrayList<>();//inicializa lista de estados do novo automato
                estadosFinais = new ArrayList<>();//inicializa uma lista de estados finais do novo automato
                transicoes = new ArrayList<>();//inicializa uma lista de transicoes do novo automato
                for(Estado aux: at1.estados)//adiciona todos os estados do primeiro automato ao automato novo
                    estados.add(aux);
                for(Estado aux: at2.estados)//adiciona todos os estados do segundo automato ao automato novo
                    estados.add(aux);
                for(Estado aux: at1.estadosFinais)//adiciona uma transicao lambda entre todos os estados finais do primeiro automato e o inicial do segundo
                    transicoes.add(new Transicao(aux,at2.inicial,Data.lambda));
                for(Transicao aux: at1.transicoes)//adiciona todas as transicoes do primeiro automato ao automato novo
                    transicoes.add(aux);
                for(Transicao aux: at2.transicoes)//adiciona todas as transicoes do segundo automato ao automato novo
                    transicoes.add(aux);
                estadosFinais = at2.estadosFinais;//seta o(s) estado(s) final(is) do segundo automato como estado(s) final(is) do automato novo
                alfabeto = alfabetocat(at1.alfabeto,at2.alfabeto);//concatena sem repetir simbolos os alfabetos dos dois automatos
                break;
            case '*'://operação fecho de kleene sobre o automato(segundo automato vem null)
                estados = at1.estados;//conjunto de estados, alfabeto, transicoes e estados finais que ja existiam se mantem
                alfabeto = at1.alfabeto;
                inicial = at1.inicial;
                estadosFinais = at1.estadosFinais;
                transicoes = at1.transicoes;
                for(Estado aux: estadosFinais)//pra cada um dos estados finais adiciona-se uma transicao lambda para o estado inicial
                    transicoes.add(new Transicao(aux,inicial,Data.lambda));
                if(!estadosFinais.contains(inicial))//se o estado inicial nao for final, ele se torna final
                    estadosFinais.add(inicial);
                break;
            default: break;
        }
    }
    
    public static String alfabetocat(String alfabeto1,String alfabeto2)//concatena os dois alfabetos sem repetir simbolos
    {
        boolean presente = false;
        String retorno = "";
        for(char aux: alfabeto1.toCharArray()){//percorre o alfabeto1 copiando para a string de retorno cada posicao dele caso o char presente nessa posicao nao esteja presente no retorno
            for(int i =0;i<retorno.length();i++)
                if (retorno.charAt(i) == aux)
                    presente = true;
            
            if(presente){
                presente = false;
                continue;
            }
            retorno = retorno + aux;
        }
        
        for(char aux: alfabeto2.toCharArray()){//percorre o alfabeto2 copiando para a string de retorno cada posicao dele caso o char presente nessa posicao nao esteja presente no retorno
            for(int i =0;i<retorno.length();i++)
                if (retorno.charAt(i) == aux)
                    presente = true;
            
            if(presente){
                presente = false;
                continue;
            }
            retorno = retorno + aux;
        }
        
        
        
        return retorno;
    }
    
    public static Automato create(String polonesa){//cria um automato a partir de uma expressao em notacao polonesa
        
        Deque<Automato> pilha = new LinkedList<>();//instancia um deque que ira simular o funcionamento de uma pilha
        for(char a: polonesa.toCharArray())//pra cada char na expressao polonesa
        {
            if(a=='+' || a=='.')//se esse char for + ou ., desempilha os dois primeiros automatos, aplica a operacao de Uniao ou concatenacao respectivamente e empilha o automato resultante
            {
                Automato at2 = pilha.removeFirst();
                Automato at1 = pilha.removeFirst();
                pilha.addFirst(new Automato(at1,at2,a));
                continue;
            }
            if(a=='*'){//se esse char for *, desempilha o primeiro elemento da pilha, aplica o fecho de kleene no automato e insere ele novamente no topo da pilha
                pilha.addFirst(new Automato(pilha.removeFirst(),null,a));
                continue;
            }
            pilha.addFirst(new Automato(a));//se esse char nao for nenhum dos anteriores, apenas cria um automato que o reconhece e empilha
        }
        return pilha.removeFirst();//ao final, só teremos um elemento na pilha, esse elemento eh o automato que reconhece a linguagem representada pela notacao polonesa na string mandada por parametro
    }
    
    public String toString(){//toString da classe Automato, utilizado para fins de debug
        String retorno = "";
        
        retorno = retorno +"\nEstado Inicial: " + inicial;
        retorno = retorno +"\nEstados: " + estados.toString();
        retorno = retorno +"\nAlfabeto: " + alfabeto;
        retorno = retorno +"\nTransicoes: " + transicoes.toString();
        retorno = retorno +"\nEstados Finais: " + estadosFinais.toString();
        
        return retorno;
    }
    
    boolean isFinal(Estado e){//retorna true se o estado for final e false se nao o for
        return estadosFinais.contains(e);
    }
    
    public int consome (String texto){ /*consome parcial ou totalmente a string mandada por parametro
        no automato da instancia. Percorre o automato em um algoritmo recursivo 
        como uma busca em profundidade percorre um grafo, isso foi necessario ja que em um AFN
        principalmente com transicoes lambda, a partir de um estado pode-se ter varios caminhos diferentes
        que podem ser seguidos durante o processo, assim, cada caminho possivel eh testado separadamente com
        a recursao.
        Retorna um inteiro que representa a quantidade de chars consumidos da string ate a chegada 
        em estados finais. Cada vez que passa por um estado final esse valor é salvo e no final retorna 
        o maior desses valores, ou seja, o maximo que pode ser consumido da string ainda chegando em um 
        estado final.*/
        
        Data.contagemFinal = 0;
        Data.contagemTotal = 0;
        int auxiliar = recursao(inicial,texto);//inicia o processo da recursao mandando o estado atual como sendo o inicial do automato
        
        return auxiliar;
    }
    
    public int recursao(Estado atual, String restoDoTexto){
        ArrayList<RetornoAuxiliar> retorno = new ArrayList<>();//array onde eh salva a quantidade de chars consumida
        if(restoDoTexto.length() == 0)//se atingir o final da string, significa que nao tem mais nada pra consumir, logo, retorna 0
            return 0;
        char simbolo = restoDoTexto.charAt(0);//
        if(estadosFinais.contains(atual))
            retorno.add(new RetornoAuxiliar(true,Data.contagemTotal));
        int consumidos;
        ArrayList<Transicao> possiveis = new ArrayList<>();
        for(Transicao aux: transicoes)
        {
            if(aux.partida == atual && (simbolo == aux.simbolo || aux.simbolo == Data.lambda))
            {
                possiveis.add(aux);
            }
        }
        
        if(!possiveis.isEmpty())
        {
            for(Transicao aux: possiveis)
            {
                if(aux.simbolo == Data.lambda)
                {
                    consumidos = recursao(movimenta(aux),restoDoTexto);
                }else{
                    consumidos = recursao(movimenta(aux),restoDoTexto.substring(1))+1;
                }
                if(consumidos != -1)
                    retorno.add(new RetornoAuxiliar(true,consumidos));
            }
        }
        
        return RetornoAuxiliar.maiorRetorno(retorno);
    }
    
    public Estado movimenta (Transicao trans){
        return trans.chegada;
    }
    
    
}
    /*public RetornoAuxiliar recursao(Estado atual,String restanteTexto){
        
        
        ArrayList<RetornoAuxiliar> retorno = new ArrayList<>();
        retorno.add(new RetornoAuxiliar(false,0));
        char teste;
        RetornoAuxiliar auxiliar;
        ArrayList<Transicao> possiveis = new ArrayList<>();
        System.out.println("imprimindo o restante do texto: " + restanteTexto);
        if(restanteTexto.charAt(0) != Data.lambda)
            teste = restanteTexto.charAt(0);
        else {
            System.out.println("resultado do contains" + estadosFinais.contains(atual));
            retorno.add(new RetornoAuxiliar(estadosFinais.contains(atual),0));
            teste = Data.lambda;
            System.out.println(retorno.toString());
        }
            for(Transicao aux: transicoes)
                {
                   if(aux.partida == atual && (aux.simbolo == teste || aux.simbolo == Data.lambda)){
                        possiveis.add(aux);
                   }
              }
              if(possiveis.isEmpty())
              {
                  retorno.add(new RetornoAuxiliar(estadosFinais.contains(atual),0));
                  return RetornoAuxiliar.maiorRetorno(retorno);
              }
                  
              for(Transicao aux: possiveis){
                  if(aux.simbolo == Data.lambda){
                      
                    System.out.println("Chamando recursao sem consumir nada contagem " + Data.contagemTotal);
                      auxiliar = recursao(movimenta(aux),restanteTexto);
                    auxiliar.tamanho = Data.contagemTotal;
                      if(estadosFinais.contains(atual)){
                          Data.contagemFinal = Data.contagemTotal;
                          
                          retorno.add(new RetornoAuxiliar(true,Data.contagemFinal));
                          //auxiliar.estadoFinal = false;
                          
                      }
                  }
                  else {
                      System.out.println("Chamando recursao consumindo " + aux.simbolo + " contagem " + Data.contagemTotal);
                      Data.contagemTotal++;
                      auxiliar = recursao(movimenta(aux),restanteTexto.substring(1));
                      
                      auxiliar.tamanho = Data.contagemTotal;
                      if(estadosFinais.contains(atual)){
                          Data.contagemFinal = Data.contagemTotal;
                          
                          retorno.add(new RetornoAuxiliar (true,Data.contagemFinal));
                          //auxiliar.estadoFinal = false;
                          continue;
                      }
                      
                      retorno.add(auxiliar);
                  }
                  
              }
              auxiliar = RetornoAuxiliar.maiorRetorno(retorno);
              
              
        return auxiliar;
    }*/
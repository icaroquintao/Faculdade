/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PontoExtra;

import Structures.Automato;
import Structures.Estado;
import Structures.Transicao;
import Support.Data;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Guilherme Marx
 */
public class AutomatoDeterministico {
    ArrayList<Estado> estados;
    String alfabeto;
    ArrayList<Transicao> transicoes;
    Estado inicial;
    ArrayList<Estado> estadosFinais;
    Estado atual;
    
    public AutomatoDeterministico(Automato T){
        estados = new ArrayList<>();
        transicoes = new ArrayList<>();
        estadosFinais = new ArrayList<>();
        alfabeto = T.getAlfabeto();
        inicial = T.getInicial();
        Transicao auxiliar;
        ArrayList<Transicao> transicoesLambda = new ArrayList<>();
        ArrayList<Estado> fechoLambda = new ArrayList<>();
        
        Estado naoAceitacao = new Estado();
        estados.add(naoAceitacao);
        for(Transicao trans: T.getTransicoes())
        {
            transicoes.add(new Transicao(trans.getPartida(),trans.getChegada(),trans.getSimbolo()));
        }
        for(Estado e: T.getEstados())
        {
            estados.add(e);
        }
        for(Estado e: T.getEstadosFinais())
        {
            if(!estadosFinais.contains(e))
            estadosFinais.add(e);
        }
        alfabeto = T.getAlfabeto();
        inicial = T.getInicial();
        
        for(int i=0;i<transicoes.size();i++)
        {
            auxiliar = transicoes.get(i);
            
            if(auxiliar.getSimbolo() == Data.lambda)
            {
                transicoes.remove(auxiliar);
                i--;
                transicoesLambda.add(auxiliar);
            }
        }
        
        while(!transicoesLambda.isEmpty())//remove todas as transicoes lambda do automato
        {
            auxiliar = transicoesLambda.get(0);
            transicoesLambda.remove(auxiliar);
            if(isFinal(auxiliar.getChegada())&&!estadosFinais.contains(auxiliar.getPartida()))
                estadosFinais.add(auxiliar.getPartida());
            if(!hasLambda(auxiliar.getChegada(),transicoesLambda))
            {
                for(int i=0;i<transicoes.size();i++)
                    if(auxiliar.getChegada() == transicoes.get(i).getPartida())
                        transicoes.add(new Transicao(auxiliar.getPartida(),transicoes.get(i).getChegada(),transicoes.get(i).getSimbolo()));
            }
            else{
                
                for(int i=0;i<transicoesLambda.size();i++){
                    if(auxiliar.getChegada() == transicoesLambda.get(i).getPartida())
                    {
                        
                        transicoesLambda.add(new Transicao(auxiliar.getPartida(),transicoesLambda.get(i).getChegada(),Data.lambda));
                        //transicoesLambda.remove(i);
                        //i--;
                    }
            }}
            
        } 
        
        
        //agora falta remover transicoes iguais a partir de um mesmo estado
        List<List<List<Estado>>> tabela = new ArrayList<>();
        for(int i=0;i<estados.size();i++){
            tabela.add(new ArrayList<>());
            for(int j=0;j<alfabeto.length();j++){
                tabela.get(i).add(new ArrayList<>());
                for(Transicao a: transicoes)
                {
                    if (a.getPartida() == estados.get(i) && a.getSimbolo() == alfabeto.charAt(j))
                        tabela.get(i).get(j).add(a.getChegada());
                    
                }
                
            }
        }
        Estado aux;
        
        while(temTransicoesMultiplas(tabela)){
            
            int linha = tabela.size();
             for(int i=0;i<linha;i++)
            for(int j=0;j<tabela.get(i).size();j++)
                if (tabela.get(i).get(j).size() > 1){
                    estados.add(new Estado());
                    for(Estado teste: tabela.get(i).get(j))
                        if(isFinal(teste)&& !isFinal(estados.get(estados.size()-1)))
                            estadosFinais.add(estados.get(estados.size()-1));
                            
                    transicoes.add(new Transicao(estados.get(i),estados.get(estados.size() -1),alfabeto.charAt(j)));
                    tabela.add(new ArrayList<>());
                    for(int k=0;k<alfabeto.length();k++)
                        tabela.get(estados.size()-1).add(new ArrayList<>());
                    while(tabela.get(i).get(j).size() != 0)
                    {
                        aux = tabela.get(i).get(j).remove(0);
                        removeTransicao(estados.get(i),aux);
                        for(int k=0;k<alfabeto.length();k++)
                        {
                           
                            tabela.get(estados.size()-1).get(k).addAll(tabela.get(estados.indexOf(aux)).get(k));
                        }
                    }
                    tabela.get(i).get(j).add(estados.get(estados.size()-1));
                    
                    
                    
                }
                 
             for(int i=0; i<tabela.size();i++)
                 for(int j=0; j<tabela.get(i).size();j++)
                    System.out.println("Linha " + i + " Coluna " + j + " " + tabela.get(i).get(j));
        }
         for(int i=0; i<tabela.size();i++)
                 for(int j=0; j<tabela.get(i).size();j++)
                     if(!tabela.get(i).get(j).isEmpty()){
                     if(!existeTransicao(estados.get(i),tabela.get(i).get(j).get(0),alfabeto.charAt(j)))
                         transicoes.add(new Transicao(estados.get(i),tabela.get(i).get(j).get(0),alfabeto.charAt(j)));
                     }else transicoes.add(new Transicao(estados.get(i),naoAceitacao,alfabeto.charAt(j)));
        removeEstadosInalcansaveis();
        
        
        
    }
    
    public boolean existeTransicao(Estado origem,Estado destino,char simbolo){
        for(Transicao a: transicoes)
            if(a.getPartida() == origem && a.getChegada() == destino && a.getSimbolo() == simbolo)
                return true;
        return false;
    }
    public void removeTransicao (Estado origem, Estado destino)
    {
        for(Transicao a: transicoes)
            if(origem == a.getPartida() && destino == a.getChegada()){
                transicoes.remove(a);
                return;
            }
    }
    public boolean temTransicoesMultiplas(List<List<List<Estado>>> tabela){
        for(int i=0;i<tabela.size();i++)
            for(int j=0;j<tabela.get(i).size();j++)
                if (tabela.get(i).get(j).size() > 1)
                    return true;
        return false;
    }
    public void removeEstadosInalcansaveis(){
        ArrayList<Estado> alcansaveis = new ArrayList<>();
        ArrayList<Transicao> transicoesUsadas = new ArrayList<>();
        
        Estado auxiliar ;
        alcansaveis.add(inicial);
        
        for(int i=0;i<alcansaveis.size();i++){
            auxiliar = alcansaveis.get(i);
            for(Transicao t:transicoes)
                if(t.getPartida().getId() == auxiliar.getId()){
                    if(!alcansaveis.contains(t.getChegada()))
                        alcansaveis.add(t.getChegada());
                    
                }
                    
            }
        
        estados = alcansaveis;
        
        for(int i=0;i<estadosFinais.size();i++){
            if(!estados.contains(estadosFinais.get(i)))
            {
                estadosFinais.remove(i);
                i--;
            }
        }
        
        for(Transicao T: transicoes){
            if(estados.contains(T.getChegada()) && estados.contains(T.getPartida()))
                transicoesUsadas.add(T);
        }
        transicoes = transicoesUsadas;
        
    }
    
    public String getAlfabeto(){return this.alfabeto;}
    boolean isFinal(Estado e){
        for(Estado aux: estadosFinais)
            if(aux.getId() == e.getId())
                return true;
        return false;
    }
    boolean hasLambda(Estado e,ArrayList<Transicao> transicoesLambda){
        for(Transicao t:transicoesLambda)
            if(t.getPartida() == e)
                return true;
        
        return false;
        
    }
    
    public String toString(){
        String retorno = "";
        
        retorno = retorno +"\nEstado Inicial: " + inicial;
        retorno = retorno + "\nEstados: " + estados.toString();
        retorno = retorno +"\nAlfabeto: " + alfabeto;
        retorno = retorno +"\nTransicoes: " + transicoes.toString();
        retorno = retorno +"\nEstados Finais: " + estadosFinais.toString();
        
        return retorno;
    }
    
    public Estado getInicial(){return this.inicial;}

    public ArrayList<Estado> getEstados() {
        return estados;
    }

    public ArrayList<Transicao> getTransicoes() {
        return transicoes;
    }

    public ArrayList<Estado> getEstadosFinais() {
        return estadosFinais;
    }
    
}

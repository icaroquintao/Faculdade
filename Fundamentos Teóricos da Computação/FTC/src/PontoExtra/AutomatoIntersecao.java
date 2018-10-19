/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PontoExtra;

import Structures.Automato;
import Structures.Estado;
import Structures.Transicao;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Guilherme Marx
 */
public class AutomatoIntersecao {
    ArrayList<EstadoIntersecao> estados;
    String alfabeto;
    ArrayList<TransicaoIntersecao> transicoes;
    EstadoIntersecao inicial;
    ArrayList<EstadoIntersecao> estadosFinais;
    EstadoIntersecao atual;
    
    public EstadoIntersecao find(int id1,int id2){
        for(EstadoIntersecao aux: estados)
            if(id1 == aux.getId1() && id2 == aux.getId2())
                return aux;
        return null;
    }
    
    public AutomatoIntersecao(AutomatoDeterministico a1, AutomatoDeterministico a2){
        //System.out.println(a1.toString());
        //System.out.println(a2.toString());
        estados = new ArrayList<>();
        alfabeto = Automato.alfabetocat(a1.getAlfabeto(),a2.getAlfabeto());
        transicoes = new ArrayList<>();
        inicial = new EstadoIntersecao(a1.getInicial().getId(),a2.getInicial().getId());
        estados.add(inicial);
        estadosFinais = new ArrayList<>();
        
        for(Estado e1: a1.getEstados()){
            for(Estado e2: a2.getEstados()){
                estados.add(new EstadoIntersecao(e1.getId(),e2.getId()));
                if(a1.getEstadosFinais().contains(e1) && a2.getEstadosFinais().contains(e2)){
                    estadosFinais.add(estados.get(estados.size()-1));
                    //System.out.println("Estado "+estados.get(estados.size()-1).toString()+" adicionado aos estados finais");
                }
            }
        }
       
        for(EstadoIntersecao aux: estados){
            for(Transicao t: a1.getTransicoes()){
                if(t.getPartida().getId() == aux.getId1()){
                    for(Transicao t2: a2.getTransicoes())
                    {
                        if(t2.getPartida().getId() == aux.getId2() && t2.getSimbolo() == t.getSimbolo())
                            transicoes.add(new TransicaoIntersecao(aux,find(t.getChegada().getId(),t2.getChegada().getId()),t.getSimbolo()));
                    }
                }
            }
        }
         removeEstadosInalcansaveis();
         //System.out.println(toString());
        
        
        
        
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
    
    public void removeEstadosInalcansaveis(){
        ArrayList<EstadoIntersecao> alcansaveis = new ArrayList<>();
        ArrayList<TransicaoIntersecao> transicoesUsadas = new ArrayList<>();
        
        EstadoIntersecao auxiliar ;
        alcansaveis.add(inicial);
        
        for(int i=0;i<alcansaveis.size();i++){
            auxiliar = alcansaveis.get(i);
            for(TransicaoIntersecao t:transicoes)
                if(t.getPartida().getId1() == auxiliar.getId1() && t.getPartida().getId2() == auxiliar.getId2()){
                    if(!alcansaveis.contains(t.getChegada()))
                        alcansaveis.add(t.getChegada());
                    
                }
                    
            }
        
        estados = alcansaveis;
        
        for(int i=0;i<estadosFinais.size();i++){
            if(!alcansavel(estadosFinais.get(i)))
            {
                
                    //System.out.println("Estado " + estadosFinais.get(i) + " removido dos estados finais");
                    estadosFinais.remove(i);
                    i--;
                
            }
        }
        
        for(TransicaoIntersecao T: transicoes){
            if(estados.contains(T.getChegada()) && estados.contains(T.getPartida()))
                transicoesUsadas.add(T);
        }
        transicoes = transicoesUsadas;
        
    }
    
    public boolean alcansavel(EstadoIntersecao e){
        for(EstadoIntersecao aux: estados)
            if(aux.getId1() == e.getId1() && aux.getId2() == e.getId2())
                return true;
        return false;
    }
    
    public boolean temIntersecao(){
        if(estadosFinais.isEmpty())
            return false;
        return true;
    }
}

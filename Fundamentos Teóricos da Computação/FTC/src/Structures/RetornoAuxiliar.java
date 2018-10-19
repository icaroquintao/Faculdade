/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Structures;

import java.util.ArrayList;

/**
 *
 * @author Guilherme Marx
 */
public class RetornoAuxiliar {
    boolean estadoFinal;
    int tamanho;
    
    public RetornoAuxiliar (boolean bool, int tamanho){
        estadoFinal = bool;
        this.tamanho = tamanho;
    }
    
    public static int maiorRetorno(ArrayList<RetornoAuxiliar> teste){
        /*RetornoAuxiliar retorno = new RetornoAuxiliar(false,0);
        
        for(RetornoAuxiliar aux: teste){
            System.out.println(aux);
            if(aux.estadoFinal && !retorno.estadoFinal)
                retorno = aux;
            if(!aux.estadoFinal && !retorno.estadoFinal)
                retorno.tamanho = aux.tamanho>retorno.tamanho? aux.tamanho:retorno.tamanho;
            if(aux.estadoFinal && retorno.estadoFinal)
                retorno.tamanho = aux.tamanho>retorno.tamanho? aux.tamanho:retorno.tamanho;
        }
        return retorno;*/
        
        int maiorValor = -1;
        for(RetornoAuxiliar auxiliar: teste)
            if(auxiliar.estadoFinal && auxiliar.tamanho > maiorValor)
                maiorValor = auxiliar.tamanho;
        
        return maiorValor;
    }
    
    
    public String toString(){
        return "" + estadoFinal +" " + tamanho;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PontoExtra;

/**
 *
 * @author Guilherme Marx
 */
public class TransicaoIntersecao {
    EstadoIntersecao partida;
    EstadoIntersecao chegada;
    char simbolo;
    
    public TransicaoIntersecao(EstadoIntersecao partida, EstadoIntersecao chegada, char simbolo)
    {
        this.partida = partida;
        this.chegada = chegada;
        this.simbolo = simbolo;
    }

    public EstadoIntersecao getPartida() {
        return partida;
    }

    public EstadoIntersecao getChegada() {
        return chegada;
    }

    public char getSimbolo() {
        return simbolo;
    }
    
    public String toString(){
        return "\nInicial: " + partida.toString() + "\nChegada:" + chegada.toString() +"\nSimbolo: " +simbolo;
    }
}

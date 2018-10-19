/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Structures;

/**
 *
 * @author Guilherme Marx
 */
public class Transicao {
    Estado partida, chegada;
    
    char simbolo;

    public Estado getPartida() {
        return partida;
    }

    public Estado getChegada() {
        return chegada;
    }

    public char getSimbolo() {
        return simbolo;
    }
    
    public Transicao(Estado partida, Estado chegada, char simbolo)
    {
        this.partida = partida;
        this.chegada = chegada;
        this.simbolo = simbolo;
    }
    
    public String toString(){
        return "\nInicial: " + partida.toString() + "\nChegada:" + chegada.toString() +"\nSimbolo: " +simbolo;
    }
}

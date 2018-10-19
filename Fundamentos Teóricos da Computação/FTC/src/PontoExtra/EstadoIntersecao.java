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
public class EstadoIntersecao {
    int id1,id2;
    
    public EstadoIntersecao(int id1,int id2)
    {
        this.id1 = id1;
        this.id2 = id2;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public int getId2() {
        return id2;
    }

    public void setId2(int id2) {
        this.id2 = id2;
    }
    
    public String toString(){
        return String.format("Ids: %d %d", id1,id2);
    }
    
    public static boolean isEqual(EstadoIntersecao e1,EstadoIntersecao e2)
    {
        return (e1.getId1() == e2.getId1() && e1.getId2() == e2.getId2());
    }
}

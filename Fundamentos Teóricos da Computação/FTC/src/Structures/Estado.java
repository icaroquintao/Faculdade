/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Structures;

import Support.Data;

/**
 *
 * @author Guilherme Marx
 */
public class Estado {
    int id;

    public int getId() {
        return id;
    }
    
    public Estado(){
        this.id = Data.id;
        Data.id++;
    }
    
    public Estado(int id){
        this.id = id;
    }
    
    public String toString(){
        return "Id: " + id;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package simpleclient;

import java.util.Scanner;

/**
 *
 * @author Poxete
 */
public class MainClient {
    public static void main(String[] args) {
        // TODO code application logic here
        
        Scanner in = new Scanner(System.in);
        
        System.out.println("Digite o ip do servidor: ");
        String serverIP = in.nextLine();
        
        MyClientSocket client = new MyClientSocket(serverIP);
        client.client();
    }
}

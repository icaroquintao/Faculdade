/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.redes;

import java.io.BufferedReader;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author arthu
 */
public class ClienteTCP {
    public static void main(String[] args) throws ClassNotFoundException {
        
        
        
        try {
            String numeros = "";
        
            System.out.println("Insira os 10 numeros a serem ordenados:");
            Scanner s = new Scanner(System.in);
            int i = 0;

            while(i != 10) {
                numeros = numeros + s.next() + " ";
                i++;
            }
            numeros = numeros + "\n";
            
            Socket clienteSocket = new Socket("127.0.0.1",5050);
            System.out.println("Estabelecendo conexão com o Servidor...");
            DataOutputStream outToServer = new DataOutputStream(clienteSocket.getOutputStream());
            BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clienteSocket.getInputStream()));
            
            System.out.println(numeros.toString());
            outToServer.writeBytes(numeros);
            System.out.println("Enviando mensagem para o servidor...");
            
            String ordem = inFromServer.readLine();
            System.out.println("Mensagem recebida");
            System.out.println("Númros Ordenados:" + ordem.toString());
            
            outToServer.close();
            inFromServer.close();
            clienteSocket.close();
            
        } catch (IOException ex) {
            Logger.getLogger(ClienteTCP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

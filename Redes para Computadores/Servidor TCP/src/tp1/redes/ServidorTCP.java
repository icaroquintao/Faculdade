/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.redes;

/**
 *
 * @author arthur
 */

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.*;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServidorTCP {
    
    public static void main(String[] args) {
        
        
        try {
            ServerSocket servidor = new ServerSocket(5050); //Servidor ouvindo na porta 1666
            System.out.println("Aguardando conexão...");
            
            while (true) {      
                
                
                
                Socket cliente = servidor.accept();
                System.out.println("Conexão estabelecida...");
                DataOutputStream outToClient = new DataOutputStream(cliente.getOutputStream());
                BufferedReader inFromClient = new BufferedReader(new InputStreamReader(cliente.getInputStream()));
                
                System.out.println("Processando dados...");
                
                String numerosCliente = "";
                numerosCliente = inFromClient.readLine();
                
                String[] numeros = numerosCliente.split(" ");
                int[] num = new int[numeros.length];
                int i = 0;
                for (String s : numeros) {
                    num[i] = Integer.parseInt(s);
                    i++;
                }
                Arrays.sort(num);
                
                numerosCliente = "";
                
                for (int j = 0; j < num.length; j++) {
                    numerosCliente += num[j] + " ";
                    
                }
                
                System.out.println("Transmitindo mensagem...");
                outToClient.writeBytes(numerosCliente);
                inFromClient.close();
                outToClient.close();
                cliente.close();
                servidor.close();
                
            }
        } catch (IOException ex) {
            Logger.getLogger(ServidorTCP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

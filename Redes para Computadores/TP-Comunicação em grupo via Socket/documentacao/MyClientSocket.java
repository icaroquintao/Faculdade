/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package simpleclient;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.Scanner;
/**
 *
 * @author Poxete
 */
public class MyClientSocket {

    /**
     * @param args the command line arguments
     */
    private String serverIP = "";
    private DataInputStream dis = null;
    private DataOutputStream dos = null;
    private String requestType = "";
    static Scanner in = new Scanner(System.in);
    
    public MyClientSocket(String serverIP) {
        this.serverIP = serverIP;
    }
    
    

        
     public void client(){
         try{
             Socket connection = new Socket (serverIP,8080);
             boolean fim = false;
            do{
                
            
            dis = new DataInputStream(connection.getInputStream());
            dos = new DataOutputStream(connection.getOutputStream());
            
            //aqui define qual o requestType
            
             System.out.println("1. Entrar no grupo.");
             System.out.println("2. Sair do grupo");
             System.out.println("3. Mandar mensagem no grupo.");
             System.out.println("4. Escutar grupo por 15 segundos.");
             System.out.println("5. Sair");
             System.out.println("Sua opcao: ");
             int opcao = in.nextInt();
             in.nextLine();
             switch(opcao){
                 case 1: 
                        joinGroup(connection,dis,dos);
                        break;
                 case 2: //sai do grupo
                        leaveGroup(connection,dis,dos);
                        break;
                 case 3: sendMessage(connection,dis,dos);
                        break;
                 case 4: listenGroup(connection,dis,dos);
                           break;
                 case 5: fim = true;
                        break;
                 default: System.out.println("Opcao nao valida. Tente novamente.");
             }
            
            }while(!fim);
            if(fim){ 
                dis.close();
                dos.close();
                connection.close();
            }
         }catch(Exception e){
             e.printStackTrace();
         }
     }

        private void joinGroup(Socket connection, DataInputStream dis, DataOutputStream dos) {
            try{
                requestType = "Join group";
                
                dos.writeUTF(requestType);
                dos.flush();
                
                String answer = dis.readUTF();
                System.out.println(answer);
           
            }catch(Exception e){
                e.printStackTrace();
            }
            
            
    }

    private void leaveGroup(Socket connection, DataInputStream dis, DataOutputStream dos) {
           try{
                requestType = "Leave group";
                
                dos.writeUTF(requestType);
                dos.flush();
                
                String answer = dis.readUTF();
                System.out.println(answer);
                
               
            }catch(Exception e){
                e.printStackTrace();
            }
    
    }

    private void sendMessage(Socket connection, DataInputStream dis, DataOutputStream dos) {
        System.out.println("Digite a mensagem a ser enviada ao grupo: ");
        String msg = in.nextLine();
            try{
                requestType = "Send to group";
                
                dos.writeUTF(requestType);
                
                
                dos.writeUTF(msg);
                dos.flush();
                
                
                
                
            }catch(Exception e){
                e.printStackTrace();
            }
        
    
    }

    private void listenGroup(Socket connection, DataInputStream dis, DataOutputStream dos) {
        int i=0;
        do{
            try{
                
                while (dis.available()>0){
                    String message = dis.readUTF();
                    System.out.println(message);
                }
                Thread.sleep(1000);
                i++;
                
            }catch(Exception e){
            }
        }while(i<15);
    }
        
        
}

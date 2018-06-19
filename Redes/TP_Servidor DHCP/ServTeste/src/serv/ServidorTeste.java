package serv;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class ServidorTeste {
    private static ServerSocket sr;

    public static void main(String[] args) {
        try {
           registrarServidor();
        sr = new ServerSocket(3322);
            while (true) {
                System.out.print("Esperando alguém se conectar...");
                Socket conexao = sr.accept();
                System.out.println("Conectou!");

                BufferedReader entrada = new BufferedReader(new InputStreamReader(conexao.getInputStream()));
                PrintStream saida = new PrintStream(conexao.getOutputStream());
                String linh = entrada.readLine();
                
          
                System.out.println("Valor recebido");
                   
                saida.println(linh);
                    
                System.out.println("Enviando valor de volta para o cliente");
                linh = entrada.readLine();
                
        conexao.close();
            }
        } catch (IOException e) {
            System.out.println("IOException: " + e);
        }
    }

    public static void registrarServidor() {
        try {
            System.out.print("Registrando no Servidor de Nomes...");

            Socket conexao = new Socket("192.168.1.105", 3256);
            PrintStream saida = new PrintStream(conexao.getOutputStream());
            System.out.println("Enviando para o servidor!");
            saida.println("SERVIDOR,fib,192.168.1.105");

            conexao.close();
            saida.close();
        } catch (IOException e) {
            System.out.println("IOException: " + e.getMessage());
        }
    }

}
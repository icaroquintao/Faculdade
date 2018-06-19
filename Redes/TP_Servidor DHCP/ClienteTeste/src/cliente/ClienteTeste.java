package cliente;

import java.io.*;
import java.net.*;

public class ClienteTeste {
    

    public static void main(String[] args) {
        try {
        String IPServer = getIPServidor();
                Socket conexao = new Socket(IPServer, 3257);
                BufferedReader entrada = new BufferedReader(new InputStreamReader(conexao.getInputStream()));
                PrintStream saida = new PrintStream(conexao.getOutputStream());
                BufferedReader teclado = new BufferedReader(new InputStreamReader(System.in));

                String linha = "";
                    
                    
                while (true) {
                    System.out.print("> ");
                    linha = teclado.readLine();
                    System.out.println("Enviando para o servidor!");
                    saida.println(linha);

                    linha = entrada.readLine();
                    
                    if (linha == null) {
                        System.out.println("Conexão encerrada!");
                        break;
                    }
                    else
                        System.out.println(linha);
                }
            
        } catch (IOException e) {
            System.out.println("IOException: " + e.getMessage());
        }
    }

    public static String getIPServidor() {
        String result = "";
        try {
            Socket conexao = new Socket("192.168.1.105", 3256);
            BufferedReader entrada = new BufferedReader(new InputStreamReader(conexao.getInputStream()));
            PrintStream saida = new PrintStream(conexao.getOutputStream());
            BufferedReader teclado = new BufferedReader(new InputStreamReader(System.in));

            String linha = "";
            String IPServer = "";

            System.out.print("> ");
            linha = teclado.readLine();
            System.out.println("Enviando para o servidor!");
            saida.println("CLIENTE," + linha);
            IPServer = entrada.readLine();

            if (IPServer == null)
                System.out.println("Conexão encerrada!");
            else
                result = IPServer;
            System.out.println("IP do Servidor: " + IPServer);

        } catch (IOException e) {
            System.out.println("IOException: " + e.getMessage());
        }
        return result;
    }
}

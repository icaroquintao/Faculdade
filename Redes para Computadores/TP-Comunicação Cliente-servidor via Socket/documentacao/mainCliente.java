import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class mainCliente {

	public static void main(String[] args) {
	
		
		Scanner in = new Scanner(System.in);
		
		System.out.printf("Informe os 10 numeros na mesma linha separados por espacos: ");
		String numero = in.nextLine();
		
		try {
			Socket conexao = new Socket("localhost", 55555); // Conectando ao servidor local na porta 5555
			System.out.println("Detalhes da conexao: " + conexao.toString());
			
			DataOutputStream saida = new DataOutputStream(conexao.getOutputStream()); // Canal de saida
			DataInputStream entrada = new DataInputStream(conexao.getInputStream()); // Canal de entrada
			
			
			System.out.println("Enviando os numeros lidos para o Servidor...");
			
			saida.writeUTF(numero); // Envia o numero lido para o servidor em formato de STRING codificada em UTF
			
			System.out.println("Esperando a resposta do Servidor");
			
			String resposta = entrada.readUTF(); // Recebe o resultado do Servidor em formato de STRING codificada em UTF
			
			System.out.println("Vetor ordenado: " + resposta);
			
			in.close();
			System.out.println("Encerrando conexao");
			conexao.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}

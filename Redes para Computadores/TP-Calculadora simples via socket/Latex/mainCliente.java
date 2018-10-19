import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class mainCliente {

	public static void main(String[] args) {
	
		String numero;
		String operacao;
		boolean valoresValidos = true;
		Scanner in = new Scanner(System.in);
		System.out.printf("Informe os 2 numeros na mesma linha separados por espacos: ");
		numero = in.nextLine();
		
		System.out.printf("Informe a operacao a ser realizada (+,-,*,/): ");
		operacao = in.nextLine();
			
		String dado = String.format(numero + " " + operacao);
		
		try {
			Socket conexao = new Socket("localhost", 55555); // Conectando ao servidor local na porta 5555
			System.out.println("Detalhes da conexao: " + conexao.toString());
			
			DataOutputStream saida = new DataOutputStream(conexao.getOutputStream()); // Canal de saida
			DataInputStream entrada = new DataInputStream(conexao.getInputStream()); // Canal de entrada
			
			
			System.out.println("Enviando os numeros lidos para o Servidor...");
			
			saida.writeUTF(dado); // Envia o numero lido para o servidor em formato de STRING codificada em UTF
			
			System.out.println("Esperando a resposta do Servidor");
			
			String resposta = entrada.readUTF(); // Recebe o resultado do Servidor em formato de STRING codificada em UTF
			
			System.out.println("Resultado da operacao: " + resposta);
			
			in.close();// fecha o scanner
			System.out.println("Encerrando conexao");
			conexao.close();// encerra a aplicacao do cliente
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}

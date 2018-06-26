package Exercicio1;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;

public class LerArquivo {

	//numero da porta dda conexao
	static int porta = 12258;
	private static ServerSocket servidor;	


	public static void LendoArquivo(String arquivo) {
		//inicio do try
		try {
			servidor = new ServerSocket(porta);
			//conexao com o cliente
			Socket conexao = servidor.accept();
			//gera fluxo de dados para transmissao
			DataOutputStream saida = new DataOutputStream(conexao.getOutputStream());
			//obtem o endereco do cliente
			SocketAddress s = conexao.getRemoteSocketAddress();

			//apenas para controle e conhecimento das etapas de processamento
			System.out.println("Passou");
			System.out.println("Enviando arquivo ao cliente" + s.toString()); //obtem o endereco do cliente
			
			//sleep
			Thread.currentThread();
			Thread.sleep(5000);

			//abaixo a parte de arquivo
			int vez = 0; //contador apenas para o controle visual
			//metodo de leitura utilizando o BufferedReader, já linkando com o arquivo
			BufferedReader leitor = new BufferedReader(new FileReader(new File(arquivo)));
			//efetua a leitura da primeira linha no arquivo, e salva na string texto
			String texto = leitor.readLine();
			//entra no loop
			while (true) {
				if (texto != null) { //se o texto for diferente de null, faz abaixo
					saida.writeUTF(texto); //envia a linha atual via rede
					vez++; //apenas para controle
					System.out.println("Enviou " + vez); //apenas para controle
				} else { //mágica e fim do if
					System.out.println("Fechando as conexoes"); //apenas para controle
					saida.writeUTF("TERMINATE"); //mágica
					leitor.close(); //fechando o leitor
					System.out.println("Conexoes fechadas"); //apenas para controle
					break;//saindo do loop
				}//fim do else
				texto = leitor.readLine();//lê a proxima linha e salva no texto
			}//fim do while
			
		}// fim do try
		
		//inicio dos catchs
		catch (FileNotFoundException e) {
			
			System.out.println("Não achou o arquivo");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("Erro de fim de arquivo");
			e.printStackTrace();
		} catch (InterruptedException e) {
			System.out.println("Erro de conexao interrupda");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//fim do método lendo arquivo
} //fim da classe

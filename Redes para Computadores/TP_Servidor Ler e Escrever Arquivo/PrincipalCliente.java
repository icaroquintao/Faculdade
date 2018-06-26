package Exercicio1;

import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class PrincipalCliente {

	//inicio método main
	public static void main(String[] args) {
		
		String enderecoServidor = "localhost"; //endereco do servidor
		int portaServidor = 12258; //porta de conexao
		String saida; //para receber as strings do servidor
		String arquivo = "arq2.txt"; //localização do arquivo em meu computador

		//inicio do try
		try {
			//criação ou localização do arquivo, juntamento do método para gravar no mesmo
			PrintWriter escrevendo = new PrintWriter(new BufferedWriter(new FileWriter(new File(arquivo))));
			
			//sleep
			Thread.currentThread();
			Thread.sleep(5000);

			//conexao com servidor
			Socket conexao = new Socket(enderecoServidor, portaServidor);
			
			//gera fluxo para receber dados
			DataInputStream entrada = new DataInputStream(conexao.getInputStream());
			
			//condição para entrar/sair do loop
			boolean fim = false;
			//inicio do loop while
			while (fim!=true) {
				saida = entrada.readUTF();//recebe a primeira linha como string
				if (!saida.equals("TERMINATE")) { //condicao para continuar no loop, até aparecer a palavra terminate
					escrevendo.println(saida); //grava no arquivo atravez do buff
				} else {
					entrada.close(); //fecha as conexoes com o servidor
					conexao.close();//fecha as conexoes com o servidor
					fim = true;//condicao para sair do loop aceita
				}				
				System.out.println(saida);//apenas para controle
			}
			escrevendo.flush(); //grava os arquivos do buff no arquivo
			escrevendo.close();//fecha o arquivo salvado
		}//fim do try
		catch (UnknownHostException e) {
			System.out.println("Erro de rede");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("Erro de sistema ");
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}//fim do main
}//fim da classe
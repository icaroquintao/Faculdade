package servnomes;

import java.io.*;
import java.net.*;
import java.util.ArrayList;

public class ServNomes {

	private static ServerSocket s;

	// Classe criada com os atributos
	
	public static class ListServers {
		String nome;
		String IP;

		public String getNome() {
			return nome;
		}

		public String getIP() {
			return IP;
		}

		protected ListServers() {
			nome = "";
			IP = "";
		}
	}

	// Array para armazenar o nome e os IP dos servidores
	private static ArrayList<ListServers> arrayListServers;

	

	public static void main(String[] args) {

		arrayListServers = new ArrayList<ListServers>();

		try {
			s = new ServerSocket(3256);
			// loop principal.
			while (true) {
				System.out.print("Esperando algu�m se conectar...");
				Socket conexao = s.accept();
				System.out.println(" Conectou!");
				BufferedReader entrada = new BufferedReader(new InputStreamReader(conexao.getInputStream()));
				PrintStream saida = new PrintStream(conexao.getOutputStream());

				String linha = entrada.readLine();
				System.out.println("Nome recebido");

				// Chamando a fun��o que usa o split para separar os atributos
				// passados por par�metros
				
				String origem;
				String cliente = "CLIENTE";
				String servidor = "SERVIDOR";

				origem = getOrigem(linha);

				// Condi��o para saber se a conex�o est� sendo do cliente ou do
				// servidor
				if (origem.equals(cliente)) {
					linha = getIPServer(linha);
					System.out.println("Devolvendo o IP e fazendo conex�o");
					saida.println(linha);

				} else if (origem.equals(servidor)) {
					System.out.println("Registrando o IP no Servidor de Nomes");
					registrarServidor(linha);

				}

			}

		}

		catch (IOException e) {
			// caso ocorra alguma excess�o de E/S, mostre qual foi
			System.out.println("IOException: " + e);
		}
	}

	// Fun��o Split
	public static String getOrigem(String texto) {
		String result = "";
		String[] parts = texto.split(",");
		result = parts[0]; // 004
		return result;
	}

	// Fun��o para registrar o servidor
	public static void registrarServidor(String texto) {
		String[] parts = texto.split(",");
		String nome = parts[1];
		String IP = parts[2];
		// Verificando se ele j� est� registrado
		Boolean jaExiste = false;
		for (int i = 0; i < arrayListServers.size(); i++) {
			if (arrayListServers.get(i).getNome().equals(nome) == true)
				jaExiste = true;
		}

		// Se a vari�vel estiver falsa, registra
		if (jaExiste == false) {
			ListServers listServers = new ListServers();
			listServers.nome = nome;
			listServers.IP = IP;
			arrayListServers.add(listServers);
		}
	}

	// Fun��o que percorre o Array para procurar o nome enviado pelo cliente
	// E retorna o IP se encontrado
	public static String getIPServer(String texto) {
		String result = "";
		String[] parts = texto.split(",");
		String nomeServidor = parts[1];
		for (int i = 0; i < arrayListServers.size(); i++) {
			if (arrayListServers.get(i).getNome().equals(nomeServidor) == true) {
				result = arrayListServers.get(i).getIP();
			}

		}
		return result;
	}

}
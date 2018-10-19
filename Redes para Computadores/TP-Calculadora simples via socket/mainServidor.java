import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class mainServidor {
	

	public static void main(String[] args) {
		
		System.out.print("Iniciando servidor na porta 55555\n");
		try {
		
			ServerSocket servidor = new ServerSocket(55555);
			Socket novaConexao = servidor.accept();// aceita a conexao do cliente
			
			DataOutputStream saida = new DataOutputStream(novaConexao.getOutputStream()); // Canal de saida
			DataInputStream entrada = new DataInputStream(novaConexao.getInputStream()); // Canal de entrada
			
			String valores = entrada.readUTF(); //recebe os valores enviados pelo cliente na forma "valor1 valor2 operacao"
			
			System.out.println("Valores recebido: " + valores);
			
			String[] n = valores.split(" ");//separa os valores recebidos cada um em uma string e a operacao em mais uma
			int valor1 = Integer.parseInt(n[0]),valor2 = Integer.parseInt(n[1]);//passa os valores nas strings para as variaveis inteiras
			
			int result = 0;
			boolean flag = false;
			switch(n[2]){//le a operacao a ser realizada e a realiza
				case "+": result = valor1+valor2;break;
				case "-": result = valor1-valor2;break;
				case "*": result = valor1*valor2;break;
				case "/": 
				if(valor2 == 0)
				{
					System.out.println("Nao eh possivel fazer divisao por zero!!!");
					flag = true;
					break;
				}
				result = valor1/valor2;break;
				default: break;
			}
			
			String resultado = new String();
			if(flag)
			{
				resultado = "Nao foi possivel concluir a operacao... Divisao por zero encontrada";
			}else
				resultado = String.format("%d",result);//salva na string resultado o valor calculado no switch

			System.out.println("Enviando resultado de volta pro cliente...");
			saida.writeUTF(resultado);//envia o resultado da operacao pro cliente
			
			System.out.println("Encerrando servidor...");
			novaConexao.close();//fecha a conexao com o cliente
			servidor.close();//fecha o servidor
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		

	}

}

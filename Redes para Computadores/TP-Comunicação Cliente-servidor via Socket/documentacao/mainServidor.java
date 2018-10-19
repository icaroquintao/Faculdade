import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;

public class mainServidor {
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.print("Iniciando servidor na porta 55555\n");
		try {
		
			ServerSocket servidor = new ServerSocket(55555);
			Socket novaConexao = servidor.accept();
			
			DataOutputStream saida = new DataOutputStream(novaConexao.getOutputStream()); // Canal de saida
			DataInputStream entrada = new DataInputStream(novaConexao.getInputStream()); // Canal de entrada
			
			String valores = entrada.readUTF();
			
			System.out.println("Vetor recebido: " + valores);
			
			System.out.println("Ordenando o vetor...");
			String[] n = valores.split(" ");
			
			int[] numeros = new int[10];
			
			for(int i=0;i<10;i++)
			{
                numeros[i] = Integer.parseInt(n[i]);
			}
			
			Arrays.sort(numeros);
			System.out.println("Vetor ordenado: ");
			for(int i =0; i<10;i++)
			{
                System.out.printf(numeros[i] + " ");
			}
			System.out.printf("\n");
			String resultado = new String();
			
			resultado = String.format(numeros[0] + " " + numeros[1] + " " + numeros[2] + " " + numeros[3] + " " + numeros[4] + " " + numeros[5] + " " + numeros[6] + " " + numeros[7] + " " + numeros[8]  + " " + numeros[9]);

			System.out.println("Enviando resultado de volta pro cliente...");
			saida.writeUTF(resultado);
			
			System.out.println("Encerrando servidor...");
			novaConexao.close();
			servidor.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		

	}

}

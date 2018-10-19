/*
Integrantes do grupo:
Guilherme Marx Ferreira Tavares - 14.1.8006
Leonardo Sartori De Andrade - 15.1.8061
Pedro Henrique Mendes Batista -14.1.8403
CLASSE RESPONSAVEL POR ARMAZENAR INFORMACOES DA EXECUCAO
 */
package Support;

import java.util.ArrayList;

/**
 *
 * @author Pedro Batista
 */
public class Data {
    public static ArrayList<String> tagsValidas;
    public static char lambda = (char) 955;
    public static int id = 0;
    public static int contagemTotal =0;
    public static int contagemFinal =0;
    public static boolean DivisaoEmArquivo = false;
    public static String NomeArquivoDivisao = "";
    public Data (){//Inicializa os dados da execucao
        Data.tagsValidas = new ArrayList<>();
    }
    
    public static ArrayList<String> getTagsValidas(){
        return Data.tagsValidas;
    }
}

/*
Integrantes do grupo:
Guilherme Marx Ferreira Tavares - 14.1.8006
Leonardo Sartori De Andrade - 15.1.8061
Pedro Henrique Mendes Batista -14.1.8403
CLASSE RESPONSAVEL PELA ENTRADA E SAIDA E COMUNICACAO COM O USUARIO
 */
package Support;

import ExecutionController.CommandInterpreter;
import java.util.Scanner;

/**
 *
 * @author Pedro Batista
 */
public class UserInterface {
    Scanner input;
    
    public UserInterface (){//Inicializa o Scanner
        input = new Scanner (System.in);
    }
    
    public String readLine(){//Retorna a linha digitada pelo usuario
        return codeEscape(input.nextLine());
    }
    
    public static void print(String texto){//Imprime TEXTO para o usuario
        System.out.printf(codeEscapeReverse(texto));
    }
    
    public static void printInfo(String texto){//Imprime mensagem INFO para o usuario
        System.out.printf("\n[INFO] " + codeEscapeReverse(texto) + "\n");
    }
    
    public static void printError(String texto){//Imprime mensagem ERROR para o usuario
        System.out.printf("\n[ERROR] " + codeEscapeReverse(texto) + "\n");
    }
    
    public static void printWarning(String texto){//Imprime mensagem WARNING para o usuario
        System.out.printf("\n[WARNING] " + codeEscapeReverse(texto));
    }
    
    public static boolean validateCommand(String comando){//Recebe um comando e chama a funcao correspondente a sua execucao
        
        String[] modulos = comando.split(" ");
        switch(modulos[0])
        {
            case ":f": if(modulos.length == 1|| modulos[1].isEmpty())
                {
                    UserInterface.printError("Comando incorreto.");
                    return false;
                }
                CommandInterpreter.f(modulos[1]);
                return true;
            case ":l": //CARREGA UM ARQUIVO COM A DEFINICAO DAS TAGS
                if(modulos.length == 1|| modulos[1].isEmpty())
                {
                    UserInterface.printError("Comando incorreto.");
                    return false;
                }
                CommandInterpreter.l(modulos[1]);
                return true;
            case ":o": //passa a mandar a saida do :p e :f pro arquivo
                
                if(modulos.length == 1|| modulos[1].isEmpty())
                {
                    UserInterface.printError("Comando incorreto.");
                    return false;
                }
                Data.DivisaoEmArquivo = !Data.DivisaoEmArquivo;
                Data.NomeArquivoDivisao = modulos[1];
                return true;
            case ":p": //realiza a divisao da string digitada pelo usuario
                if(modulos.length == 1 || modulos[1].isEmpty())
                {
                    UserInterface.printError("Comando incorreto.");
                    return false;
                }
                CommandInterpreter.p(comando.substring(3));
                return true;
                
            case ":q": System.exit(0);
            case ":s": //SALVA AS TAGS NO ARQUIVO ESPECIFICADO
                if(modulos.length == 1|| modulos[1].isEmpty())
                {
                    UserInterface.printError("Comando incorreto.");
                    return false;
                }
                CommandInterpreter.s(modulos[1]);
                return true;
            case ":t": //IMPRIME TODAS AS TAGS VALIDAS CORRENTES NO PROGRAMA
                for(String aux: Data.getTagsValidas())
                    UserInterface.print(aux+"\n");
                return true;
            default: UserInterface.printError("Comando invalido.");
                return false;
        }
        
        
        //return true;
    }
    
    public static String codeEscape(String texto){
        texto = texto.replaceAll("\\\\n", "ü");//ok ascii 129
        texto = texto.replaceAll("\\\\\\\\", "ä");//ok ascii 132
        texto = texto.replaceAll("\\\\\\*", "ë");//ok ascii 137
        texto = texto.replaceAll("\\\\\\+", "Ä");//ok ascii 142
        texto = texto.replaceAll("\\\\l", "ö");//ok ascii 148
        texto = texto.replaceAll("\\\\.", "ï");//ok ascii 139
        return texto;
    }
    
    public static String codeEscapeReverse(String texto){
        texto = texto.replaceAll("ü", "\\\\n");//ok ascii 129
        texto = texto.replaceAll("ä", "\\\\\\\\");//ok ascii 132
        texto = texto.replaceAll("ë" ,"\\\\\\*");//ok ascii 137
        texto = texto.replaceAll("Ä", "\\\\\\+");//ok ascii 142
        texto = texto.replaceAll("ö", "\\\\l");//ok ascii 148
        texto = texto.replaceAll("ï", "\\\\.");//ok ascii 139
        return texto;
    }
}

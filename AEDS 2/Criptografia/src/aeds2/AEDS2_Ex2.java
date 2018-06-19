
package aeds2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author Edgar_Alves
 */
public class AEDS2_Ex2 {
    
    public static void main(String[] args) throws IOException {
        
        FileReader fr = new FileReader("src\\aeds2\\mensagem.txt");
        BufferedReader breader = new BufferedReader(fr);
        
        ArrayList<String> linhas = new ArrayList<>();
        String linha = null;
        while(true){
            linha = breader.readLine();
            if(linha == null){
                break;
            }
            else{
                linhas.add(linha.toUpperCase());
            }
        }
        
        //System.out.println(linhas);
        Scanner input = new Scanner(System.in);
        System.out.print("Informe a chave para cifrar: ");
        String chave = input.nextLine().toUpperCase();
        
        char[] chave_char = chave.toCharArray();
        int[] chave_ascii = new int[chave_char.length];
        
        for (int i = 0; i < chave_char.length; i++) {
            chave_ascii[i] = (int) chave_char[i];
        }
        int ascii;
        //System.out.println("chave ascii " + Arrays.toString(chave_ascii));
        /*
        ascii = (int) chave.charAt(0);
        System.out.println("ASCII: " + ascii);
        */
        
        ArrayList<String> linhas_cifradas = new ArrayList<>();
        
        for (String line : linhas) {
            char[] letras = line.toCharArray();
            char[] letras_cifradas = new char[letras.length];
            //System.out.println(Arrays.toString(letras));
            int j = 0;
            for (int i = 0; i < letras.length; i++) {
                //índice não vai até o length, por isso >=
                if(j >= chave_ascii.length){
                    j = 0;
                }
                //System.out.println("J: " + j);
                ascii = (int) letras[i];
                //System.out.println("Ascii: " + ascii);
                if(ascii >= 65 && ascii <= 90){
                    int diferença = ascii - 64;
                    int pos = chave_ascii[j] + diferença;
                    //System.out.println("Pos: " + pos);
                    if(pos > 90){
                        pos = (pos-90) + 64;
                        //64 para poder voltar para o A
                    }
                    letras_cifradas[i] = (char) pos;
                    j++;
                }
                else{
                    letras_cifradas[i] = letras[i];
                }
            }
            String str_cifrada = "";
            for (int i = 0; i < letras_cifradas.length; i++) {
                str_cifrada += letras_cifradas[i];
            }
            
            //System.out.println("linha cifrada: " + str_cifrada);
            linhas_cifradas.add(str_cifrada);
        }
        System.out.println("");
        System.out.println("Mensagem original: " + linhas);
        System.out.println("Mensagem cifrada: " + linhas_cifradas);
        
        FileWriter fw = new FileWriter("src\\aeds2\\cifrado.txt");
        BufferedWriter bwriter = new BufferedWriter(fw);
        
        for (String line : linhas_cifradas) {
            bwriter.write(line);
            bwriter.newLine();
            bwriter.flush();
        }
        bwriter.close();
    }
}

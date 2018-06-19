
package aeds2;

/**
 *
 * @author Edgar_Alves
 */

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class AEDS2_Ex1 {

    public static void main(String[] args) throws IOException {
        /*
        File arq = new File("texto.txt");
        System.out.println(arq.exists());

        if (!arq.exists()) {
            try {
                if (arq.createNewFile()) {
                    System.out.println("Arquivo criado!");
                } else {
                    System.out.println("Não criou arquivo!");
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        */
        FileWriter fw = new FileWriter("src\\aeds2\\mensagem.txt");
        BufferedWriter bwriter = new BufferedWriter(fw);

        String msg = "";
        Scanner input = new Scanner(System.in);
        
        while (true) {
            System.out.print("Informe a mensagem: ");
            msg = input.nextLine().toUpperCase();
            if (msg.equals("FIM")) {
                break;
            } else {
                bwriter.write(msg);
                bwriter.newLine();
                bwriter.flush();
            }
        }
        bwriter.close();
    }
}

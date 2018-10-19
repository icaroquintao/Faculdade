/*
Integrantes do grupo:
Guilherme Marx Ferreira Tavares - 14.1.8006
Leonardo Sartori De Andrade - 15.1.8061
Pedro Henrique Mendes Batista -14.1.8403
CLASSE RESPONSAVEL PELA LEITURA E ESCRITA EM ARQUIVOS
 */
package Support;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

/**
 *
 * @author Pedro Batista
 */
public class FileController {
    String fileName;
    BufferedReader buffRead;
    BufferedWriter buffWrite;
    
    public FileController (String name)
    {
        this.fileName = name;
    }
    
    public ArrayList<String> read(){//Le o arquivo e retorna um ArrayList de Strings onde cada String corresponde a uma linha do arquivo
        ArrayList<String> retorno = new ArrayList<>();
        try{
            buffRead = new BufferedReader(new FileReader(fileName));
            
            String line = buffRead.readLine();
            
            while (line != null)
            {
                retorno.add(UserInterface.codeEscape(line));
                line = buffRead.readLine();
            }
            
            buffRead.close();
        }catch(Exception e){e.printStackTrace();}
        return retorno;
    }
    
    public void write(ArrayList<String> texto){//Escreve um ArrayList de strings no arquivo, sendo que cada String vira uma nova linha no arquivo
        try{
        buffWrite = new BufferedWriter(new FileWriter(fileName));
        for(String s: texto){
            buffWrite.append(s);
            buffWrite.newLine();
        }
        buffWrite.close();
        }catch(Exception e){e.printStackTrace();}
    }
    
    public boolean exists(){//Verifica se o arquivo existe
        File arq = new File(this.fileName);
        return arq.exists();
    }
}

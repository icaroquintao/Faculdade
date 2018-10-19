/*
Integrantes do grupo:
Guilherme Marx Ferreira Tavares - 14.1.8006
Leonardo Sartori De Andrade - 15.1.8061
Pedro Henrique Mendes Batista -14.1.8403
CLASSE RESPONSAVEL POR INTERPRETAR OS COMANDOS
 */
package ExecutionController;

import PontoExtra.AutomatoDeterministico;
import PontoExtra.AutomatoIntersecao;
import Structures.Automato;
import Structures.ExpressaoRegular;
import Support.Data;
import Support.FileController;
import Support.UserInterface;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author Leonardo Sartori
 */
public class CommandInterpreter {
    
    public static void l(String nomeDoArquivo){//Executa o comando :l
        
        FileController fc = new FileController(nomeDoArquivo);
        if(!fc.exists())
        {
            UserInterface.printError("Arquivo nao encontrado.");
            return;
        }
        
        ArrayList<String> tags = fc.read();
        boolean flag;
        for(String aux: tags)
        {
            try{
            if(ExpressaoRegular.validate(aux.split(" ")[1]) != null)
            {
                flag = false;
                
                for(String e: Data.getTagsValidas()){
                        Automato atual = Automato.create(aux.split(" ")[1]);
                        Automato tagValida = Automato.create(e.split(" ")[1]);
                        
                        AutomatoDeterministico Datual = new AutomatoDeterministico(atual);
                        AutomatoDeterministico DtagValida = new AutomatoDeterministico(tagValida);
                        
                        AutomatoIntersecao inter = new AutomatoIntersecao(Datual,DtagValida);
                        if(inter.temIntersecao()){
                            flag = true;
                            UserInterface.printWarning("Sobreposicao na definicao das tags " + aux.split(":")[0] 
                            + " e " + e.split(":")[0] + ".\n");
                        }
                        if(e.split(":")[0].equals(aux.split(":")[0])){
                            UserInterface.printError("Uma tag com esse nome já está definida como ("+e.split(" ")[1] + "). Tag não aceita.");
                            flag = true;
                            break;
                        }
            }
                if(!flag){
                    UserInterface.printInfo("Tag " + aux + " aceita.");
                    Data.getTagsValidas().add(aux);
                }
            }else{
                UserInterface.printError("Tag " + aux + " invalida.");
            }}catch(ArrayIndexOutOfBoundsException e){
                UserInterface.printError("Tag " + aux +" vazia.");
            }
        }
        UserInterface.printInfo("Arquivo foi totalmente lido.");
    }
    
    public static void s(String nomeDoArquivo){//Executa o comando :s
        FileController fc = new FileController(nomeDoArquivo);
        fc.write(Data.getTagsValidas());
        
        UserInterface.printInfo("Arquivo escrito com sucesso.");
    }
    
    public static void p(String entrada){
        String polonesa;
        String casamentos = "";
        if(Data.tagsValidas.isEmpty())
        {
            UserInterface.printError("Lista de tags vazia.");
            return;
        }
        Automato automato;
        int quantidadeConsumida[] = new int[Data.tagsValidas.size()];
        int maiorQuantidadeConsumida;
        int quantidadeCasamentos;
        int tagCasamento=0;
        String saidaProArquivo = "";
        
        while(!entrada.isEmpty())
        {
            //System.out.println("testePAI");
            for(int i=0;i<Data.tagsValidas.size();i++)
            {
                //System.out.println("teste1");
                polonesa = Data.tagsValidas.get(i).split(" ")[1];
                automato = Automato.create(polonesa);
                
                quantidadeConsumida[i]= automato.consome(entrada);
            }
            maiorQuantidadeConsumida = quantidadeConsumida[0];
            for(int i: quantidadeConsumida){
                //System.out.println("teste2");
                if(i> maiorQuantidadeConsumida)
                    maiorQuantidadeConsumida = i;
            }
            if(maiorQuantidadeConsumida<=0){
                if(!Data.DivisaoEmArquivo){
                    UserInterface.printError("Uma parte da String de entrada nao casou com nenhum padrao!");
                    return;
                } else{
                    FileController f = new FileController (Data.NomeArquivoDivisao);
                    ArrayList<String> auxiliar = new ArrayList<>();
                    auxiliar.add("Uma parte da String de entrada nao casou com nenhum padrao!");
                    f.write(auxiliar);
                }
            }
            quantidadeCasamentos = 0;
            for(int i=0;i<quantidadeConsumida.length;i++){
                //System.out.println("teste3");
                if (quantidadeConsumida[i] == maiorQuantidadeConsumida)
                    quantidadeCasamentos++;
            }
            if(quantidadeCasamentos>1)
            {
                if(!Data.DivisaoEmArquivo){
                UserInterface.printWarning(entrada.substring(0,maiorQuantidadeConsumida) + " casou com as tags: ");
                for(int i=0;i<quantidadeConsumida.length;i++)
                {
                    //System.out.println("teste4");
                    if(quantidadeConsumida[i]==maiorQuantidadeConsumida)
                        UserInterface.print(Data.tagsValidas.get(i).split(":")[0] + " ");
                }
                }else{
                    saidaProArquivo +=  "[WARNING] " + entrada.substring(0,maiorQuantidadeConsumida) + " casou com as tags: ";
                    for(int i=0;i<quantidadeConsumida.length;i++)
                    {
                    //System.out.println("teste4");
                        if(quantidadeConsumida[i]==maiorQuantidadeConsumida)
                            saidaProArquivo += Data.tagsValidas.get(i).split(":")[0] + " ";
                    }
                }
            }
            
            for(int i=0;i<quantidadeConsumida.length;i++){
                //System.out.println("teste5");
                if(quantidadeConsumida[i] == maiorQuantidadeConsumida){
                    tagCasamento = i;
                    break;
                }
            }
            
            casamentos = casamentos + Data.tagsValidas.get(tagCasamento).split(":")[0] + " ";
            entrada = entrada.substring(maiorQuantidadeConsumida);
            
            
        }
        if(!Data.DivisaoEmArquivo)
            UserInterface.print("\n"+casamentos + "\n");
        else{
            FileController f = new FileController(Data.NomeArquivoDivisao);
            ArrayList<String> auxiliar = new ArrayList<>();
            auxiliar.add(saidaProArquivo);
            auxiliar.add(casamentos);
            f.write(auxiliar);
        }
    }
    
    public static void f(String nomeDoArquivo){
        FileController fc = new FileController(nomeDoArquivo);
        if(!fc.exists())
        {
            UserInterface.printError("Arquivo nao encontrado.");
            return;
        }
        
        ArrayList<String> cadaLinha = fc.read();
        
        String entrada = cadaLinha.get(0);
        for(int i = 1; i<cadaLinha.size();i++)
            entrada = entrada + "ü" + cadaLinha.get(i);
        System.out.println("Entrada lida do arquivo: " + entrada);
        p(UserInterface.codeEscape(entrada));
    }
}

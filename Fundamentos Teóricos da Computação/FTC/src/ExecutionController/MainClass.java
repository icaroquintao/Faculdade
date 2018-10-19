/*
Integrantes do grupo:
Guilherme Marx Ferreira Tavares - 14.1.8006
Leonardo Sartori De Andrade - 15.1.8061
Pedro Henrique Mendes Batista -14.1.8403
CLASSE RESPONSAVEL POR INICIAR A EXECUCAO
 */
package ExecutionController;

import PontoExtra.AutomatoDeterministico;
import PontoExtra.AutomatoIntersecao;
import Structures.Automato;
import Structures.ExpressaoRegular;
import Support.Data;
import Support.UserInterface;

/**
 *
 * @author Leonardo Sartori
 */
public class MainClass {
    public static void main(String args[]){//Local de inicio da execucao
        UserInterface ui = new UserInterface();
        new Data();
        String teste = "" + Data.lambda;
        boolean flag = false;
        
        //Automato teste4 =Automato.create("ab.*");
        //Automato teste2 = Automato.create("ba.");
        //AutomatoDeterministico teste3 = new AutomatoDeterministico(teste2);
        
        //System.out.println(teste2.toString());
        //System.out.println(teste2.consome(teste));
        //System.out.println(teste2.toString());
        //System.out.println("Imprimindo o automato sem estados inalcansaveis:\n\n");
        //AutomatoIntersecao t = new AutomatoIntersecao(new AutomatoDeterministico(teste2),new AutomatoDeterministico(teste4));
        
        while(true){
            
            String comando = ui.readLine();
            if(comando.charAt(0)==':')
                UserInterface.validateCommand(comando);
            else{try{
                if(ExpressaoRegular.validate(comando.split(" ")[1])!= null)
                {
                    flag = false;
                    for(String e: Data.getTagsValidas()){
                        Automato atual = Automato.create(comando.split(" ")[1]);
                        Automato tagValida = Automato.create(e.split(" ")[1]);
                        
                        AutomatoDeterministico Datual = new AutomatoDeterministico(atual);
                        AutomatoDeterministico DtagValida = new AutomatoDeterministico(tagValida);
                        
                        AutomatoIntersecao inter = new AutomatoIntersecao(Datual,DtagValida);
                        if(inter.temIntersecao()){
                            flag = true;
                            UserInterface.printWarning("Sobreposicao na definicao das tags " + comando.split(":")[0] 
                            + " e " + e.split(":")[0] + ".\n");
                        }
                        
                        if(e.split(":")[0].equals(comando.split(":")[0])){
                            UserInterface.printError("Uma tag com esse nome já está definida como ("+e.split(" ")[1] + "). Tag não aceita.");
                            flag = true;
                            break;
                        }}
                    if(!flag){
                        Data.getTagsValidas().add(comando);
                        UserInterface.printInfo("Tag aceita.");
                    }
                }else{
                    UserInterface.printError("Tag invalida.");
                }} catch(ArrayIndexOutOfBoundsException e){
                    UserInterface.printError("Tag vazia.");
                }
            }
        }
    }
}

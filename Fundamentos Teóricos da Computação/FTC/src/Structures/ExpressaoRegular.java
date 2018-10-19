/*
Integrantes do grupo:
Guilherme Marx Ferreira Tavares - 14.1.8006
Leonardo Sartori De Andrade - 15.1.8061
Pedro Henrique Mendes Batista -14.1.8403
CLASSE RESPONSAVEL POR REPRESENTAR UMA EXPRESSAO REGULAR E REALIZAR OPERACOES SOBRE EXPRESSOES REGULARES
 */
package Structures;

import java.util.Deque;
import java.util.LinkedList;

/**
 *
 * @author Guilherme Marx
 */
public class ExpressaoRegular {
    String expressao;
    int size;
    public ExpressaoRegular (char a){//Inicializa uma Expressao Regular com um char
        expressao = new String();
        this.size = 1;
        expressao = Character.toString(a);
    }
    public ExpressaoRegular (String a, int size){//Inicializa uma Expressao Regular a partir da string contida em outra e um tamanho
        this.expressao = a;
        this.size = size;
    }
    
    public static ExpressaoRegular concat(ExpressaoRegular A,ExpressaoRegular B){//Retorna a expressao regular resultante da concatenacao de A com B
        int size = 1;
        if (A.getSize() == 1 && B.getSize() == 1)
            return new ExpressaoRegular(String.format(A.getExpressao() + B.getExpressao()),size);
        if (A.getSize() == 1)
            return new ExpressaoRegular(String.format(A.getExpressao() + "(" +B.getExpressao()+")"),size);
        if (B.getSize() == 1)
            return new ExpressaoRegular(String.format("(" + A.getExpressao() + ")" + B.getExpressao()), size);
        return new ExpressaoRegular(String.format("("+A.getExpressao() +")"+"("+B.getExpressao()+")"),size);
    }
    
    public static ExpressaoRegular or(ExpressaoRegular A,ExpressaoRegular B){//Retorna a expressao regular resultante da uniao de A com B
            return new ExpressaoRegular(String.format(A.getExpressao() +"+"+ B.getExpressao()),A.getSize()+B.getSize());
         }
    public static ExpressaoRegular kleene(ExpressaoRegular A){//Retorna a expressao regular resultante da aplicacao do Fecho de Kleene em A
        int size = 1;
        if (A.getExpressao().length() == 1)
            return new ExpressaoRegular(A.getExpressao() + "*",size);
        return new ExpressaoRegular("("+A.getExpressao()+")*",size);
    }
    
    public static ExpressaoRegular validate(String polonesa){
        //Valida uma expressao em notacao polonesa. Se a expressao for valida, retorna a Expressao Regular
        //correspondente, caso contrario, retorna null
        Deque<ExpressaoRegular> pilha = new LinkedList<>();
        for(char a: polonesa.toCharArray())
        {
            if ((a == '+' || a=='.')&&pilha.size() <2){
                return null;}
            if(a=='*' && pilha.size()<1){
                return null;}
            
            if(a == '+'){
                ExpressaoRegular a1 = pilha.removeFirst();
                ExpressaoRegular a2 = pilha.removeFirst();
                pilha.addFirst(ExpressaoRegular.or(a2, a1));}
            else if (a == '.'){
                ExpressaoRegular a1 = pilha.removeFirst();
                ExpressaoRegular a2 = pilha.removeFirst();
                pilha.addFirst(ExpressaoRegular.concat(a2, a1));}
            else if (a == '*')
                pilha.addFirst(ExpressaoRegular.kleene(pilha.removeFirst()));
            else pilha.addFirst(new ExpressaoRegular(a)); 
        }
        
        if(pilha.size() == 1)
            return pilha.removeFirst();
        else {
            return null;
        }
    }
    
    public String getExpressao(){
        return this.expressao;
    }
    
    public int getSize(){
        return this.size;
    }
    
}

package Exercicio2;

import java.util.Map;
import java.util.TreeMap;

public class PrincipalExercicio2 {

	static Map<Integer, Aluno> dados; // tree

	public static void main(String[] args) { // inicio da main
		dados = new TreeMap<Integer, Aluno>(); // instanciando dados do com o
		CrudAluno metodo =	new CrudAluno();								// tipo aluno e integer

		Aluno aluno = new Aluno(); /// criação de aluno apenas para constar no
									/// sistema
		aluno.setNome("Luis Capeto");
		aluno.setAg(10101);
		aluno.setCpf("1234");
		aluno.setIdade(22);
		//adicionaAluno(aluno); // adiciona o aluno com o método
		metodo.adicionaAluno(aluno);
		
		metodo.Selecao();
		
		
	}// fim da main
}// fim da classe
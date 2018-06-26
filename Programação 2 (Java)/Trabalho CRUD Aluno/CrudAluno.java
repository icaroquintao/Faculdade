package Exercicio2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class CrudAluno {

	static Map<Integer, Aluno> dados = new TreeMap<Integer, Aluno>();
	private Scanner sc;

	public static  String TextoInicial() { // método para chamar o texto do menu
											// sempre que precisar
		System.out.print("--------------------------" + "\nCRUD Aluno\n" + "Por favor escolha uma das opções abaixo: \n"
				+ "1\tAdicionar\n" + "2\tConsultar\n" + "3\tListar\n" + "4\tAtualizar\n" + "5\tExluir\n" + "6\tSair\n");
		return null;
	}

	public  void Selecao() { // inicio método menu
		TextoInicial(); // chama método texto incial
		int opcao = 0; // opcao por defalt no zero
		while (opcao != 6) { // inicio do while com a opcao para sair como 6
			@SuppressWarnings("resource")
			Scanner sc = new Scanner(System.in); // instanciando do leitor de
													// teclado
			opcao = sc.nextInt(); // atribuindo a opcao algum valor digitado
									// pelo usuário
			switch (opcao) { // inicio das escolhas

			case 1: // para criar aluno
				System.out.println("Criando aluno");
				int agNumero = 0;
				CriaAluno(agNumero); // chama o método para criar aluno
				TextoInicial();// após conclusao do programa chama o menu
				break; // sai

			case 2: // para consultar
				boolean alunoEditado = false; // por default o tipo boolean
												// alunoEditado é falso
				System.out.println("Consultando o aluno");
				while (alunoEditado != true) { // entra no loop até alunoEditado
												// ser verdadeiro
					System.out.println("Informe o número do AG do aluno"); // solicitando
																			// o
																			// numero
																			// do
																			// ag
																			// para
																			// pesquisa
					int numeroAg = sc.nextInt(); // lendo teclado
					consultaAluno(numeroAg); // chama método para consultar
												// aluno com o ag informado
					alunoEditado = true; // para sair do looṕ
				}
				TextoInicial();// após conclusao do programa chama o menu
				break;

			case 3:
				System.out.println("Listando alunos cadastrados"); // lista
																	// todos os
																	// alunos
																	// cadastrados
				listarDados(); // chama método
				TextoInicial();// após conclusao do programa chama o menu
				break;

			case 4:
				boolean alunoEditado1 = false;// para entrar no loop
												// alunoEditado tem que estar
												// falso
				System.out.println("Atualizando dados"); // para atualizar lgum
															// dado do cliente

				while (alunoEditado1 != true) {// entra no loop
					System.out.println("Informe o número do AG do aluno"); // solicita
																			// informacao
																			// aousuário
					int numeroAg = sc.nextInt();// le teclado
					EditarAluno(numeroAg); // chama método para
					alunoEditado1 = true; // sai do loop
				}
				TextoInicial();// após conclusao do programa chama o menu
				break;

			case 5:

				boolean alunoExcluido = false;
				System.out.println("Exluir Aluno\nPor favor insira o AG do aluno que deseja Excluir");

				int numeroAg = sc.nextInt();
				Aluno aluno = consultaAluno(numeroAg);
				System.out.println("Os dados acima estão corretos?\ns para sim\nn para não");
				sc.nextLine();// limpeza buffer
				String simOrNao = sc.next();

				while (alunoExcluido != true) {

					if (!simOrNao.equals("s") && !simOrNao.equals("n")) {
						System.out.println("Não compreendi a sua resposta\nPorfavor informe se é sim s, ou não n");
						sc.nextLine();
						simOrNao = sc.next();
					}

					if (simOrNao.equals("s")) {
						System.out.println("Você tem certeza que deseja exluir o aluno " + aluno.nome + "?");
						sc.nextLine();
						simOrNao = sc.next();

						if (simOrNao.equals("s")) {
							removeAluno(aluno);
							System.out.println("O aluno " + aluno.nome + " foi excluído");
							alunoExcluido = true;
						} else if (simOrNao.equals("n")) {
							System.out.println("O aluno " + aluno.nome + " não foi excluído");
							simOrNao = null;
							alunoExcluido = true;
						}
					} else if (simOrNao.equals("n")) {
						System.out.println("Por favor insira o numero do AG do aluno para exclusão");
						sc.nextLine();
						numeroAg = sc.nextInt();
						aluno = consultaAluno(numeroAg);
						System.out.println("Os dados acima estão corretos?\ns para sim\nn para não");
						sc.nextLine();// limpeza buffer
						simOrNao = sc.next();
					}
				}
				TextoInicial();
				break;

			default:// por default sai do programa caso 6
				System.out.println("Obrigado por utilizar esse software");
				break;
			}
		}
	}

	public  void listarDados() { // método para listar os dados

		List<Aluno> lista = new ArrayList<Aluno>(dados.values());
		Iterator<Aluno> itr = lista.iterator();
		System.out.println("AG\tNome\t\t\tCPF\tIdade");
		while (itr.hasNext()) {
			Aluno aluno = (Aluno) itr.next();

			System.out.println(
					aluno.getAg() + "\t" + aluno.getNome() + "\t\t" + aluno.getCpf() + "\t" + aluno.getIdade());
		}
	}

	public  void removeAluno(Aluno aluno) { // método para remover//nao
													// utilizado no programa
		dados.remove(aluno.getAg(), aluno);
	}

	public  void adicionaAluno(Aluno aluno) { // método para adicionar um
														// aluno na arvore
		dados.put(aluno.getAg(), aluno);
		System.out.println("O Aluno " + aluno.nome + " foi adicionado com sucesso ");
		return;
	}

	public  Aluno consultaAluno(int ag) { // método para consultar
													// determinado aluno
		List<Aluno> lista = new ArrayList<Aluno>(dados.values());
		Iterator<Aluno> itr = lista.iterator();
		while (itr.hasNext()) {
			Aluno aluno = (Aluno) itr.next();
			if (aluno.ag == ag) {
				System.out
						.println("\nO aluno foi encontrado\n Segue abaixo os dados solicitados\n nome:\t " + aluno.nome
								+ "\nAG:\t" + aluno.ag + "\nIdade:\t" + aluno.idade + "\nCPF:\t" + aluno.cpf + "\n");
				return aluno;
			}
		}
		return null;
	}

	public  void EditarAluno(int ag) {// método para editar um
												// aluno//nçao funciona
												// totalmente porque ele cria um
												// novo aluno
		List<Aluno> lista = new ArrayList<Aluno>(dados.values());
		Iterator<Aluno> itr = lista.iterator();
		while (itr.hasNext()) {
			Aluno aluno = (Aluno) itr.next();
			if (aluno.ag == ag) {
				System.out
						.println("\nO aluno foi encontrado\n Segue abaixo os dados solicitados\n nome:\t " + aluno.nome
								+ "\nAG:\t" + aluno.ag + "\nIdade:\t" + aluno.idade + "\nCPF:\t" + aluno.cpf + "\n");
				int agNumero = aluno.ag;
				CriaAluno(agNumero);
				System.out.print("Alterações efetuadas com sucesso!\nNome\t" + aluno.nome + "\nAG:\t" + aluno.ag
						+ "\nIdade:\t" + aluno.idade + "\nCPF:\t" + aluno.cpf + "\n");
				break;
			}
		}
	}

	public  void CriaAluno(int agNumero) { // método para criar um aluno
													// com as informações
													// obtidas com o usuário
		String resposta = "no";
		boolean nome = false, ag = false, idade = false, cpf = false;

		sc = new Scanner(System.in);

		while (!resposta.equals("yes")) {
			Aluno aluno = new Aluno();

			while (nome != true) {
				System.out.println("Por favor informe o nome do aluno");
				aluno.setNome(sc.next());
				if (aluno.nome.equals(null)) {
					System.out.println("Por favor informe o nome do aluno");
					sc.nextLine();
					aluno.setNome(sc.next());
				} else {
					nome = true;
				}
			}
			while (cpf != true) {
				System.out.println("Agora informe o CPF do aluno " + aluno.nome);
				sc.nextLine();
				aluno.setCpf(sc.next());
				if (aluno.cpf == null) {
					System.out.println("Por favor insira um CPF válido");
					aluno.setCpf(sc.next());
				} else {
					cpf = true;
				}
			}
			while (idade != true) {
				System.out.println("Agora informe a idade do aluno " + aluno.nome);
				sc.nextLine();
				aluno.setIdade(sc.nextInt());
				if (aluno.idade <= 9) {
					System.out.println("Por favor insira uma idade válida");
					sc.nextLine();
					aluno.setIdade(sc.nextInt());
				} else {
					idade = true;
				}
			}

			while (ag != true) {
				System.out.println("Informe qual será o número do AG do aluno " + aluno.nome);
				if (agNumero != 0) {
					aluno.setAg(agNumero);
					ag = true;
				} else if (agNumero == 0) {
					sc.nextLine();
					aluno.setAg(sc.nextInt());
					if (aluno.ag <= 0) {
						System.out.println("Insira um AG válido");
						sc.nextLine();
						aluno.setAg(sc.nextInt());
					} else {
						ag = true;
					}
				}
			}
			System.out.print("\nAs os dados abaixo estão corretos?\n" + "nome:\t" + aluno.nome + "\nAG:\t" + aluno.ag
					+ "\nIdade:\t" + aluno.idade + "\nCPF:\t" + aluno.cpf + "\n Responta s para sim e n para não\n");
			sc.nextLine();
			resposta = sc.next();

			if (!resposta.equals("s") && !resposta.equals("n")) {
				System.out.println("Não compreendi a sua resposta\nPorfavor informe se é sim s, ou não n");
				sc.nextLine();
				resposta = sc.next();

				if (!resposta.equals("s") && !resposta.equals("n")) {
					System.out.println(
							"Não compreendi a sua resposta\nMais uma resposta errada e os dados serão zerados\n"
									+ "Sim isso é uma ameaça, então responda corretamente\n"
									+ "Por favor informe se é sim s, ou não n");
					resposta = sc.next();
					if (!resposta.equals("s") && !resposta.equals("n")) {
						nome = false;
						ag = false;
						idade = false;
						cpf = false;
						System.out.println("Dados zerados, eu lhe avisei!");
					}
				}
			}

			if (resposta.equals("n")) {
				nome = false;
				ag = false;
				idade = false;
				cpf = false;
			}
			if (resposta.equals("s")) {
				resposta = "yes";
				adicionaAluno(aluno);
			} // fim do if s
		} // fim do while yes
	}// fim do método criar aluno

}

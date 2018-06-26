package projeto;

import java.util.Scanner;
import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class LocadoraRodando {

	private static Scanner entrada;
	private static Scanner entrada2;

	public static void main(String[] args) {
				
		entrada = new Scanner(System.in);
		entrada2 = new Scanner(System.in);
		
		String Atendente = null;
		
		Adm a1 = new Adm("Lorena","12345",01,"João Monlevade");
		
		Locadora l = new Locadora();
		l.AdcListFunc(a1);
		
		while(true){
	
		System.out.println("Informe a senha:");
		String senha = entrada.next();
		
		if((l.ConfereFunc(senha)).equals("FuncComum")){
			
			System.out.println("Bem vindo Funcionário");
			System.out.println("1.Cadastrar Cliente" + "\n2.Cadastrar DVD" + "\n3.Cadastrar CD" + "\n4.Cadastrar Game" + "\n5.Pesquisar DVD" +"\n6.Pesquisar CD" + "\n7.Pesquisar Mídia" + "\n8.Lista de Empréstimos do Cliente" + "\n9.Alugar Mídia" + "\n10.Devolução" + "\n0.Sair");
			int numero = entrada.nextInt();
			
			while(numero!=0){
			
			switch(numero){
			case 1:
				
				System.out.println("Informe o nome:");
				String n = entrada.next(); 
				
				System.out.println("Informe o telefone:");
				String t = entrada.next();
				
				System.out.println("Informe o cpf:");
				String c = entrada.next();
					
				Cliente c2 = new Cliente (n,t,c);
				
				int pautorizadas=1;
				while(pautorizadas<=5){
					System.out.println("Informe o nome da pessoa autorizada, senão digite -");
					String pauto = entrada.next();
					c2.AdcPessoasAutorizadas(pauto);
					pautorizadas++;
				}
				l.addClientes(c2);
				
				break;
				
			case 2:
				
				System.out.println("Informe o número:");
				int n1 = entrada2.nextInt();
				System.out.println("Informe a Censura:");
				String c1 = entrada.next();
				System.out.println("Informe o Título:");
				String t1 = entrada.next();
				System.out.println("Informe o número de cópias:");
				int co1 = entrada2.nextInt();
				System.out.println("Informe a categoria:");
				String ca1 = entrada.next();
				System.out.println("Informe o gênero:");
				String g1 = entrada.next();
				System.out.println("Informe o idioma:");
				String i1 = entrada.next();
				
				DVD D1 = new DVD(n1,c1,t1,co1,ca1,g1,i1);
				l.adcDVD(D1);
				l.AdcMidia(D1);
				
				break;
			
			case 3:
				
				System.out.println("Informe o número:");
				int n2 = entrada2.nextInt();  entrada2.nextLine();
				System.out.println("Informe a Censura:");
				String ce2 = entrada.next();
				System.out.println("Informe o Título:");
				String t2 = entrada.next();
				System.out.println("Informe o número de cópias:");
				int co2 = entrada2.nextInt();  entrada2.nextLine();
				System.out.println("Informe a categoria:");
				String ca2 = entrada.next();
				System.out.println("Informe o cantor/banda:");
				String caba2 = entrada.next();
				System.out.println("Número de músicas:");
				int nmus = entrada.nextInt();
				
				CD C1 = new CD(n2,ce2,t2,co2,ca2,caba2,nmus);
			    l.addCDs(C1);
				l.AdcMidia(C1);
				
				break;
				
			case 4:
				
				System.out.println("Informe o número:");
				int n3 = entrada2.nextInt();  entrada2.nextLine();
				System.out.println("Informe a Censura:");
				String c3 = entrada.next();
				System.out.println("Informe o Título:");
				String t3 = entrada.next();
				System.out.println("Informe o número de cópias:");
				int co3 = entrada2.nextInt();  entrada2.nextLine();
				System.out.println("Informe a categoria:");
				String ca3 = entrada.next();
				System.out.println("Informe o console:");
				String cons = entrada.next();
				
				Game ga1 = new Game(n3,c3,t3,co3,ca3,cons);
				l.addGames(ga1);
				l.AdcMidia(ga1);
				
				break;
				
			case 5:
				
				System.out.println("Informe o gênero desejado:");
				String GENERO = entrada.next();
				
				l.PesquisarPorGenero(GENERO);
				
				break;
				
			case 6:
				
				System.out.println("Informe o Cantor desejado:");
				String CANTOR = entrada.next();
				
			   l.PesquisarPorCantor(CANTOR);
				
				break;

			case 7:
				
				System.out.println("Informe o número da mídia:");
				int numdamidia = entrada.nextInt();
				
				l.ProcurarMidia(numdamidia);
				
				break;
				
			case 8:
				System.out.println("Informe o nome do cliente:");
				String clii = entrada.next();
				Cliente c10 = l.BuscarCliente(clii);
				c10.ImprimirEmprestimos();
				break;
				
			case 9:
				
				System.out.println("Informe o nome do cliente:");
				String cli = entrada.next();
				Cliente c9 = l.BuscarCliente(cli);
				System.out.println("Se for dependente, digite o nome:");
				String dependente = entrada.next();
				int posicao = c9.BuscarDepen(dependente);
				int p = 0;
				int v = 1;
				while(v==1){
				System.out.println("Informe o código da mídia:");
				int cod = entrada.nextInt();
				String mid = l.ProcurarMidia(cod);
				l.Midiaaluga(cod);
				p += l.Preco(cod);
				Date z = new Date();
				Calendar data2 = Calendar.getInstance();
				data2.setTime(z);
				data2.add(Calendar.DAY_OF_YEAR,1);
				Dev d1 = new Dev (cod, data2.getTime());
				c9.addEmprestimo(d1);
				c9.addEmprestimosNodia(mid);
				System.out.println("Você quer alugar mais alguma mídia: 1 sim 2 não");
				v = entrada.nextInt();
				}
				System.out.println("\nCupom");
				System.out.println("\nCliente:" + c9);
				if(posicao!=0){
				System.out.println("Dependente:" + dependente );
				}
				c9.ImprimirEmprestimosNodia();
				Date x = new Date();
				Calendar data = Calendar.getInstance();
				data.setTime(x);
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", new Locale("pt","br"));
				System.out.println("Data do aluguel:" + sdf.format(x));
				Date y = new Date();
				Calendar data1 = Calendar.getInstance();
				data1.setTime(y);
				data1.add(Calendar.DAY_OF_YEAR,1);
				System.out.println("Data da Devolução:" + sdf.format(data1.getTime()));
				System.out.println("Valor:" + p);
				System.out.println("Atendente:" + Atendente);
				
				c9.LimparEmprestimos();
				
				break;
				
			case 10:
				
				
				System.out.println("Informe o nome do cliente:");
				String clien = entrada.next();
				Cliente c11 = l.BuscarCliente(clien);
				int vv = 1;
				while(vv==1){
				System.out.println("Informe o código da mídia:");
				int nom = entrada.nextInt();
				Date dd = c11.devolucao(nom);
				System.out.println("Valor a pagar: " + c11.valordev(dd));
				System.out.println("Você quer devolver mais alguma mídia: 1 sim 2 não");
				vv = entrada.nextInt();
				}
		
			default:
				
				System.out.println("Opção Inválida");
				 
				break;
			}
			
			System.out.println("1.Cadastrar Cliente" + "\n2.Cadastrar DVD" + "\n3.Cadastrar CD" + "\n4.Cadastrar Game" + "\n5.Pesquisar DVD" +"\n6.Pesquisar CD" + "\n7.Pesquisar Mídia" + "\n8.Lista de Empréstimos do Cliente" + "\n9.Alugar Mídia" + "\n10.Devolução" + "\n0.Sair");
			numero = entrada.nextInt();
			}
		}
		
			else if((l.ConfereFunc(senha)).equals("Adm")){
			
			System.out.println("Bem vindo Administrador");
			System.out.println("1.Cadastrar Administrador" + "\n2.Cadastrar Funcionário Comum" + "\n3.Pesquisar DVD" +"\n4.Pesquisar CD" + "\n5.Pesquisar Mídia" + "\n6.Alugar Mídia" + "\n7.Lista de Empréstimos do Cliente" + "\n8.Devolução" + "\n0.Sair");
			int numer = entrada2.nextInt();
			
			while(numer!=0){
			
			switch(numer){
			case 1:
				
				System.out.println("Informe o nome:");
				String n = entrada.next();
				System.out.println("Informe a senha:");
				String s = entrada.next();
				System.out.println("Informe o numero:");
				int nu = entrada2.nextInt();  entrada2.nextLine();
				System.out.println("Informe o endereco:");
				String end = entrada.next();
				
				Atendente= n;
				
				Adm a2 = new Adm (n,s,nu,end);
				l.AdcListFunc(a2);
				
				break;
				
			case 2:
				
				System.out.println("Informe o nome:");
				String n2 = entrada.next(); 
				System.out.println("Informe a senha:");
				String s2 = entrada.next();
				System.out.println("Informe o numero:");
				int nu2 = entrada2.nextInt(); entrada2.nextLine();
				System.out.println("Informe o endereco:");
				String end2 = entrada.next();
				
				Atendente = n2;
				
				FuncComum f2 = new FuncComum (n2,s2,nu2,end2);
				l.AdcListFunc(f2);
				
				break;
				
			case 3:
				
				System.out.println("Informe o gênero desejado:");
				String GENERO = entrada.next();
				
				l.PesquisarPorGenero(GENERO);
				
				break;
				
			case 4:
				
				System.out.println("Informe o Cantor desejado:");
				String CANTOR = entrada.next();
				
				l.PesquisarPorCantor(CANTOR);

				break;
				
			case 5:
				
				System.out.println("Informe o número da mídia:");
				int numdamidia = entrada2.nextInt();
				
				l.ProcurarMidia(numdamidia);
				
				break;
				
			case 6:
				

				System.out.println("Informe o nome do cliente:");
				String cli = entrada.next();
				Cliente c9 = l.BuscarCliente(cli);
				System.out.println("Se for dependente, digite o nome:");
				String dependente = entrada.next();
				int posicao = c9.BuscarDepen(dependente);
				int p = 0;
				int v = 1;
				while(v==1){
				System.out.println("Informe o código da mídia:");
				int cod = entrada.nextInt();
				String mid = l.ProcurarMidia(cod);
				l.Midiaaluga(cod);
				p += l.Preco(cod);
				Date z = new Date();
				Calendar data2 = Calendar.getInstance();
				data2.setTime(z);
				data2.add(Calendar.DAY_OF_YEAR,1);
				Dev d1 = new Dev (cod, data2.getTime());
				c9.addEmprestimo(d1);
				c9.addEmprestimosNodia(mid);
				System.out.println("Você quer alugar mais alguma mídia: 1 sim 2 não");
				v = entrada.nextInt();
				}
				System.out.println("\nCupom");
				System.out.println("\nCliente:" + c9);
				if(posicao!=0){
				System.out.println("Dependente:" + dependente );
				}
				c9.ImprimirEmprestimosNodia();
				Date x = new Date();
				Calendar data = Calendar.getInstance();
				data.setTime(x);
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", new Locale("pt","br"));
				System.out.println("Data do aluguel:" + sdf.format(x));
				Date y = new Date();
				Calendar data1 = Calendar.getInstance();
				data1.setTime(y);
				data1.add(Calendar.DAY_OF_YEAR,1);
				System.out.println("Data da Devolução:" + sdf.format(data1.getTime()));
				System.out.println("Valor:" + p);
				System.out.println("Atendente:" + Atendente);
				
				c9.LimparEmprestimos();
				
				
				break;
				
			case 7:
				
				System.out.println("Informe o nome do cliente:");
				String clii = entrada.next();
				Cliente c10 = l.BuscarCliente(clii);
				c10.ImprimirEmprestimos();
				break;
				
			case 8:
				
				System.out.println("Informe o nome do cliente:");
				String clien = entrada.next();
				Cliente c11 = l.BuscarCliente(clien);
				int vv = 1;
				while(vv==1){
				System.out.println("Informe o código da mídia:");
				int nom = entrada.nextInt();
				Date dd = c11.devolucao(nom);
				System.out.println("Valor a pagar: " + c11.valordev(dd));
				System.out.println("Você quer devolver mais alguma mídia: 1 sim 2 não");
				vv = entrada.nextInt();
				}
				
				break;
				
				
			default:
				
				System.out.println("Opção Inválida");
				
				
				break;
			}
			
			System.out.println("1.Cadastrar Administrador:" + "\n2.Cadastrar Funcionário Comum:" + "\n3.Pesquisar DVD" +"\n4.Pesquisar CD" + "\n5.Pesquisar Mídia" + "\n6.Alugar Mídia" +"\n0.Sair");
			numer = entrada2.nextInt();
		
		}
			
				}
			else if((l.ConfereFunc(senha)).equals("")){
				System.out.println("Usuário não encontrado");
	}
}

	}
}
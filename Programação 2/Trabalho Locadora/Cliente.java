package projeto;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class Cliente {
	
	private String nome;
	private String telefone;
	private String cpf;
	private ArrayList<String> PessoasAutorizadas;
	private ArrayList<Dev> Emprestimos;
	private ArrayList<String> EmprestimosNodia;
	private static int total=0;
	
	public Cliente(String nome, String telefone, String cpf) {
		super();
		this.nome = nome;
		this.telefone = telefone;
		this.cpf = cpf;
		this.PessoasAutorizadas = new ArrayList<String>();
		this.Emprestimos = new ArrayList<Dev>();
		this.EmprestimosNodia = new ArrayList<String>();
	}
	
	public void addEmprestimo(Dev d){
		Emprestimos.add(d);
	}
	
	public Date devolucao(int s){
		Date d = null;
		for(int i=0; i<Emprestimos.size(); i++){
			if(Emprestimos.get(i).nome==s){
				d = Emprestimos.get(i).d;
			}
		}
		return d;
	}
	
	public int valordev(Date d){
		
		int v = 0;
		Date z = new Date();
		Calendar data3 = Calendar.getInstance();
		data3.setTime(z);
		
		if(d.getDay()>=z.getDay()){
			v = 0;
		}
		else{
			v =( z.getDay() - d.getDay() )* 2;
		}
		return v;
	}
	
	public void addEmprestimosNodia(String s){
		EmprestimosNodia.add(s);
	}
	
	public void ImprimirEmprestimosNodia(){
		for(int i=0; i<EmprestimosNodia.size(); i++){
			System.out.println(EmprestimosNodia.get(i));
		}
	}
	
	public void LimparEmprestimos(){
		EmprestimosNodia.clear();
	}
	
	public void ImprimirEmprestimos(){
		for(int i=0; i<Emprestimos.size(); i++){
			System.out.println(Emprestimos.get(i).nome);
			System.out.println(Emprestimos.get(i).d);
		}
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
	public void AdcPessoasAutorizadas(String n){
		if(total<=5){
			PessoasAutorizadas.add(n);
		}
		total++;
		
	}

	public void PessoasAutorizadas(){
		for(int i=0; i<PessoasAutorizadas.size(); i++){
			System.out.println(PessoasAutorizadas.get(i));
		}
	}
	
	public int BuscarDepen(String d){
		
		int salvar = 0;
		for(int i=0; i<PessoasAutorizadas.size(); i++){
			if((PessoasAutorizadas.get(i)).equals(d)){
				salvar = i;
			}
		}
		return salvar;
	}
	
	public String toString() {
		return "Nome:" + nome + "\n Telefone=" + telefone + "\n cpf:" + cpf ;
		}	
}

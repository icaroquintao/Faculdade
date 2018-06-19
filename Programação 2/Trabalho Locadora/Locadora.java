package projeto;

import java.util.ArrayList;


public class Locadora {
	
	private ArrayList<Cliente> clientes;
	private ArrayList<Funcionarios> funcionarios;
	private ArrayList<MidiadeLocacao> estoque;
	private ArrayList<DVD> dvd;
	private ArrayList<CD> cd;
	private ArrayList<Game> game;

	
	public Locadora(){
		this.clientes = new ArrayList<Cliente>();
		this.funcionarios = new ArrayList<Funcionarios>();
		this.estoque = new ArrayList<MidiadeLocacao>();
		this.dvd = new ArrayList<DVD>();
		this.cd = new ArrayList<CD>();
		this.game = new ArrayList<Game>();
	}

	public void addClientes(Cliente c){
		clientes.add(c);
	}
	
	public void ImprimirClientes(){
		for(int i=0; i<clientes.size(); i++){
			System.out.println(clientes.get(i).getNome());
		}
	}
	
	public Cliente BuscarCliente(String c){
		
		int salvar = 0 ;
		for(int i=0; i<clientes.size(); i++){
			if((clientes.get(i).getNome()).equals(c)){
			    salvar = i;
			}
			else{
				System.out.println("Cliente não existe");
			}
		}
		return clientes.get(salvar);
	}
	
	public void AdcListFunc(Funcionarios f){
		funcionarios.add(f);
	}

	public String ConfereFunc(String s){
		
		String result = ""; 
		for(int i=0; i<funcionarios.size(); i++){
			if((funcionarios.get(i).senha).equals(s)){
				if(funcionarios.get(i) instanceof Adm){
					result = "Adm";
				}
				else if(funcionarios.get(i) instanceof FuncComum){
					result = "FuncComum";
				}
				else{
					result = "";
				}
			}
	}
		return result;
	}
	
	public void ImprimeFuncionarios(){
		for(int i=0; i<funcionarios.size(); i++){
			System.out.println(funcionarios.get(i).nome);
		}
	}
	
	public void AdcMidia(MidiadeLocacao m){
		estoque.add(m);
	}

	public String ProcurarMidia(int numero){
		
		String midia = null;
		
		for(int i=0; i<estoque.size(); i++){
			if(estoque.get(i).numero == numero){
				System.out.println(estoque.get(i).Titulo);
				System.out.println("Número de cópias:" + estoque.get(i).getNumerodecopias());
				System.out.println("Número de cópias alugadas:" + estoque.get(i).getNumeroaluga());
				midia = estoque.get(i).Titulo;
			}
		}
		return midia;
	}
	
	public void Midiaaluga(int numero){
		for(int i=0; i<estoque.size(); i++){
			if(estoque.get(i).numero == numero){
				int na = estoque.get(i).getNumeroaluga();
				estoque.get(i).setNumeroaluga(na+1);			
			}
		}		
	}
	
	public void adcDVD(DVD d){
		dvd.add(d);
	}
	
	public void ImprimirDVDs(){
		for(int i=0; i<dvd.size(); i++){
			System.out.println(dvd.get(i).toString());
		}
		
	}
	
	public void PesquisarPorGenero(String g){
		for(int i=0; i<dvd.size(); i++){
			if((dvd.get(i).getGenero()).equals(g)){
				System.out.println(dvd.get(i).Titulo);
			}
		}
	}
	
	public void addCDs(CD c){
		cd.add(c);
	}
	
	public void ImprimeCDs(){
		for(int i=0; i<cd.size(); i++){
			System.out.println();
		}
	}
	
	public void PesquisarPorCantor(String c){
		for(int i=0; i<cd.size(); i++){
			if((cd.get(i).getCantor()).equals(c)){
				System.out.println(cd.get(i).Titulo);
			}
		}
	}
	
	public void addGames(Game g){
		game.add(g);
	}
	
	public void ImprimeGames(){
		for(int i=0; i<game.size(); i++){
			System.out.println(game.get(i).toString());
		}
	}
	
	public int Preco(int cod){
		int preco = 0;
		for(int i=0; i<estoque.size(); i++){
		if(estoque.get(i).Categoria.equals("Lançamento")){
			preco = 10;
		}
		else if(estoque.get(i).Categoria.equals("Comum")){
			preco = 8;
		}
		else{
			preco = 6;
		}
		}
		return preco;
	}

}

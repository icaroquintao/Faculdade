package projeto;

public class Funcionarios {
	
	protected String nome;
	protected String senha;
	protected int numero;
	protected String Endereco;
	
	public Funcionarios(String nome, String senha, int numero, String endereco) {
		super();
		this.nome = nome;
		this.senha = senha;
		this.numero = numero;
		this.Endereco = endereco;
	}
	
	public String toString() {
		return  nome + "\nN�mero:" + numero + "\nEndere�o:" + Endereco;
	}
	
	

}

package projeto;

public class MidiadeLocacao {
	
	protected int numero;
	protected String censura;
	protected String Titulo;
	protected int numerodecopias;
	protected String Categoria;	
	protected int numeroaluga;
	
	public MidiadeLocacao(int numero, String censura, String titulo, int numerodecopias, String Categoria) {
		super();
		this.numero = numero;
		this.censura = censura;
		this.Titulo = titulo;
		this.numerodecopias = numerodecopias;
		this.Categoria = Categoria;
		this.numeroaluga = 0;
		
	}
	
	
	
	@Override
	public String toString() {
		return "\nNúmero:" + numero + "\nCensura:" + censura + "\nTítulo:" + Titulo + "\nNúmero de cópias:"
				+ numerodecopias;
	}



	public int getNumerodecopias() {
		return numerodecopias;
	}



	public void setNumerodecopias(int numerodecopias) {
		this.numerodecopias = numerodecopias;
	}



	public int getNumeroaluga() {
		return numeroaluga;
	}



	public void setNumeroaluga(int numeroaluga) {
		this.numeroaluga = numeroaluga;
	}
	
	
	
	
	
	
	

}

package projeto;


public class CD extends MidiadeLocacao {
	
	private String cantor;
	private int numdemusicas;
	
	public CD(int numero, String censura, String titulo, int numerodecopias,String Categoria, String cantor,
			int numdemusicas) {
		super(numero, censura, titulo, numerodecopias, Categoria);
		this.cantor = cantor;
		this.numdemusicas = numdemusicas;
	}
	
	@Override
	public String toString() {
		return super.toString() + "\nCantor:" + cantor + "\nNúmero de músicas:" + numdemusicas;
	}

	public String getCantor() {
		return cantor;
	}

	public void setCantor(String cantor) {
		this.cantor = cantor;
	}

	public int getNumdemusicas() {
		return numdemusicas;
	}

	public void setNumdemusicas(int numdemusicas) {
		this.numdemusicas = numdemusicas;
	}
	
	
	

}

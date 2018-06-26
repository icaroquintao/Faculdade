package projeto;


public class DVD extends MidiadeLocacao {
	
	private String genero;
	private String idioma;
	
	
	public DVD(int numero, String censura, String titulo, int numerodecopias,String Categoria, String genero, String idioma) {
		super(numero, censura, titulo, numerodecopias,Categoria);
		this.genero = genero;
		this.idioma = idioma;
		}
	

	@Override
	public String toString() {
		return  super.toString() + "\nGênero:" + genero + "\nIdioma:" + idioma;
	}


	public String getGenero() {
		return genero;
	}


	public void setGenero(String genero) {
		this.genero = genero;
	}


	public String getIdioma() {
		return idioma;
	}


	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	
}

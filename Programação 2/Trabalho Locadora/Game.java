package projeto;


public class Game extends MidiadeLocacao{
	
	private String console;

	public Game(int numero, String censura, String titulo, int numerodecopias,String Categoria, String console) {
		super(numero, censura, titulo, numerodecopias, Categoria);
		this.console = console;
	}

	@Override
	public String toString() {
		return super.toString() + "\nConsole:" + console;
	}

	public String getConsole() {
		return console;
	}

	public void setConsole(String console) {
		this.console = console;
	}

}

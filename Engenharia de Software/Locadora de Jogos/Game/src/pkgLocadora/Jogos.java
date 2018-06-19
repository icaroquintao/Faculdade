package pkgLocadora;

import java.util.ArrayList;

/**
 *
 *
 */
public class Jogos{

    protected static int counter = 0;
    protected int codigo = 0;
    protected String titulo, classificacao, categoria, plataforma;
    protected int quantidade;
    protected double real;
    protected boolean locado;
    protected Data lancamento;
    protected Data dataLocacao;
    protected Data dataDevolucao;

    public Jogos() {
    }

    public Jogos(String titulo) {
        this.titulo = titulo;
    }

    public Jogos(String titulo, String classificacao, String categoria,String plataforma, double real, Data lancamento) {
        this.titulo = titulo;
        this.classificacao = classificacao;
        this.categoria = categoria;
        this.plataforma = plataforma;
        this.real = real;
        this.lancamento = lancamento;
        quantidade++;
        codigo = ++counter;
    }

    public String concatenaJogosCliente(ArrayList<Jogos> jogos){
        String str = "";
        for(Jogos a : jogos){
            str += a.imprimeLista();
        }

        return str;
    }

    public String imprimeLista(){
        return "Título: " + titulo + "  Código "+ codigo + "\n";
    }
    public String imprimeJogos(){
        String simNao;
        if(locado){ simNao = "Sim";} else { simNao = "Não";}
        return "Midia\n" + "titulo = " + titulo +
                "\nclassificacao = " + classificacao +
                "\ncategoria = " + categoria +
                "\ncodigo = " + codigo +
                "\nquantidade = " + quantidade +
                "\nprecodigo = R$ " + real +
                "\nlocado = " + simNao +
                "\nlancamento = " + lancamento.toString()+ "\n";
    }


    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(String classificacao) {
        this.classificacao = classificacao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getReal() {
        return real;
    }

    public void setReal(double real) {
        this.real = real;
    }

    public boolean isLocado() {
        return locado;
    }

    public void setLocado(boolean locado) {
        this.locado = locado;
    }

    public Data getLancamento() {
        return lancamento;
    }

    public void setLancamento(Data lancamento) {
        this.lancamento = lancamento;
    }

}

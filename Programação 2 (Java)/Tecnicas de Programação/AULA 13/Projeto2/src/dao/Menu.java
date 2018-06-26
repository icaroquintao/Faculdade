package dao;

public class Menu {
    private int codigo;
    private String tipo;
    private String nome;
    private float preco;
    private int quantvezes;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getQuantvezes() {
        return quantvezes;
    }

    public void setQuantvezes(int quantvezes) {
        this.quantvezes = quantvezes;
    }
}

package pkgLocadora;

/**
 *
 *
 */
public class Locacao {
    private Funcionario operador;
    private Cliente cliente;
    private Jogos jogosAlocados;

    public Locacao() {
    }

    public Locacao(Funcionario operador, Cliente cliente, Jogos jogosAlocados) {
        this.operador = operador;
        this.cliente = cliente;
        this.jogosAlocados = jogosAlocados;
    }


    public Funcionario getOperador() {
        return operador;
    }

    public void setOperador(Funcionario operador) {
        this.operador = operador;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Jogos getJogosLocado() {
        return jogosAlocados;
    }

    public void setJogosLocado(Jogos jogosAlocados) {
        this.jogosAlocados = jogosAlocados;
    }

}

package pkgLocadora;

import java.util.ArrayList;
/**
 *
 *
 */
public class Cliente extends Pessoa{
    private Double saldo = 0.0, desconto = 0.0;
    private ArrayList<Jogos> jogoCliente;

    public Cliente(){

    }

    public Cliente(String nome, String cpf, String telefone, String sexo, Endereco endereco, Data dataNascimento, Data dataCadastro) {
        super(nome, cpf, telefone, sexo, endereco, dataNascimento, dataCadastro);
        jogoCliente = new ArrayList<>();
    }

    @Override
    public String toString() {
        return super.toString() + "\nsaldo = " + saldo + "\n\nJogos Cliente:\n" + concatenaJogosCliente(jogoCliente);
    }

    public String concatenaJogosCliente(ArrayList<Jogos> jogos){
        String str = "";
        for(Jogos a : jogos){
            str += a.imprimeLista();
        }

        return str;
    }

    public ArrayList<Jogos> getJogosCliente() {
        return jogoCliente;
    }

    public void setJogosCliente(ArrayList<Jogos> jogoCliente) {
        this.jogoCliente = jogoCliente;
    }

    public Double getDesconto() {
        return desconto;
    }

    public void setDesconto(Double desconto) {
        this.desconto = desconto;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldoModificado(Double valor) {
        this.saldo = saldo - valor;
    }

}

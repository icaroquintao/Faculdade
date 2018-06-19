package pkgLocadora;

/**
 *
 * 
 */
public class Funcionario extends Cliente{
    private String cargo;
    private double salario;
    private Hora entrada, saida;

    public Funcionario() {
    }

    public Funcionario(String cargo, double salario, Hora entrada, Hora saida, String nome, String cpf, String telefone, String sexo, Endereco endereco, Data dataNascimento, Data dataCadastro) {
        super(nome, cpf, telefone, sexo, endereco, dataNascimento, dataCadastro);
        this.cargo = cargo;
        this.salario = salario;
        this.entrada = entrada;
        this.saida = saida;
        
    }

    @Override
    public String toString() {
        return super.toString();
    }
    
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public Hora getEntrada() {
        return entrada;
    }

    public void setEntrada(Hora entrada) {
        this.entrada = entrada;
    }

    public Hora getSaida() {
        return saida;
    }

    public void setSaida(Hora saida) {
        this.saida = saida;
    }

}

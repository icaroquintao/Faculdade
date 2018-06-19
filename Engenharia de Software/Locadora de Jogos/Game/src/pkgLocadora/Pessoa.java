package pkgLocadora;

/**
 *
 * 
 */
public abstract class Pessoa{
    private String nome, cpf, telefone;
    private String sexo;
    private Endereco endereco;
    private Data dataNascimento, dataCadastro;

    public Pessoa() {
    }
    
    public Pessoa(String nome, String cpf, String telefone, String sexo, Endereco endereco, Data dataNascimento, Data dataCadastro) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.sexo = sexo;
        this.endereco = endereco;
        this.dataNascimento = dataNascimento;
        this.dataCadastro = dataCadastro;
    }
    
    public String imprimeLista(){
        return "Nome: " + nome + "  CPF: " + cpf + "\n";
    }
    @Override
    public String toString() {
        return "nome = " + nome + "\nCPF = " + cpf + "\ntelefone = " + telefone + "\nsexo = " + sexo + "\ndataNascimento = " + dataNascimento.toString() + "\ndataCadastro = " + dataCadastro.toString() + "\n\nEndereço" + endereco.toString();
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Data getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Data dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public Data getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Data dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
    
}

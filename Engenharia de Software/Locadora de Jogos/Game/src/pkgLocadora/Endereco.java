package pkgLocadora;

/**
 *
 * @author Edgar_Alves
 */
public class Endereco {
    private String rua, complemento, bairro, cidade, cep;
    private int numero;
    private String estado;

    public Endereco() {
    }
    
    public Endereco(String rua, String complemento, String bairro, String cidade, String cep, int numero, String estado) {
        this.rua = rua;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cidade = cidade;
        this.cep = cep;
        this.numero = numero;
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "\nrua = " + rua + "\ncomplemento = " + complemento + "\nbairro = " + bairro + "\ncidade = " + cidade + "\ncep = " + cep + "\nnumero = " + numero + "\nestado=" + estado;
    }
    

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
    
    
    
    
    
    
    
    
}

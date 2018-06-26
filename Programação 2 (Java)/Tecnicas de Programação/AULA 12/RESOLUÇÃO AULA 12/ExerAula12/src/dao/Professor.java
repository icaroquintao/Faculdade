package dao;

public class Professor {
    private int numProf;
    private String nomeProf;
    private float salarioProf;
    private char sexoProf;
    private int numDepto;
    private char categoria;

    /**
     * @return the numProf
     */
    public int getNumProf() {
        return numProf;
    }

    /**
     * @param numProf the numProf to set
     */
    public void setNumProf(int numProf) {
        this.numProf = numProf;
    }

    /**
     * @return the nomeProf
     */
    public String getNomeProf() {
        return nomeProf;
    }

    /**
     * @param nomeProf the nomeProf to set
     */
    public void setNomeProf(String nomeProf) {
        this.nomeProf = nomeProf;
    }

    /**
     * @return the salarioProf
     */
    public float getSalarioProf() {
        return salarioProf;
    }

    /**
     * @param salarioProf the salarioProf to set
     */
    public void setSalarioProf(float salarioProf) {
        this.salarioProf = salarioProf;
    }

    /**
     * @return the sexoProf
     */
    public char getSexoProf() {
        return sexoProf;
    }

    /**
     * @param sexoProf the sexoProf to set
     */
    public void setSexoProf(char sexoProf) {
        this.sexoProf = sexoProf;
    }

    /**
     * @return the numDepto
     */
    public int getNumDepto() {
        return numDepto;
    }

    /**
     * @param numDepto the numDepto to set
     */
    public void setNumDepto(int numDepto) {
        this.numDepto = numDepto;
    }

    /**
     * @return the categoria
     */
    public char getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(char categoria) {
        this.categoria = categoria;
    }
}

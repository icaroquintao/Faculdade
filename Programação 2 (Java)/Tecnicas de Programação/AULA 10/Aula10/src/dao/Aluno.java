package dao;

public class Aluno {
    
    private String RGM;
    private String nome;
    private String curso;
    private String email;

    /**
     * @return the RGM
     */
    public String getRGM() {
        return RGM;
    }

    /**
     * @param RGM the RGM to set
     */
    public void setRGM(String RGM) {
        this.RGM = RGM;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the curso
     */
    public String getCurso() {
        return curso;
    }

    /**
     * @param curso the curso to set
     */
    public void setCurso(String curso) {
        this.curso = curso;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    
}

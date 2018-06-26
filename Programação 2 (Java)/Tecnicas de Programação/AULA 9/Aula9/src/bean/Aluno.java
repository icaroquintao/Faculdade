package bean;

public class Aluno {
    
    private String RGM;
    private String nome;
    private float nota1;
    private float nota2;

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
     * @return the nota1
     */
    public float getNota1() {
        return nota1;
    }

    /**
     * @param nota1 the nota1 to set
     */
    public void setNota1(float nota1) {
        this.nota1 = nota1;
    }

    /**
     * @return the nota2
     */
    public float getNota2() {
        return nota2;
    }

    /**
     * @param nota2 the nota2 to set
     */
    public void setNota2(float nota2) {
        this.nota2 = nota2;
    }
    
    /**
     * Calcula a média e a situação
     *     
     * @return resp
     */
    public String calculaMedia() {
        String resp = "";

        //Calcula a média e exibe na tela
        float media = (nota1 + nota2) / 2;

        if (media < 3) {
            resp = media + " : Reprovado";
        } else if (media >= 6) {
            resp = media + " : Aprovado";
        } else {
            resp = media + " : Exame";
        }
        return resp;

    }
    
}

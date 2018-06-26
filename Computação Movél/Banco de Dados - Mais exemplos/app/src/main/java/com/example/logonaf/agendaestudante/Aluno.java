package com.example.logonaf.agendaestudante;

/**
 * Created by Administrador on 15/09/2015.
 */
public class Aluno {
    private int id;
    private String nome;
    private String email;
    private int idade;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String toString()
    {
        return "Id: " + id + " - " + nome + ", " + String.valueOf(idade);
    }
}

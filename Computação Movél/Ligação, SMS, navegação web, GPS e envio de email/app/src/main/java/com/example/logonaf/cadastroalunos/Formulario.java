package com.example.logonaf.cadastroalunos;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RatingBar;

public class Formulario extends Activity {
    private Aluno aluno;
    private EditText nome;
    private EditText telefone;
    private EditText endereco;
    private RatingBar nota;

    public void onCreate (Bundle savedInstanceState) {     super.onCreate(savedInstanceState);     setContentView(R.layout.formulario);     this.buscaComponentesDaTela();
        aluno = (Aluno) getIntent().getSerializableExtra("alunoSelecionado");
        Button botao = (Button) findViewById(R.id.botao);

        if (aluno == null) {
            aluno = new Aluno();
        } else {
            botao.setText("Alterar");
            populaTelaComDadosDoAluno();
        }

        botao.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                populaAlunoComDadosDaTela();
                AlunoDAO dao = new AlunoDAO(Formulario.this);
                if (aluno.getId() != null) {
                    dao.alterar(aluno);
                } else {
                    dao.inserir(aluno);
                }
                dao.close();
                finish();
            }
        });
    }

    private void buscaComponentesDaTela() {
        this.nome = (EditText) findViewById(R.id.nome);
        this.telefone = (EditText) findViewById(R.id.telefone);
        this.endereco = (EditText) findViewById(R.id.endereco);
        this.nota = (RatingBar) findViewById(R.id.nota);
    }

    private void populaAlunoComDadosDaTela() {
        this.aluno.setNome(this.nome.getEditableText().toString());
        this.aluno.setTelefone(this.telefone.getEditableText().toString());
        this.aluno.setEndereco(this.endereco.getEditableText().toString());
        this.aluno.setNota(this.nota.getRating());
    }

    private void populaTelaComDadosDoAluno() {
        this.nome.setText(aluno.getNome());
        this.telefone.setText(aluno.getTelefone());
        this.endereco.setText(aluno.getEndereco());
        this.nota.setRating(new Float(aluno.getNota()));
    }
}
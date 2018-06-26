package com.example.logonaf.agendaestudante;


import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import android.content.Intent;

import android.app.AlertDialog;
import android.content.DialogInterface;

public class MainActivity extends AppCompatActivity {
    Aluno aluno = new Aluno();
    private EditText txtId, txtNome, txtIdade, txtEmail;
    private Button btnAdd, btnDel, btnAlt, btnVis, btnTudo;
    private Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.telaagenda);

        this.buscaComponentesTela();

        btnAdd = (Button)findViewById(R.id.btnAdicionar);
        btnTudo = (Button)findViewById(R.id.btnVisualizarTudo);
        btnAlt = (Button)findViewById(R.id.btnAlterar);
        btnDel = (Button)findViewById(R.id.btnDeletar);
        btnVis = (Button)findViewById(R.id.btnVisualizar);

        txtId = (EditText)findViewById(R.id.txtId);
        txtNome = (EditText)findViewById(R.id.txtNome);
        txtIdade = (EditText)findViewById(R.id.txtIdade);
        txtEmail = (EditText)findViewById(R.id.txtEmail);

        intent = new Intent(this, AlunosGravados.class);

        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                populaObjeto();
                DataBase db = new DataBase(MainActivity.this);
                db.insert(aluno);
                Mensagem("Inserção","Mensagem de Gravação!");
                limpaCampos();
            }
        });

        btnTudo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(intent);
            }
        });

        btnAlt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                populaObjeto();
                DataBase db =  new DataBase(MainActivity.this);
                db.update(aluno);
                Mensagem("Alteração", "Mensagem de Alteração!");
            }
        });

        btnDel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Cria o gerador do AlertDialog
                new AlertDialog.Builder(MainActivity.this)
                        .setIcon(android.R.drawable.ic_dialog_alert)
                        //define o titulo
                        .setTitle("Exclusão de Aluno")
                        //define a mensagem
                        .setMessage("Deseja realmente excluir o aluno selecionado?")
                        //define um botão como SIM
                        .setPositiveButton("Sim", new DialogInterface.OnClickListener() {
                            //"Escutador da JANELA CRIADA
                            public void onClick(DialogInterface dialog, int which) {
                                DataBase db = new DataBase(MainActivity.this);
                                db.delete(Integer.parseInt(txtId.getText().toString()));
                                Mensagem("Excluir", "Mensagem de Exclusão!");
                            }
                        }).setNegativeButton("Nao",null).show();
            }
        });

        /*btnDel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DataBase db =  new DataBase(MainActivity.this);
                db.delete(Integer.parseInt(txtId.getText().toString()));
                Mensagem("Excluir", "Mensagem de Exclusão!");
            }
        });*/

        btnVis.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DataBase db = new DataBase(MainActivity.this);
                Aluno res = db.visualizar(Integer.parseInt(txtId.getText().toString()));

                txtId.setText(String.valueOf(res.getId()));
                txtNome.setText(res.getNome());
                txtIdade.setText(String.valueOf(res.getIdade()));
                txtEmail.setText(res.getEmail());
            }
        });

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    private void buscaComponentesTela() {
        this.txtId = (EditText) findViewById(R.id.txtId);
        this.txtNome = (EditText) findViewById(R.id.txtNome);
        this.txtIdade = (EditText) findViewById(R.id.txtIdade);
        this.txtEmail = (EditText) findViewById(R.id.txtEmail);
    }

    private void populaObjeto() {
        this.aluno.setId(Integer.parseInt(txtId.getText().toString()));
        this.aluno.setNome(this.txtNome.getEditableText().toString());
        this.aluno.setIdade(Integer.parseInt(this.txtIdade.getText().toString()));
        this.aluno.setEmail(this.txtEmail.getEditableText().toString());
    }

    public void Mensagem(String titulo, String texto){
        AlertDialog.Builder mensagem = new AlertDialog.Builder(MainActivity.this);
        mensagem.setTitle(titulo);
        mensagem.setMessage(texto);
        mensagem.setNeutralButton("OK", null);
        mensagem.show();
    }

    public void limpaCampos(){
        this.txtId.setText("");
        this.txtNome.setText("");
        this.txtIdade.setText("");
        this.txtEmail.setText("");
    }

}

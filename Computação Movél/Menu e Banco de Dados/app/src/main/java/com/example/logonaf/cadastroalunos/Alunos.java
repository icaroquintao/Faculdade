package com.example.logonaf.cadastroalunos;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;
import android.content.Intent;

import java.util.Arrays;
import java.util.List;


public class Alunos extends ActionBarActivity {
    private List<Aluno> alunos;
    private ListView listaAlunos;
    private Aluno alunoSelecionado;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_alunos);


        listaAlunos = (ListView) findViewById(R.id.alunos);

        carregaLista();

        listaAlunos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapter, View view, int posicao, long id) {
                Intent edicao = new Intent(Alunos.this, Formulario.class);
                edicao.putExtra("alunoSelecionado", (Aluno) listaAlunos.getItemAtPosition(posicao));
                startActivity(edicao);
            }
        });

        listaAlunos.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            public boolean onItemLongClick(AdapterView<?> adapter, View view, int posicao, long id) {
                alunoSelecionado = (Aluno) adapter.getItemAtPosition(posicao);
                registerForContextMenu(listaAlunos);
                return false;
            }
        });
        registerForContextMenu(listaAlunos);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        boolean resultado = super.onCreateOptionsMenu(menu);
        menu.add(0, 0, 0, "Novo");
        menu.add(0, 1, 0, "Sincronizar");
        menu.add(0, 2, 0, "Galeria");
        menu.add(0, 3, 0, "Mapa");
        return resultado;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 0) {
            Intent intent = new Intent(Alunos.this, Formulario.class);
            startActivity(intent);
            return false;
        } else {
            return super.onOptionsItemSelected(item);
        }
    }

    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        menu.add(0, 0, 0, "Ligar");
        menu.add(0, 1, 0, "Enviar SMS");
        menu.add(0, 2, 0, "Achar no Mapa");
        menu.add(0, 3, 0, "Navegar no site");

        MenuItem deletar = menu.add(0, 4, 0, "Deletar");
        deletar.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            public boolean onMenuItemClick(MenuItem item) {
                new AlertDialog.Builder(Alunos.this).setIcon(android.R.drawable.ic_dialog_alert).setTitle("Exclusao de Aluno").setMessage("Deseja realmente excluir o aluno selecionado?").setPositiveButton("Sim", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        AlunoDAO dao = new AlunoDAO(Alunos.this);
                        dao.deletar(alunoSelecionado);
                        dao.close();
                        carregaLista();
                    }
                }).setNegativeButton("Nao", null).show();
                return false;
            }
        });

        menu.add(0, 5, 0, "Enviar e-mail");
    }

    private void carregaLista() {
        AlunoDAO dao = new AlunoDAO(this);
        List<Aluno> alunos = dao.getLista();
        dao.close();
        ArrayAdapter<Aluno> adapter = new ArrayAdapter<Aluno>(this, android.R.layout.simple_list_item_1, alunos);
        listaAlunos.setAdapter(adapter);
    }

    protected void onResume() {
        super.onResume();
        carregaLista();
    }
}

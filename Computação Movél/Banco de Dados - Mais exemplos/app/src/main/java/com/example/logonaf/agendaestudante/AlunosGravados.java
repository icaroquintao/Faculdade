package com.example.logonaf.agendaestudante;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import java.util.List;


/**
 * Created by Administrador on 16/09/2015.
 */
public class AlunosGravados extends Activity {

    private Button btnVoltar;
    private List<Aluno> alunos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.alunoscadastrados);

        btnVoltar = (Button)findViewById(R.id.btnVoltar);
        ListView listaAlunos = (ListView) findViewById(R.id.lstAlunosGravados);

        DataBase db = new DataBase(this);
        alunos = db.selectTodosAlunos();

        ArrayAdapter<Aluno> adapter = new ArrayAdapter<Aluno> (this,android.R.layout.simple_list_item_1,alunos);
        listaAlunos.setAdapter(adapter);

        btnVoltar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}

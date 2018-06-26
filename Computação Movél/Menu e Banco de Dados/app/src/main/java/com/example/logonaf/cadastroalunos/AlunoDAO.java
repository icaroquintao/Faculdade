package com.example.logonaf.cadastroalunos;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

public class AlunoDAO extends SQLiteOpenHelper {
    private static final String[] COLS = {"id","nome","telefone","endereco","nota"};
    private static final int VERSAO = 1;
    private static final String TABELA = "Aluno";
    private static final String DATABASE = "Banco";

    public AlunoDAO(Context context) {
        super(context, DATABASE, null, VERSAO);
    }

    public void onCreate(SQLiteDatabase db) {
        String ddl = "CREATE TABLE " + TABELA +
                " (id INTEGER PRIMARY KEY, " +
                " nome TEXT UNIQUE NOT NULL, " +
                " telefone TEXT, endereco TEXT, " +
                " nota REAL);";
        db.execSQL(ddl);
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        String sql = "DROP TABLE IF EXISTS " + TABELA;
        db.execSQL(sql);
        onCreate(db);
    }

    public void inserir(Aluno aluno) {
        ContentValues values = new ContentValues();
        values.put("nome", aluno.getNome());
        values.put("telefone", aluno.getTelefone());
        values.put("endereco", aluno.getEndereco());
        values.put("nota", aluno.getNota());
        getWritableDatabase().insert(TABELA, null, values);
    }

    public List<Aluno> getLista() {
        List<Aluno> alunos = new ArrayList<Aluno>();
        Cursor c = getWritableDatabase().query(TABELA, COLS, null, null, null, null, null);
        while (c.moveToNext()) {
            Aluno aluno = new Aluno();
            aluno.setId(c.getLong(0));
            aluno.setNome(c.getString(1));
            aluno.setTelefone(c.getString(2));
            aluno.setEndereco(c.getString(3));
            aluno.setNota(c.getDouble(4));
            alunos.add(aluno);
        }
        c.close();
        return alunos;
    }

    public void deletar(Aluno aluno) {
        getWritableDatabase().delete(TABELA, "id=?", new String[]{aluno.getId().toString()});
    }

    public void alterar(Aluno aluno) {
        ContentValues values = new ContentValues();
        values.put("nome", aluno.getNome());
        values.put("telefone", aluno.getTelefone());
        values.put("endereco", aluno.getEndereco());
        values.put("nota", aluno.getNota());
        getWritableDatabase().update(TABELA, values, "id=?", new String[]{aluno.getId().toString()});
    }
}

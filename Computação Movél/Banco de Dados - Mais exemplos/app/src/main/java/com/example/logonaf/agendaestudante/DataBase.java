package com.example.logonaf.agendaestudante;

/**
 * Created by Administrador on 15/09/2015.
 */

/*
importando pacotes para utilização do banco
 */
import android.content.Context;
import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

import android.database.Cursor;

public class DataBase extends SQLiteOpenHelper {

    //Número de versão de atualização
    //Toda vez que Adicioanr, Editar é necessário trocar a versão

    //Número da versão
    private static final int DATABASE_VERSION = 1;

    // Nome do banco de dados
    private static final String DATABASE_NAME = "Agenda";

    public DataBase(Context context ) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        //Método para criação de tabelas ou todas tabelas
        String CREATE_TABLE_STUDENT = "CREATE TABLE ContatoAluno ("
                + "id INTEGER PRIMARY KEY AUTOINCREMENT ,"
                + "nome TEXT, "
                + "idade INTEGER, "
                + "email TEXT )";

        db.execSQL(CREATE_TABLE_STUDENT);

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Drop older table if existed, all data will be gone!!!
        db.execSQL("DROP TABLE IF EXISTS ContatoAluno" );

        // Create tables again
        onCreate(db);

    }

    public void insert(Aluno aluno) {
        ContentValues values = new ContentValues();
        values.put("nome", aluno.getNome());
        values.put("idade",aluno.getIdade());
        values.put("email", aluno.getEmail());
        getWritableDatabase().insert("ContatoAluno", null, values);

        getWritableDatabase().insert("ContatoAluno", null, values);

    }

    public ArrayList<Aluno> selectTodosAlunos() {
        String selectQuery =  "SELECT id,nome,idade,email FROM ContatoAluno";

        ArrayList<Aluno> alunolista = new ArrayList<Aluno>();

        Cursor cursor = getReadableDatabase().rawQuery(selectQuery, null);

        while (cursor.moveToNext()){
            Aluno aluno = new Aluno();
            aluno.setId(cursor.getInt(0));
            aluno.setNome(cursor.getString(1));
            aluno.setIdade(cursor.getInt(2));
            aluno.setEmail(cursor.getString(3));
            alunolista.add(aluno);
        }
        cursor.close();
        return alunolista;
    }

    public void update(Aluno aluno){
        ContentValues values = new ContentValues();
        values.put("nome",aluno.getNome());
        values.put("idade",aluno.getIdade());
        values.put("email", aluno.getEmail());
        getWritableDatabase().update("ContatoAluno", values, "id=?", new String[]{String.valueOf(aluno.getId())});
    }

    public void delete(int id){
        getWritableDatabase().delete("ContatoAluno", "id=?", new String[]{String.valueOf(id)});
    }

    public Aluno visualizar(int id) {
        Cursor c = getWritableDatabase().rawQuery("SELECT id,nome,idade,email FROM ContatoAluno where id =" + id,null);
        Aluno result_aluno = new Aluno();
        if (c.moveToFirst()) {
            result_aluno.setId(Integer.parseInt(c.getString(0)));
            result_aluno.setNome(c.getString(1));
            result_aluno.setIdade(Integer.parseInt(c.getString(2)));
            result_aluno.setEmail(c.getString(3));
        }
        return  result_aluno;
    }


}

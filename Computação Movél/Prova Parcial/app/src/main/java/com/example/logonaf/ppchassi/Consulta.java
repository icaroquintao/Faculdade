package com.example.logonaf.ppchassi;

/**
 * Created by logonaf on 06/10/2015.
 */
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Consulta extends Activity {
    private TextView tPais, tFabricante, tAno;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_consulta);

        Intent intent = getIntent();

        String interesses = intent.getStringExtra("interesses");
        String pais = intent.getStringExtra("pais");
        String Fabricante = intent.getStringExtra("marca");
        String Ano = intent.getStringExtra("ano");

        tPais = (TextView) findViewById(R.id.texPais);
        tFabricante = (TextView) findViewById(R.id.txtFrabricante);
        tAno = (TextView) findViewById(R.id.txtAno);


    }
}


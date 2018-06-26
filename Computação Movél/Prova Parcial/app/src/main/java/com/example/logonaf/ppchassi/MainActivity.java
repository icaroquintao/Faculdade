package com.example.logonaf.ppchassi;

import android.content.Intent;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;


public class MainActivity extends ActionBarActivity {

    private EditText Chassi, Informacao;
    private TextView info;
    private Button  btnInfoVeiculo, btnFimConsulta;
    private Intent intent;
    String fabricacao, fabricante, AnoFabricacao, pais, marca, ano;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Chassi = (EditText) findViewById(R.id.txtChassi);
        Informacao = (EditText) findViewById(R.id.txtInfo);
        info = (TextView) findViewById(R.id.LBinfo);

        btnInfoVeiculo = (Button) findViewById(R.id.btnInfoVeiculo);

        intent = new Intent(this,Consulta.class);

      btnInfoVeiculo.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v) {

           fabricacao = Chassi.getText().toString();
           fabricacao.substring(0, 1);

                    if (fabricacao.equals("5A")) {
                        pais = "Estados Unidos";
                    } else if (fabricacao.equals("8A")) {
                        pais = "Argentina";
                    } else if (fabricacao.equals("8F")) {
                        pais = "Chile";
                    } else if (fabricacao.equals("8L")) {
                        pais = "Equador";
                    } else if (fabricacao.equals("9A")) {
                        pais = "Brasil";
                    } else if (fabricacao.equals("9L")) {
                        pais = "Paraguai";
                    } else if (fabricacao.equals("9S")) {
                        pais = "Uruguai";
                    }

           fabricante = Chassi.getText().toString();
           fabricante.substring(1, 2);

           if(fabricante.equals("A")) {
               marca = "Fiat";
           }else if(fabricante.equals("D")) {
               marca = "Fiat nacional";
           }else if(fabricante.equals("F")) {
               marca = "Ford";
           }else if(fabricante.equals("G")) {
               marca = "GM";
           }else if(fabricante.equals("R")) {
               marca = "Toyota";
           }else if(fabricante.equals("W")) {
               marca = "VW do Brasil";
           }else if(fabricante.equals("U")) {
               marca = "Audi";
           }else if(fabricante.equals("Y")) {
               marca = "Renault";
           }

           AnoFabricacao = Chassi.getText().toString();
           AnoFabricacao.substring(2,9);

           if(AnoFabricacao.equals("Y")) {
               ano = "2000";
           }else if(AnoFabricacao.equals("1")) {
               ano = "2001";
           }else if(AnoFabricacao.equals("2")) {
               ano = "2002";
           }else if(AnoFabricacao.equals("3")) {
               ano = "2003";
           }else if(AnoFabricacao.equals("4")) {
               ano = "2004";
           }else if(AnoFabricacao.equals("5")) {
               ano = "2005";
           }else if(AnoFabricacao.equals("6")) {
               ano = "2006";
           }else if(AnoFabricacao.equals("7")) {
               ano = "2007";
           }else if(AnoFabricacao.equals("8")) {
               ano = "2008";
           }else if(AnoFabricacao.equals("9")) {
               ano = "2009";
           }else if(AnoFabricacao.equals("A")) {
               ano = "2010";
           }else if(AnoFabricacao.equals("B")) {
               ano = "2011";
           }else if(AnoFabricacao.equals("C")) {
               ano = "2012";
           }else if(AnoFabricacao.equals("D")) {
               ano = "2013";
           }else if(AnoFabricacao.equals("E")) {
               ano = "2014";
           }else if(AnoFabricacao.equals("F")) {
               ano = "2015";
           }else if(AnoFabricacao.equals("G")) {
               ano = "2016";
           }
           Informacao.setText("País: " + pais + " / Fabricante: " + marca +"/ Ano Fabricançap" + ano);

            }
        });

        btnFimConsulta.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {

                StringBuffer interesses = new StringBuffer();

                intent.putExtra("pais", pais);
                intent.putExtra("Fabricante", marca);
                intent.putExtra("Ano", ano);
                intent.putExtra("interesses", interesses.toString());

                startActivity(intent);
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
}

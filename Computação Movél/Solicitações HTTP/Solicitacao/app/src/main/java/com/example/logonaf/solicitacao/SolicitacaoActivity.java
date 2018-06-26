package com.example.logonaf.solicitacao;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;




public class SolicitacaoActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        Button btnimc = (Button) findViewById(R.id.btnhttp);
        final TextView txtResp = (TextView) findViewById(R.id.txthttp);
        final EditText txtpais = (EditText) findViewById(R.id.txtpais);

        btnimc.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                String respostaHttp = "";
                try {
                    String paisSolicitado = txtpais.getText().toString();
                    URL u  = new  URL ("http://cpa.cruzeirodosulvirtual.com.br:8080/cpa/paisesTxt.jsp?pais=" + paisSolicitado);
                    HttpURLConnection conn = (HttpURLConnection) u.openConnection();
                    conn.setRequestMethod("GET");
                    conn.setDoInput(true);  //true se esta conexao permite entrada
                    conn.setDoOutput(false); //true se a conexao permite saida
                    conn.connect();
                    InputStream in = conn.getInputStream();
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    try {
                        byte[] buffer = new byte[1024];
                        int len;
                        while ((len = in.read(buffer)) > 0) {
                            bos.write(buffer, 0, len);
                        }
                        byte bytes[];
                        bytes = bos.toByteArray();
                        respostaHttp = new String(bytes, "ISO-8859-1");
                    }
                    catch(Exception ee) {
                        respostaHttp += "IOException " + ee.getMessage();
                    } finally {
                        bos.close();
                        in.close();
                        conn.disconnect();
                    }
                } catch (MalformedURLException emf) {
                    respostaHttp+="MalformedURLException" + emf.getMessage();
                } catch (IOException eio) {
                    respostaHttp += "IOException" + eio.getMessage();
                }
                txtResp.setText("\nResposta HTTP:\n\n" + respostaHttp);
            }
        });











    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_solicitacao, menu);
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

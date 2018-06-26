package com.example.logonaf.solicitacao2;


import android.os.Handler;
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



public class Solicitacao2Activity extends ActionBarActivity {
    private TextView txtResp = null;
    private EditText txtpais = null;
    private Handler handler = new Handler();



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        Button btnimc = (Button) findViewById(R.id.btnhttp);
        txtResp = (TextView) findViewById(R.id.txthttp);
        txtpais = (EditText) findViewById(R.id.txtpais);

        btnimc.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                txtResp.setText("Esperamos resposta do servidor...");
                // ou usando um quadro de diálogo de progresso:
			/*   d = ProgressDialog.show(
                          v.getContext(),"Aguarde",
                         "Esperamos resposta do servidor...",false,true);   */
                ThreadSolicitacaoHttp tr = new ThreadSolicitacaoHttp();
                tr.start();
            }
        });
    }

    class ThreadSolicitacaoHttp extends Thread {
        // classe interna derivada de Thread para efetuar
        // a solicitação HTTP e esperar pela resposta

        public ThreadSolicitacaoHttp() {
        }

        public void run() {
            String respostaHttp = "";
            HttpURLConnection conn = null;
            InputStream in = null;
            ByteArrayOutputStream bos = null;
            final TextView txtResp = (TextView) findViewById(R.id.txthttp);
            try {
                final String paisSolicitado = txtpais.getText().toString();
                URL u = new URL("http://cpa.cruzeirodosulvirtual.com.br:8080/cpa/paisesTxt.jsp?pais="+ paisSolicitado);
                conn = (HttpURLConnection) u.openConnection();
                conn.setConnectTimeout(7000); // 7 segundos de timeout
                conn.setRequestMethod("GET");
                conn.setDoInput(true);  //true se esta conexão permite entrada
                conn.setDoOutput(false); //true se a conexão permite saída
                conn.connect();
                in = conn.getInputStream();
		/*Bloco necessário para ler blocos de bytes recebidos pelo fluxo
		  de entrada in, que é a resposta HTTP retornada pelo servidor */
                bos = new ByteArrayOutputStream();
                byte[] buffer = new byte[1024];
                int len;
                while ((len = in.read(buffer)) > 0) {
                    bos.write(buffer, 0, len);
                }
                byte bytes[];
                bytes = bos.toByteArray(); // guardamos a resposta final num byte[]
                respostaHttp = new String(bytes, "ISO-8859-1");  // de byte[] para String
            } catch (MalformedURLException emf) {
                respostaHttp += emf.getMessage();
            } catch (IOException eio) {
                respostaHttp += eio.getMessage()
                        + ". O servidor não respondeu adequadamente ou no limite de"+
                        "7 segundos. Por favor, verifique se o aparelho tem"+
                        "conexão com Internet. Verifique a URL utilizada pelo App.";
                conn.disconnect();
            } catch (Exception ex) {
                respostaHttp += ex.getMessage();
            } finally {
                try {
                    if (bos != null) bos.close();
                    if (in != null) in.close();
                    if (conn != null) conn.disconnect();
                } catch (IOException ioe2) {
                    respostaHttp += ioe2.getMessage();
                }
            }
            // Este handler será necessário para modificar objetos do visual da
            // Activity, que está em outro Thread (ele foi criado na Activity).
            final String arespostaHttp = respostaHttp;
            handler.post(new Runnable() {
                @Override
                public void run() {
                    //Mostramos a resposta do servidor na tela do aparelho:
                    txtResp.setText("\n\n" + arespostaHttp + "\n\n");
                }
            });
        }// run
    } // ThreadSolicitacaoHttp



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_solicitacao2, menu);
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

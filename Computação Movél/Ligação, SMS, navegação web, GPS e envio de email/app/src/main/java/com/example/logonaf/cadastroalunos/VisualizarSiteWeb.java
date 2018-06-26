package com.example.logonaf.cadastroalunos;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebView;

public class VisualizarSiteWeb extends ActionBarActivity {

    private Aluno aluno;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.web);

        WebView view = (WebView) findViewById(R.id.webViewSite);
        aluno = (Aluno) getIntent().getSerializableExtra("alunoSelecionado");

        String url = "http://m.uol.com.br";
        view.loadUrl(url);
    }
}


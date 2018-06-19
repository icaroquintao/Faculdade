<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateProdutoRequest;
use App\Http\Requests\EditProdutoRequest;
use App\Produto;
use App\TipoProduto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('produto.index')->with('produtos', Produto::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('produto.create')->with('tipos', TipoProduto::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProdutoRequest $request)
    {
        $caminhoImagem = $request->file('imagem')->storePublicly('public/imagens/produtos');

        Produto::create([
            'nome' => $request->get('nome'),
            'preco' => $request->get('preco'),
            'tipo_produto_id' => $request->get('tipo'),
            'caminho_imagem' => $caminhoImagem,
        ]);

        return redirect()->route('produto.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Produto  $produto
     */
    public function edit(Produto $produto)
    {
        return view('produto.edit')->with(['produto' => $produto, 'tipos' => TipoProduto::all()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function update(EditProdutoRequest $request, Produto $produto)
    {
        if($request->hasFile('imagem'))
        {
            unlink(storage_path() . '/app/' . $produto->caminho_imagem);
            $produto->caminho_imagem = $request->file('imagem')->storePublicly('public/imagens/produtos');
        }

        $produto->nome = $request->get('nome');
        $produto->preco = $request->get('preco');
        $produto->tipo_produto_id = $request->get('tipo');
        $produto->save();

        return redirect()->route('produto.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Produto $produto)
    {
        unlink(storage_path() . '/app/' . $produto->caminho_imagem);
        $produto->delete();
        return redirect()->route('produto.index');
    }
}

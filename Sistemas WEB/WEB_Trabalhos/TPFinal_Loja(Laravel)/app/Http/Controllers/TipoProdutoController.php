<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTipoProduto;
use App\Http\Requests\EditTipoProduto;
use App\TipoProduto;
use Illuminate\Http\Request;

class TipoProdutoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     */
    public function index()
    {
        return view('tipoproduto.index')->with('tipos', TipoProduto::all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('tipoproduto.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateTipoProduto $request)
    {
        TipoProduto::create([
            'nome' => $request->get('nome')
        ]);

        return redirect()->route('tipoproduto.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\TipoProduto  $tipoProduto
     */
    public function edit(TipoProduto $tipoProduto)
    {
        return view('tipoproduto.edit')->with('tipo', $tipoProduto);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\TipoProduto  $tipoProduto
     * @return \Illuminate\Http\Response
     */
    public function update(EditTipoProduto $request, TipoProduto $tipoProduto)
    {
        $tipoProduto->update(['nome' => $request->get('nome')]);
        return redirect()->route('tipoproduto.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\TipoProduto  $tipoProduto
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoProduto $tipoProduto)
    {
        $tipoProduto->delete();
        return back();
    }
}

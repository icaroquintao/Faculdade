<?php

namespace App\Http\Controllers;

use App\Compra;
use App\Http\Requests\EditCompraRequest;
use Illuminate\Http\Request;

class CompraController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('compra.index')->with('compras', Compra::with('cliente')->get());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Compra  $compra
     */
    public function show(Compra $compra)
    {
        return view('compra.show')->with('compra', $compra);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Compra  $compra
     */
    public function edit(Compra $compra)
    {
        return view('compra.edit')->with('compra', $compra);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Compra  $compra
     * @return \Illuminate\Http\Response
     */
    public function update(EditCompraRequest $request, Compra $compra)
    {
        $compra->update([
            'pago' => $request->get('pago'),
        ]);

        return redirect()->route('compra.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Compra  $compra
     * @return \Illuminate\Http\Response
     */
    public function destroy(Compra $compra)
    {
        foreach ($compra->transacoes as $transacao) $transacao->delete();
        $compra->delete();

        return redirect()->route('compra.index');
    }

    public function comprasUsuario()
    {
        return view('compra.index')->with('compras', auth()->user()->compras);
    }

    public function compraUsuarioDetalhes($compraId)
    {
        return view('compra.show')->with('compra', Compra::find($compraId));
    }
}

<?php

namespace App\Http\Controllers;

use App\Http\Requests\EditTransacaoRequest;
use App\Produto;
use App\Transacao;

class TransacaoController extends Controller
{

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Transacao  $transacao
     */
    public function edit(Transacao $transacao)
    {
        return view('transacao.edit')->with(['transacao' => $transacao, 'produtos' => Produto::all()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Transacao  $transacao
     * @return \Illuminate\Http\Response
     */
    public function update(EditTransacaoRequest $request, Transacao $transacao)
    {
        $transacao->update([
            'produto_id' => $request->get('produto'),
            'cor' => $request->get('cor'),
            'quantidade' => $request->get('quantidade'),
            'bordado' => $request->get('bordado'),
        ]);

        return redirect()->route('compra.show', $transacao->compra->id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Transacao  $transacao
     * @return \Illuminate\Http\Response
     */
    public function destroy(Transacao $transacao)
    {
        $transacao->delete();
        return back();
    }
}

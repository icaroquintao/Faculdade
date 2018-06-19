<?php

namespace App\Http\Controllers;

use App\Compra;
use App\Http\Requests\AdicionarCarrinhoRequest;
use App\Transacao;

class CarrinhoController extends Controller
{
    /**
     * Adiciona um produto com suas características no carrinho de compras.
     * @param AdicionarCarrinhoRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function adicionarProduto(AdicionarCarrinhoRequest $request)
    {
        $carrinho = session()->pull('carrinho', null);
        if(is_null($carrinho)) $carrinho = array();

        $transacao = new Transacao();
        $transacao->produto_id = $request->get('produto');
        $transacao->quantidade = $request->get('quantidade');
        $transacao->cor = $request->get('cor');
        $transacao->bordado = $request->get('bordado');

        $carrinho[] = $transacao;

        session()->put('carrinho', $carrinho);

        return back();
    }

    public function visualizar()
    {
        return view('carrinho.index')->with('carrinho', session('carrinho', array()));
    }

    /**
     * Retira um item do carrinho.
     */
    public function removerProduto($itemId)
    {
        $carrinho = session()->pull('carrinho');
        unset($carrinho[$itemId]);
        session()->put($carrinho);

        return back();
    }

    /**
     * Finaliza o carrinho, transformando-o em uma compra e cada item vira uma transação desta compra.
     * @return \Illuminate\Http\RedirectResponse
     */
    public function finalizar()
    {
        $carrinho = session()->pull('carrinho', null);

        if(!is_null($carrinho))
        {
            $compra = Compra::create([
                'usuario_id' => auth()->id(),
                'pago' => 0,
            ]);

            foreach ($carrinho as $transacao)
            {
                $transacao->compra_id = $compra->id;
                $transacao->save();
            }
        }

        return redirect()->route('painel');
    }

    /**
     * Remove todos os itens do carrinho.
     * @return \Illuminate\Http\RedirectResponse
     */
    public function limpar()
    {
        session()->forget('carrinho');
        return back();
    }
}

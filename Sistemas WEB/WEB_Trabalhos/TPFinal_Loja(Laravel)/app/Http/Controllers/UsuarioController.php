<?php

namespace App\Http\Controllers;

use App\Http\Requests\EditUsuarioRequest;
use App\TipoUsuario;
use App\Usuario;
use Illuminate\Http\Request;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('usuario.index')->with('usuarios', Usuario::with('tipo')->get());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Usuario  $usuario
     */
    public function show(Usuario $usuario)
    {
        return view('usuario.show')->with(['usuario' => $usuario]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Usuario  $usuario
     */
    public function edit(Usuario $usuario)
    {
        return view('usuario.edit')->with(['usuario' => $usuario, 'tipos' => TipoUsuario::all()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function update(EditUsuarioRequest $request, Usuario $usuario)
    {
        $usuario->update([
            'nome' => $request->get('nome'),
            'email' => $request->get('email'),
            'senha' => $request->get('senha') ? bcrypt($request->get('senha')) : $usuario->senha,
            'endereco' => $request->get('endereco'),
            'telefone' => $request->get('telefone'),
            'tipo_usuario_id' => $request->get('tipo')
        ]);

        if(auth()->user()->tipo->nome != 'Administrador') return redirect()->route('painel');
        else return redirect()->route('usuario.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuario $usuario)
    {
        $usuario->delete();
        return redirect()->route('usuario.index');
    }

    public function verDados()
    {
        return view('usuario.edit')->with(['usuario' => auth()->user(), 'tipos' => TipoUsuario::all()]);
    }
}

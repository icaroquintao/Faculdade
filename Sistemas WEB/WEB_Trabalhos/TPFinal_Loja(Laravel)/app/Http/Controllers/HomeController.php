<?php

namespace App\Http\Controllers;

use App\Produto;

class HomeController extends Controller
{

    /**
     * Show the site index.
     */
    public function index()
    {
        return view('welcome')->with('produtos', Produto::all());
    }

    public function painel()
    {
        return view('home');
    }
}

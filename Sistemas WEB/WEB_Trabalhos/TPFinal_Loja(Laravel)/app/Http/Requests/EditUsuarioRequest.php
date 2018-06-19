<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class EditUsuarioRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nome' => 'required|max:255',
            'email' => ['required', 'email', 'max:255', Rule::unique('usuarios')->ignore($this->request->get('email'), 'email')],
            'senha' => 'nullable|min:6|confirmed',
            'endereco' => 'required|max:255',
            'telefone' => 'nullable|max:255',
            'tipo' => 'required|exists:tipos_usuarios,id',
        ];
    }
}

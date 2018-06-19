<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditTransacaoRequest extends FormRequest
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
            'produto' => 'required|exists:produtos,id',
            'quantidade' => 'required|min:1',
            'bordado' => 'required|string|max:255',
            'cor' => 'required|string|max:255'
        ];
    }
}

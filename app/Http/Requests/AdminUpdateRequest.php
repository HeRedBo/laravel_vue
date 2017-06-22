<?php

namespace App\Http\Requests;


class AdminUpdateRequest extends Request
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
            'username' => 'required||min:4|max:255',
            'name'=>'required|unique:admin_roles,name,'.$this->get('id').'|max:255',
        ];
    }
}

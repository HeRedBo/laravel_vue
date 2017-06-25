<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PermissionUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
         return [
            'name'         => 'required|unique:admin_permissions,name,'.$this->get('id').'|max:225',
            'display_name' => 'unique:admin_permissions,display_name,'.$this->get('id').'|max:225',
            'parent_id'    => 'required|int'
        ];
    }
}

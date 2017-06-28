<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'admin_roles';

    public function permissions()
    {
        return $this->belongsToMany(permission::class, 'admin_permission_role','role_id','permission_id');
    }
}

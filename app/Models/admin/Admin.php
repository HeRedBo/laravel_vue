<?php

namespace App\Models\admin;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Storage;

class Admin extends Authenticatable
{
   use Notifiable;
   protected $table = 'admin';
   protected $softDelete = true;

  
   /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

     /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    

    public function roles() 
    {
      return $this->belongsToMany(Role::class,'admin_role_user','user_id','role_id');
    }

    public function hasRole($role)
    {
        if(is_string($role))
        {
            return $this->roles->contains('name',$role);
        }
        return !!$role->intersect($this->roles)->count();
    }

    public function hasPermission($permission)
    {
        if(is_string($permission))
        {
            $permission = permission::where('name', $permission)->first();
            if(!$permission) return false;
        }
        return $this->hasRole($permission->roles);
    }

    /**
     * 角色整体添加与修改
     * @param  array  $roleId 角色ID数组
     * @return void
     */
    public function giveRoleTo(array $roleId)
    {
        $this->roles()->detach();
        $roles = Role::whereIn('id',$RoleId)->get();
        foreach ($roles as $v) {
          $this->assignRole($v);
        }
        return true;
    }

    public function assignRole($role) 
    {
        return $this->roles()->save($role);
    }

    public function getPictureAttribute($pic)
    {
        if ($pic) {
            return Storage::disk('local')->url($pic);
        } else {
            return Storage::disk('local')->url('admin/noavatar.png');
        }
    }
}

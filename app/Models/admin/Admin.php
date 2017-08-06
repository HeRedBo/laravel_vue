<?php

namespace App\Models\admin;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class Admin extends Authenticatable
{
   use Notifiable;
   protected $table = 'admin';
   protected $appends = ['isOnLine'];
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

    /**
     * 判断用户是否具有某个角色
     * @param  mixed  $role 角色模型
     * @return boolean 
     */
    public function hasRole($role)
    {
        if(is_string($role))
        {
            return $this->roles->contains('name',$role);
        }

        return !!$role->intersect($this->roles)->count();
    }

    /**
     * 判断用户是否觉有某权限
     * @param mixed  $permission  权限数据对象
     * @return boolean    
     */
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
        $roles = Role::whereIn('id',$roleId)->get();
        foreach ($roles as $v) {
          $this->assignRole($v);
        }
        return true;
    }


    /**
     * 给用户分配权限
     * @param  mixed $role 角色数据对象
     * @return 
     */
    public function assignRole($role) 
    {
        return $this->roles()->save($role);
    }

    public function getPictureAttribute($pic)
    {

        if(\Request::method() == 'PUT' || \Request::method() == "DELETE")
        {
            return $pic;
        }
        if ($pic) 
        {
            return Storage::disk('local')->url($pic);
        } else 
        {
            return Storage::disk('local')->url('admin/noavatar.png');
        }
        
    }

    public function getIsOnLineAttribute()
    {
        $key=Redis::hExists('ADMIN_USERS', $this->id);
        return $key;
    }
}

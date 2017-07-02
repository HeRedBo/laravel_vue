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

    public function users()
    {
        return  $this->belongsToMany(AdminUser::class,'admin_role_user','role_id','user_id');
    }

    /**
     * 给角色添加相关权限
     * @param  array $permission 
     * @return bool
     */
    public function givePermissionTo($permission)
    {
        return $this->permissions()->save($permissions);
    }

    /**
     * 角色权限添加与修改
     * @param  array  $permissionId 
     * @return bool
     */
    public function givePermissionsTo(array $permissionId)
    {
        $this->permissions()->detach();
        $permissions = permission::whereIn('id',$permissionId)->get();
        foreach ($permissions as $k => $v) 
        {
            $this->givePermissionTo($v);

        }
        return true;
    }


    public function getTreeData()
    {
        $data = [];
        $permission = new permission();
        $list = $permission->query()
            ->orderBy('order_num','DESC')
            ->get()
            ->toArray();

        foreach ($list as $k => $v) 
        {
            if($v['parent_id'] == 0) 
            {
                $data[$k]['id'] = $v['id'];
                $data[$k]['parent'] = '#';
                $data[$k]['text'] = $v['display_name'];
                $data[$k]['state'] = ['opened' => true];
            } 
            else
            {
                $data[$k]['id'] = $v['id'];
                $data[$k]['parent']= $v['parent_id'];
                $data[$k]['text'] = $v['display_name'];

            }
            $isExists = $this->permissions->contains('id',$v['id']);
            if($isExists)
            {
                $data[$k]['state'] = ['opened' => true, 'selected' => true];
            }

        }

        return $data;
    }
}

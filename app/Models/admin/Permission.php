<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
	protected $table = 'admin_permissions';
    
    public function roles() 
    {
         return $this->belongsToMany(Role::class,'admin_permission_role','permission_id','role_id');
    }
    
    /**
     * 获取jstree josn 数据
     * @return arrary 
     */
    public function getTreeData()
    {
    	$data = [];
    	$list = $this->query()
    				 ->orderBy('order_num','DESC')
    				 ->get()
    				 ->toArray();
    	foreach ($list as $k => $v) 
    	{
    		if($v['parent_id'] == 0) {
    			$data[$k]['id'] = $v['id'];
    			$data[$k]['parent'] = '#';
    			$data[$k]['text'] = $v['display_name'];
    			$data[$k]['state'] = ['opened' => true];
    		} else {
    			$data[$k]['id'] = $v['id'];
    			$data[$k]['parent'] = $v['parent_id'];
    			$data[$k]['text'] = $v['display_name'];
    		}
    	}
    	return $data;
    }

    
    public function getSelectList()
    {
        $list = $this->query()
            ->orderBy('order_num', 'DESC')->get()->toArray();
        return $this->_reSort($list, 0, 0);
    }

    private function _reSort($data, $parent_id, $level = 0)
    {
        static $arr = [['label' => '根', 'value' => 0]];
        foreach ($data as $k => $v) 
        {
            if($v['parent_id'] == $parent_id)
            {
                $v['level'] = $level;
                $display_name = str_repeat('--',$level).$v['display_name'];
                $arr[] = ['label' => $display_name, 'value' => $v['id']];
                unset($data[$k]);
                $this->_reSort($data, $v['id'], $level+1);
            }
        }
        return $arr;
    }
}

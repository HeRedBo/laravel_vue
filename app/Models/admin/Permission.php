<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
	protected $table = 'admin_permissions';
    
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

    
    public function getSelectList($id = 0,$lev = 0)
    {
    	$list = $this->query()->where('parent_id',$id)
    			->orderBy('order_num','DESC')
    			->get()
    			->toArray();
    	static $arr = [['label' => '根', 'value' => 0]];
    	$tag = '';
    	foreach ($list as $k => $v) {
    		$tag =str_repeat('-', $lev);
    		$v['display_name'] = $tag. $v['display_name'];
    		$arr[] = ['label' => $v['display_name'],'value' => $v['id']];
    		$this->getSelectList($v['id'], $lev + 1);
    	}
    	return $arr;
    }
}

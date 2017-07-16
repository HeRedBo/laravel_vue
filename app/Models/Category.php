<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
   	protected $table = 'category';

    /**
     * 给jstree 提供json 数据
     * @return  array 
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
   			if($v['parent_id'] == 0)
   			{
   				$data[$k]['id'] = $v['id'];
   				$data[$k]['parent'] = '#';
   				$data[$k]['text'] = $v['name'];
   				$data[$k]['state'] = ['appened' => true];
   			}
   			else
   			{
   				$data[$k]['id'] = $v['id'];
   				$data[$k]['parent'] = $v['parent_id'];
   				$data[$k]['text'] = $v['name'];
   			}
   		}
   		return $data;
   	}


 	/**
 	 * 获取分类下拉列表
 	 * @return array 
 	 */
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
                $name = str_repeat('--',$level).$v['name'];
                $arr[] = ['label' => $name, 'value' => $v['id']];
                unset($data[$k]);
                $this->_reSort($data, $v['id'], $level+1);
            }
        }
        return $arr;
    }
}

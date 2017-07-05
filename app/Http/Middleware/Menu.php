<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Admin\Admin;
use App\Models\Admin\Permission;
use App\Models\Admin\Role;
use Auth, Cache;

class Menu
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $request->attributes->set('adminMenuData',$this->getMenu());
        return $next($request);
    }

    protected function getMenu()
    {
        $data = Cache::store('file')->get('menus',function()
        {
            $data = [];
            $uid = Auth::guard('admin')->user()->id;
            $user = Admin::find($uid);
            $level0 = Permission::where('parent_id','0')->orderBy('order_num','desc')->get()->toArray();
            $parentIds  =  array_unique(array_column($level0,'id'));
            $subPermissions = Permission::whereIn('parent_id',$parentIds)
                              ->where('is_show',1)
                              ->orderBy('order_num','desc')
                              ->get()
                              ->toArray();
            $subLevels = [];
            foreach ($subPermissions as $key => $val)
            {
                $subLevels[$val['parent_id']][] = $val;
            }
            foreach ($level0 as $key => $val) 
            {
                $subLevel = isset($subLevels[$val['id']]) ? $subLevels[$val['id']] : [];
                foreach ($subLevel as $k => $v)
                {
                    $subLevel[$k]['url'] = '/' .str_replace('.', '/', $v['name']);
                    if(!$user->hasPermission($v['name']) && $uid != 1) {
                        unset($subLevel[$k]);
                    }
                }
                if(!empty($subLevel)) {
                    $data[$val['name']] = $val;
                    $data[$val['name']]['children'] = $subLevel;
                }
            }
            return $data;
        });
        return $data;
    }
}

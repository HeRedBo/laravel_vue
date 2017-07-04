<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Event;
use App\Events\AdminLogger;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Http\Requests\RoleCreateRequest;
use App\Http\Requests\RoleUpdateRequest;
use App\Models\Admin\Role;
class RoleController extends Controller
{
    protected $fields = [
        'name' => '',
        'description' => '',
        'permission' => [],
    ];

    protected $pageSize = 15;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->ajax())
        {
            $data  = [];
            $sort  = $request->get('sort');
            $keyword = $request->get('keyword');
            $perPage = $request->get('perPage') ?: $this->pageSize;
            $query   = Role::query();
            if($keyword)
            {
                $query->where('name',  'LIKE', '%'.$keyword.'%');
            }

            if($sort[0])
            {
                $query->orderBy($sort[0],$sort[1]);
            }

            $data = $query->paginate($perPage)->toArray();
            return response()->json($data);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RoleCreateRequest $request)
    {
        $role = new Role();
        $fields = array_keys($this->fields);
        foreach ($fields as  $field) 
        {
            $role->$field = $request->get($field);
        }
        unset($role->permission);
        $role->save();
        if(is_array($request->get('permission'))) {
            $role->permission()->sync($request->get('permission',[]));
        }
        Event::fire(new AdminLogger('create',"添加了后台角色【".$role->name."】"));
        $res['status'] = true;
        return response()->json($res);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(request $request)
    {
        $id = $request->get('id');
        $role = Role::find($id);
        return response()->json($role);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $role = Role::find($id);
        $fields = array_keys($this->fields);
        foreach ($fields as  $field) 
        {
            $role->$field = $request->get($field);
        }
        unset($role->permission);
        $role->save();
        if(is_array($request->get('permission'))) {
            $role->permission()->sync($request->get('permission',[]));
        }
        Event::fire(new AdminLogger('update',"编辑了后台角色【".$role->name."】"));
        $res['status'] = true;
        return response()->json($res);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $role = Role::find((int)$id);
        Event::fire(new AdminLogger('delete',"删除了后台角色【".$role->name."】"));
        $role->delete();
        $res['status'] = true;
        return response()->json($res);
    }

    /**
     * 获取权限列表
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function getAcl(Request $request)
    {
        $id = $request->get('id');
        $data = [];
        $role = Role::find($id);

        $data['tree'] = $role->getTreeData();
        return response()->json($data);
        
    }

    public function setAcl(Request $request)
    {
        $id = $request->get('id');
        $role = Role::find((int) $id);
        $role->permissions()->sync($request->get('permission',[]));
        $res['status'] = true;
        return response()->json($res);



    }

}

<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Http\Requests\RoleCreateRequest;
use App\Http\Requests\RoleUpdateRequest;

class RoleContoller extends Controller
{
    protected $fileds = [
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
            $start = $request->get('start');
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
            return response()->json();
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
    public function edit($id)
    {
        //
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

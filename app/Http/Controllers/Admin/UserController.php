<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Role;
use App\Models\Admin\Admin as User;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    protected  $fields = [
        'username' => '',
        'name'     => '',
        'phone'    => '',
        'email'    => '',
        'picture'  => '',
        'roles'    => [],
    ];

    protected $pageSize = 15;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        if($request->ajax()) {
            $data = [];
            $start = $request->get('start');
            $sort = $request->get('sort');
            $keyword = $request->get('keyword');
            $perPage = $request->get('perPage') ?: $this->page;
            $query = User::query();
            if($keyword) {
                $query->where('username','LIKE','%'. $keyword .'%')
                ->orWhere('name','LIKE','%'.$keyword.'%');
            }
            if($sort[0]) {
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
    public function store(Requests\AdminCreateRequest $request)
    {
        $res = [];
        $user = new User();

        foreach(array_keys($this->fields) as $field) {
            $user->$field = $request->get($field);
        }
        $user->password = bcrypt($request->get('password'));
        unset($user->roles);
        $user->picture = upBase64Img($request->get('picture'),'admin/avatar');
        $user->save();
        $roles = $request->get('roles');
        if(!empty($roles)) {
            $user->giveRoleTo($roles);
        }
        $res['status'] = true;
        return response()->json($res);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $id = $request->get('\id');
        $user = User::find($id);
        $roles = [];
        $roleStr = [];

        if($user->roles) {
            foreach ($user->roles as $v) {
                $roles[] = ['label' => $v->name, 'value' => $v->id];
                $roleStr = $v->name;
            }
        }
        $data = $user->toArray();
        $data['roles'] = $roles;
        $data['rolesStr'] = $id == 1 ? '管理员' : (!empty($roleStr) ? implode(',', $roleStr) : '未分配');
        return response()->json($data);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $id = $request->get('id');
        $user = User::find($id);
        $roles = [];
        $roleStr = [];
        if ($user->roles) {
            foreach ($user->roles as $v) {
                $roles[] = ['label' => $v->name, 'value' => $v->id];
                $roleStr[] = $v->name;
            }

        }
        $data = $user->toArray();
        $data['roles'] = $roles;
        $data['rolesStr'] = $id == 1 ? '管理员' : (!empty($roleStr) ? implode(',', $roleStr) : '未分配');
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\AdminUpdateRequest $request, $id)
    {
        $user = User::find($id);
       // dd($user->toArray());
        $old_picture = $user->picture;// http://www.laravueblog.com/files/admin/avatar/201706220904431498122283.9196740.jpeg
        //$old_picture = 'admin/avatar/201706220904431498122283.9196740.jpeg';
        dd(Storage::disk('local')->getUrl($old_picture));
        echo $old_picture;exit;
        foreach (array_keys($this->fields) as $field) {
            $user->$field = $request->get($field);
        }
        unset($user->roles);
        unset($user->picture);
        if($request->get('password') != '') {
            $user->password = bcrypt($request->get('password'));
        }

        if(checkBase64Image($request->get('picture'))) {
            // 删除就图片
           
             $user->picture = upBase64Img($request->get('picture'),'admin/avatar');
        } 
       
        dd($user->picture);
        $user->save();
        $roles = $request->get('roles');
        if(isset($roles)) {
            $user->giveRoleTo($roles);
        }
        $res['satus'] = true;
        return response()->json($res);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy(Role $role)
    {
        //
    }
}

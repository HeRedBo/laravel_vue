<?php

namespace App\Http\Controllers\Admin;

use Event;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Events\AdminLogger;
use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryCreateRequest;
use App\Http\Requests\CategoryUpdateRequest;


class CategoryController extends Controller
{
    protected $fields = [
        'name' => '',
        'parent_id' => 0,
        'order_num' => 0,
    ];
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [];
        $category = new Category();
        $data['tree'] = $category->getTreeData();
        $data['select'] = $category->getSelectList();
        return response()->json($data);
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
    public function store(CategoryCreateRequest $request)
    {
        $category = new Category();
        foreach (array_keys($this->fields) as $key => $field) 
        {
            $category->$field = $request->get($field, $this->fields[$field]);
        }
        $category->save();
        Event::fire(new AdminLogger('create',"添加了后台分类【".$category->name."】"));
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
        $category = Category::find($id);
        $data = $category->toArray();
        if($category->parent_id != 0) 
        {
            $parent = Category::find($category->parent_id);
            $data['parent'] = ['label'  => $parent->name, 'value' => $category->parent_id];
        } else {
            $data['parent']= ['label'=>'根','value'=>0];
        }
        unset($category);
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryUpdateRequest $request, $id)
    {
        
        $category = Category::find($id);
        $fileds = array_keys($this->fields);
        foreach ($fileds as $field) {
            $category->$field = $request->get($field, $this->fields[$field]) ?: $this->fields[$field];
        }
        $category->save();
        Event::fire(new AdminLogger('update',"编辑了分类【".$category->name."】"));
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
         $child = Category::where('parent_id', $id) -> first();
        if($child) 
        {
            $res['status'] = false;
            $res['msg'] = '请先将该分类的子分类删除后再做删除操作!';
        }

        $category = Category::find($id);
        $category->delete();
        Event::fire(new AdminLogger('update',"删除了分类【".$category->name."】"));
        $res['status'] = true;
        return response()->json($res);
    }
}

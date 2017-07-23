<?php

namespace App\Http\Controllers\Admin;

use App\Events\AdminLogger;
use App\Models\Goods;
use App\Models\GoodsThird;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Storage;

class GoodsController extends Controller
{
    protected $fields = [
        'name' => '',
        'price' => '',
        'tag' => '',
        'picture' => '',

    ];
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->ajax())
        {
            $data = [];
            $sort    = $request->get('sort');
            $keyword = $request->get('keyword');
            $perPage = $request->get('perPage') ?: $this->pageSize;
            $query   = Goods::query();
            if($keyword)
            {
                $query->where('title',  'LIKE', '%'.$keyword.'%');
            }

            if($sort[0])
            {
                $query->orderBy($sort[0],$sort[1]);
            }
            $data = $query->paginate($perPage)->toArray();
            return response()->json($data);
        }
        //
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
    public function store(Request $request)
    {
        $goods = new Goods();
        foreach (array_keys($this->fields) as $key => $field)
        {
            $goods->$field = $request->get($field, $this->fields[$field]);
        }
        $goods->picture = upBase64Img($request->get('picture','goods'));
        $goods->save();

        Event::fire(new AdminLogger('create',"添加了商品【".$goods->name."】"));
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request)
    {
        $id = $request->get('id');
        $data = Goods::find($id)->toArray();
        return response()->json($data);
    }



    /**
     * Update the specified resource in storage.
     *
     * @param Requests\GoodsUpdateRequest $request
     * @param $id
     *  @return \Illuminate\Http\Response
     */
    public function update(Requests\GoodsUpdateRequest $request, $id)
    {
        $goods = Goods::find($id);
        $old_picture = $goods->picture;
        foreach (array_keys($this->fields) as $key => $field)
        {
            $goods->$field = $request->get($field, $this->fields[$field]);
        }
        unset($goods->picture);
        if(checkBase64Image($request->get('picture')))
        {
            $goods->picture = upBase64Img($request->get('picture','goods'));
            // 删除旧图片
            if($old_picture)
                Storage::disk('local')->delete($old_picture);
        }  else {
            $goods->picture = $old_picture;
        }
        $goods->save();
        Event::fire(new AdminLogger('update',"编辑了商品【".$goods->name."】"));
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
        $goods = Goods::find($id);
        // 数据删除之前需要删除文章图片
        $old_picture = $goods->picture;
        if($old_picture)
            Storage::disk('local')->delete($old_picture);
        $goods->delete();
        GoodsThird::query()->where('goods_id',$id)->delete();
        Event::fire(new AdminLogger('delete', "删除了商品[{$goods->name}]"));
        $res['status'] = true;
        return response()->json($res);
    }

    public function  tag(Request $request)
    {
        if($request->ajax())
        {
            $id = $request->get('id');
            $keyword = $request->get('keyword');
            $sort = $request->get('sort');
            $perPage = $request->get('perPage') ?: $this->pageSize;
            $query = GoodsThird::query()->where('goods_id',$id);
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

    public  function  tagInfo(Request $request)
    {
        $id = $request->get('id');
        $goods = GoodsThird::find($id);
        $data = $goods->toArray();
        return response()->json($data);
    }

    public function  tagRun(Request $request)
    {
        $id = $request->get('id');
        GoodsThird::query()->where('goods_id',$id)->toArray();
        $tag = $request->get('tag');
        //$this->dispatch(n)
    }

}

<?php

namespace App\Http\Controllers\Admin;

use Event;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Events\AdminLogger;
use App\Models\Category;
use App\Models\Articles;
use App\Http\Requests\ArticlesCreateRequest;
use App\Http\Requests\ArticlesUpdateRequest;
use Illuminate\Support\Facades\Storage;

class ArticlesController extends Controller
{

    protected $fields = [
        'title' =>'',
        'category_id' => 0,
        'picture' => '',
        'tags' => '', 
        'info' => '',
        'content' => '',
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
            $data = [];
            $sort    = $request->get('sort');
            $keyword = $request->get('keyword');
            $perPage = $request->get('perPage') ?: $this->pageSize;
            $query   = Articles::query();
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
    public function store(ArticlesCreateRequest $request)
    {
        $articles = new Articles();
        foreach (array_keys($this->fields) as $key => $field) 
        {
            $articles->$field = $request->get($field, $this->fields[$field]);
        }
        $articles->picture =upBase64Img($request->get('picture','images'));
        $articles->save();
        Event::fire(new AdminLogger('create',"添加了后台文章【".$articles->title."】"));
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
    public function edit(Request $request)
    {
        $id      = $request->get('id');
        $article = Articles::find($id);
        $data    = $article->toArray();

        if($article->category)
        {
            $data['category'] = ['label' => $article->category->name, 'value' => $article->category->id];
        }
        return response()->json($data);
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
        $articles = Articles::find($id);
        $old_picture = $articles->picture;
        foreach (array_keys($this->fields) as $key => $field) 
        {
            $articles->$field = $request->get($field, $this->fields[$field]);
        }
        unset($articles->picture);
        if(checkBase64Image($request->get('picture'))) 
        {
             $articles->picture = upBase64Img($request->get('picture','images'));
             // 删除旧图片
             if($old_picture)
                Storage::disk('local')->delete($old_picture);
        }  else {
             $articles->picture = $old_picture;
        }
        $articles->save();
        Event::fire(new AdminLogger('update',"编辑了后台文章【".$articles->title."】"));
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
        $articles = Articles::find($id);
        // 数据删除之前需要删除文章图片
        $old_picture = $articles->picture;
        if($old_picture)
            Storage::disk('local')->delete($old_picture);
        $articles->delete();
        Event::fire(new AdminLogger('delete', "删除了文章[{$articles->title}]"));
        $res['status'] = true;
        return response()->json($res);
    }
    
    /**
     * 获取文章的分类列表
     * @return [type] [description]
     */
    public function category()
    {
        $data = [];
        $category = new Category();
        $data = $category->getSelectList();
        return response()->json($data);
    }

    /**
     * 是否推荐
     * @param  Request $request [description]
     * @return boolean          [description]
     */
    public function isHot(Request  $request)
    {
        $id = $request->get('id');
        $articles = Articles::find($id);
        $articles->is_hot == 1 ? $articles->is_hot = 0 : $articles->is_hot = 1;
        $articles->save();
        $res['status'] = true;
        return response()->json($res);
     }
}

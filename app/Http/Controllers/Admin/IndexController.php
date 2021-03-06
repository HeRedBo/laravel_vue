<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Permission;
use App\Models\Admin\Message;
use App\Models\Admin\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;


class IndexController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //
    public function index()
    {
        $uid = Auth::guard('admin')->user()->id;
        $user = Admin::find($uid);
        $permissions = Permission::all();
        $permissionsArr = [];
        foreach ($permissions as $k => $val)
        {

            if($user->hasPermission($val->name)) {
                array_push($permissionsArr, $val->name);
            }
        }
        $msgNum = Message::query()->where('to_uid',$uid)->count();
        return view('admin.index',[
            'permissions' => json_encode($permissionsArr),
            'msgNum'      => $msgNum
        ]);
    }

    public function menu()
    {
        $adminMenuData = Request::get('adminMenuData');
        return response()->json($adminMenuData);
    }

    /**
     * 图片上传函数
     * @return string 返回图片的url 链接
     */
    public function upImg()
    {
        $file = Request::file('wangEditorH5File');
        $allowed_extensions = ['png','jpg','gif','jpeg'];

        if($file->getClientOriginalExtension()
            && !in_array($file->getClientOriginalExtension(), $allowed_extensions))
        {
            return  'error|You may only upload png ,gif, jpg, or jpeg.';
        }
        $destinationPath = "files/images/";
        $extension =$file->getClientOriginalExtension();
        $fileName = date('ymdHis') . microtime(true). rand(10, 99) . '.' .$extension;
        $file->move($destinationPath, $fileName);
        return asset($destinationPath. $fileName);
    }

    /**
     * 获取用户最新的十条记录信息
     * @return array
     */
    public function msg()
    {
        $uid = auth('admin')->user()->id;
        $list = Message::query()->with('users')
                        ->where('to_uid',$uid)
                        ->where('is_read',0)
                        ->orderBy('created_at', 'desc')
                        ->take(10)
                        ->get();
        return response()->json($list);
    }

    /**
     * 请求权限校验
     *
     * @return string
     */
    public function checkAcl()
    {
        $res = [];
        $check = true;
        $path = Request::get('path');
        $routeName = implode('.', explode('/',$path));
        $permission = Permission::where('name',$routeName)->first();
        if($permission)
        {
            $check  = \Gate::check($routeName);
        }
        $res['status']= $check;
        return $res;
    }


    public function  logTest()
    {
        $content = [
            'age' => 23,
            'name' => 'hehongbo is a good boy',
            'sex' => 1,
            'hobby' => 'tkd',
            'work' => 'php'
        ];
        $content = '【日志记录内容】'. var_export($content,true);
        logResult($content,'error');
    }



}

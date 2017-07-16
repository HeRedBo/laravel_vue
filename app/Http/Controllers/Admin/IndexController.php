<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Permission;
use App\Models\Admin\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
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
        
        return view('admin.index',['permissions' => json_encode($permissionsArr)]);
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
        $file = $request->file("wangEditorH5File");
        $allowed_extenssions = ['png','jpg','gif','jpeg'];
        if($file->getClientOriginalExtension() 
            && !in_array($file->getClientOriginalExtension(), $allowed_extenssions))
        {
            return  'error|You may only upload png ,gif, jpg, or jpeg.';
        }
        $destinationPath = "files/images/";
        $extension =$file->getClientOriginalExtension();
        $fileName = date('ymdHis') . microtime(true). rand(10, 99) . '.' .$extension;
        $file->move($destinationPath, $fileName);
        return asset($destinationPath. $fileName);
    }
}

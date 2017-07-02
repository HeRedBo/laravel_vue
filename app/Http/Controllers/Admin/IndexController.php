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
    //
    public function index()
    {
        $uid = Auth::guard('admin')->user()->id;
        $user = Admin::find($uid);
        
        return view('admin.index');
    }

    public function menu()
    {
        $adminMenuData = Request::get('adminMenuData');
        return response()->json($adminMenuData);
    }
}

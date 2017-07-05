<?php
Route::get('/login', 'LoginController@showLoginForm')->name('login');
Route::post('/login', 'LoginController@login');
Route::get('/logout', 'LoginController@logout');

// 后台权限路由组
Route::group(['middleware' => ['auth:admin','menu']], function() {
    Route::get('/', 'IndexController@index');
    Route::get('/menu', ['as' => 'admin.menu', 'uses' => 'IndexController@menu']);
    Route::get('user/info', ['uses' => 'UserController@info']);
});


Route::group(['middleware' => ['auth:admin','menu','authAdmin']], function()
{
    if (!Request::ajax()) {
        Route::get('{path?}', ['uses' => 'IndexController@index'])->where('path', '[\/\w\.-]*');
    }
    
    Route::get('permission/index', ['as' => 'admin.permission.index', 'uses' => 'PermissionController@index']); //查询
    Route::resource('permission', 'PermissionController',['names' => ['update' => 'admin.permission.edit', 'store' => 'admin.permission.create']]);
    
    
    Route::get('role/index', ['as' => 'admin.role.index', 'uses' => 'RoleController@index']); //查询
    Route::post('role/edit', ['as' => 'admin.role.edit', 'uses' => 'RoleController@edit']);
    Route::post('role/setAcl', ['as' => 'admin.role.acl', 'uses' => 'RoleController@setAcl']);
    Route::post('role/getAcl', ['as' => 'admin.role.acl', 'uses' => 'RoleController@getAcl']);
    Route::resource('role', 'RoleController');
    
    Route::get('user/index', ['as' => 'admin.user.index', 'uses' => 'UserController@index']);
    Route::get('user/logger', ['as' => 'admin.user.logger','uses' => 'UserController@logger']);
    Route::get('user/role', ['as' => 'admin.user.index', 'uses' => 'UserController@role']);
    Route::post('user/show', ['as' => 'admin.user.show', 'uses' => 'UserController@show']);
    
    Route::resource('user', 'UserController',['names' => ['store' => 'admin.user.create']]);

    Route::get('category/index', ['as' => 'admin.category.index', 'uses' => 'CategoryController@index']);
    Route::resource('user', 'CategoryController',['names' => ['update' => 'admin.category.edit','store' => 'admin.category.create']]);
});



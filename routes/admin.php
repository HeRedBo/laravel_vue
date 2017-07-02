<?php
Route::get('/login', 'LoginController@showLoginForm');
Route::post('login', 'LoginController@login');
Route::get('/', 'IndexController@index');



if (!Request::ajax()) {
    Route::get('{path?}', ['uses' => 'IndexController@index'])->where('path', '[\/\w\.-]*');
}

// 角色管理
Route::group(['middleware' => ['menu']], function() {
    Route::get('/menu', ['as' => 'admin.menu', 'uses' => 'IndexController@menu']);
});


Route::get('permission/index', ['as' => 'admin.permission.index', 'uses' => 'PermissionController@index']); //查询
Route::resource('permission', 'PermissionController',['names' => ['update' => 'admin.permission.edit', 'store' => 'admin.permission.create']]);


Route::get('role/index', ['as' => 'admin.role.index', 'uses' => 'RoleController@index']); //查询
Route::post('role/edit', ['as' => 'admin.role.edit', 'uses' => 'RoleController@edit']);
Route::post('role/setAcl', ['as' => 'admin.role.acl', 'uses' => 'RoleController@setAcl']);
Route::post('role/getAcl', ['as' => 'admin.role.acl', 'uses' => 'RoleController@getAcl']);
Route::resource('role', 'RoleController');

Route::get('user/index', ['as' => 'admin.user.index', 'uses' => 'UserController@index']);
Route::post('user/show', ['as' => 'admin.user.show', 'uses' => 'UserController@show']);
Route::resource('user', 'UserController',['names' => ['store' => 'admin.user.create']]);


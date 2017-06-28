<?php
Route::get('/login', 'LoginController@showLoginForm');
Route::post('login', 'LoginController@login');
Route::get('/', 'IndexController@index');

// 角色管理

 if (!Request::ajax()) {
        Route::get('{path?}', ['uses' => 'IndexController@index'])->where('path', '[\/\w\.-]*');
}

Route::get('permission/index', ['as' => 'admin.permission.index', 'uses' => 'PermissionController@index']); //查询
Route::resource('permission', 'PermissionController',['names' => ['update' => 'admin.permission.edit', 'store' => 'admin.permission.create']]);


Route::get('role/index', ['as' => 'admin.role.index', 'uses' => 'RoleController@index']); //查询
Route::post('role/edit', ['as' => 'admin.role.edit', 'uses' => 'RoleController@edit']);
Route::resource('role', 'RoleController');


Route::post('user/index', ['as' => 'admin.user.index', 'uses' => 'UserController@index']);
Route::post('user/show', ['as' => 'admin.user.show', 'uses' => 'UserController@show']);
Route::resource('user', 'UserController',['names' => ['store' => 'admin.user.create']]);


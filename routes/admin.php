<?php
Route::get('/login', 'LoginController@showLoginForm');
Route::post('login', 'LoginController@login');
Route::get('/', 'IndexController@index');

// 角色管理

 if (!Request::ajax()) {
        Route::get('{path?}', ['uses' => 'IndexController@index'])->where('path', '[\/\w\.-]*');
}



Route::resource('user', 'UserController',['names' => ['store' => 'admin.user.create','update' => 'admin.user.edit']]);


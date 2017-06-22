<?php
Route::get('/login', 'LoginController@showLoginForm');
Route::post('login', 'LoginController@login');
Route::get('/', 'IndexController@index');

// 角色管理

 if (!Request::ajax()) {
        Route::get('{path?}', ['uses' => 'IndexController@index'])->where('path', '[\/\w\.-]*');
}


Route::post('user/index', ['as' => 'admin.user.index', 'uses' => 'UserController@index']);
Route::post('user/show', ['as' => 'admin.user.show', 'uses' => 'UserController@show']);
Route::resource('user', 'UserController',['names' => ['store' => 'admin.user.create']]);


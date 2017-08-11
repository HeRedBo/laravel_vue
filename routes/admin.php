<?php
Route::get('/login', 'LoginController@showLoginForm')->name('login');
Route::post('/login', 'LoginController@login');
Route::get('/logout', 'LoginController@logout');
Route::get('goods/test', ['as' => 'admin.goods.test', 'uses' => 'GoodsController@taoboaTest']);
// 后台权限路由组
Route::group(['middleware' => ['auth:admin','menu']], function() {
    Route::get('/', 'IndexController@index');
    Route::get('/menu', ['as' => 'admin.menu', 'uses' => 'IndexController@menu']);
    Route::get('/msg', ['as' => 'admin.menu', 'uses' => 'IndexController@msg']);
    Route::get('/upImg', ['as' => 'admin.upImg', 'uses' => 'IndexController@upImg']);
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
    Route::post('user/send', ['as' => 'admin.user.send', 'uses' => 'UserController@send']);
    Route::resource('user', 'UserController',['names' => ['store' => 'admin.user.create']]);


    Route::get('category/index', ['as' => 'admin.category.index', 'uses' => 'CategoryController@index']);
    Route::resource('category', 'CategoryController',['names' => ['update' => 'admin.category.edit','store' => 'admin.category.create']]);

    // 分类管理路由
    Route::post('articles/isHot',['as' => 'admin.articles.isHot', 'uses' => 'ArticlesController@isHot']);
    Route::get('articles/category', ['as' => 'admin.articles.create', 'uses' => 'ArticlesController@category']);
    Route::post('articles/edit ', ['as' => 'admin.articles.edit', 'uses' => 'ArticlesController@edit']);
    Route::get('articles/index', ['as' => 'admin.articles.index', 'uses' => 'ArticlesController@index']); //查询
    Route::resource('articles', 'ArticlesController',['names' => ['update' => 'admin.article.edit','store' => 'admin.article.create']]);

    // 商品内容管理路由
    Route::get('goods/index', ['as' => 'admin.goods.index', 'uses' => 'GoodsController@index']);
    Route::get('goods/tag', ['as' => 'admin.goods.tag', 'uses' => 'GoodsController@tag']);
    Route::post('goods/tagInfo', ['as' => 'admin.goods.taginfo', 'uses' => 'GoodsController@taginfo']);
    Route::post('goods/tagRun', ['as' => 'admin.goods.tagRun', 'uses' => 'GoodsController@tagRun']);
    Route::get('goods/test', ['as' => 'admin.goods.test', 'uses' => 'GoodsController@taoboaTest']);
    Route::post('goods/edit ', ['as' => 'admin.goods.edit', 'uses' => 'GoodsController@edit']);
    Route::resource('goods', 'GoodsController', ['names' => ['update' => 'admin.goods.edit', 'store' => 'admin.goods.create']]);

});

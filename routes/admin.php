<?php
Route::get('/login', 'LoginController@showLoginForm');
Route::post('login', 'LoginController@login');
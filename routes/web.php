<?php

use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'App\Http\Controllers\Front\HomeController@index')->name('home');

Route::get('/trace/{trace_code}', 'App\Http\Controllers\Front\HomeController@trace')->name('trace');
Route::get('/cooperate', 'App\Http\Controllers\Front\HomeController@cooperate')->name('cooperate');
Route::post('/search', 'App\Http\Controllers\Front\HomeController@search')->name('search');
Route::get('/download-qr/{trace_code}', 'App\Http\Controllers\Front\HomeController@downloadQR')->name('download.qr');


// Route for posts
Route::get('/posts', 'App\Http\Controllers\Front\PostController@index')->name('posts.index');
Route::get('/posts/{slug}', 'App\Http\Controllers\Front\PostController@show')->name('posts.show');



// API
Route::get('api/stages', 'App\Http\Controllers\Api\StageController@index')
    ->name('api.stages.index');
Route::get('api/product-histories/{trace_code}', 'App\Http\Controllers\Api\ProductHistoryController@index')
    ->name('api.product-histories');

Route::group([
    'prefix' => 'admin',
    'middleware' => ['web', 'log.admin.activity'], 
], function () {
    Voyager::routes();

    // Route tĩnh đặt trước
    Route::post('connect-wallet', 'App\Http\Controllers\Admin\Blockchain\BlockchainController@connectWallet')
        ->name('blockchain.connect-wallet');

    Route::get('products/{id}/add-stages', 'App\Http\Controllers\Admin\ProductController@addStages')
        ->name('products.add-stages');
    Route::post('products/{id}/add-stages', 'App\Http\Controllers\Admin\ProductController@postAddStages')
        ->name('products.add-stages');
});

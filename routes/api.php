<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('productos', \App\Http\Controllers\ProductoController::class);
Route::get('search', \App\Http\Controllers\ProductoController::class.'@search');

Route::get('search-mobile', \App\Http\Controllers\ProductoElasticController::class.'@searchMobile');

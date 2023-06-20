<?php

use App\Http\Controllers\AboutController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\ChefsController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\ReservationController;
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [HomeController::class, 'index']);
Route::post('/', [ReservationController::class, 'store'])->name('reservation');
Route::post('/contact', [ContactController::class, 'send'])->name('contact');
Route::get('/contact', [ContactController::class, 'index']);
Route::get('/about', [AboutController::class, 'index']);
Route::get('/chefs', [ChefsController::class, 'index']);
Route::get('/menus', [MenuController::class, 'index']);
Route::get('/blog', [PostsController::class, 'index']);
Route::get('/search', [SearchController::class, 'search'])->name('search');
Route::get('/single-blog', function () {
    return view('static-single');
});

Route::get('/single-blog/{id}', [PostsController::class, 'show']);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::get('/reservations', [ReservationController::class, 'index']);
    Route::delete('/reservations/delete/{id}', [ReservationController::class, 'destroy']);
    Route::get('/reservations/show/{id}', [ReservationController::class, 'show']);
});

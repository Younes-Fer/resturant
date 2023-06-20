<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Models\Category;
use TCG\Voyager\Models\Post;

class MenuController extends Controller
{
    public function index()
    {
        $cat_id = Category::select('id')->where('slug', 'menu')->first();
        $posts_menus = DB::table('posts')
            ->select('*')
            ->join('categories', 'posts.category_id', '=', 'categories.id')
            ->where('posts.category_id', $cat_id->id)
            ->take(6)
            ->get();
        return view('food_menu', compact('posts_menus'));
    }
}

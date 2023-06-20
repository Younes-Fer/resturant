<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\User;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Models\Post;
use TCG\Voyager\Models\Category;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        /**
         * 
         * Display Team
         */

        $teams = User::whereHas(
            'roles',
            function ($query) {
                $query->where('name', 'team');
            }
        )->get();

        /**
         * 
         * Display reservation
         * 
         */

        $tables = DB::table('rtables')
            ->leftJoin('reservations',  'rtables.id', '=', 'reservations.num_table')
            ->where('reservations.num_table', null)
            ->select('rtables.*')
            ->get();

        /**
         * 
         * get last posts
         * 
         */

        $last_posts = Post::take(3)->orderBy('id', 'desc')->get();

        /**
         * 
         * get popular posts
         * 
         */
        $popular_posts = Post::skip(3)->take(3)->orderBy('id', 'desc')->get();


        /**
         * 
         * Get content page about 
         */
        $post_about = Post::where('id', 16)->first();


        /**
         * 
         *  Select posts with category menu
         * 
         */

        $cat_id = Category::select('id')->where('slug', 'menu')->first();
        $posts_menus = DB::table('posts')
            ->select('*')
            ->join('categories', 'posts.category_id', '=', 'categories.id')
            ->where('posts.category_id', $cat_id->id)
            ->take(6)
            ->get();

        return view('index', compact('teams', 'tables', 'last_posts', 'popular_posts', 'post_about', 'posts_menus'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

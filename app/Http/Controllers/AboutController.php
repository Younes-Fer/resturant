<?php

namespace App\Http\Controllers;

use TCG\Voyager\Models\Post;
use TCG\Voyager\Models\User;

class AboutController extends Controller
{
    public function index()
    {
        $about = Post::where('id', 16)->first();
        $teams = User::whereHas(
            'roles',
            function ($query) {
                $query->where('name', 'team');
            }
        )->get();
        return view('about', compact('about', 'teams'));
    }
}

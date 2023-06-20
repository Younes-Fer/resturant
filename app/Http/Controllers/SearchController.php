<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;

class SearchController extends Controller


{
    public function search()
    {
        $search = request('search');
        if (!empty($search)) {
            $posts = Post::where('title',  'like', '%' . $search . '%')->paginate(6);
            return view('search', compact('posts'));
        }
    }
}

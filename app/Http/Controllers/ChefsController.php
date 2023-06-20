<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\User;

class ChefsController extends Controller
{
    public function index()
    {
        $teams = User::whereHas(
            'roles',
            function ($query) {
                $query->where('name', 'team');
            }
        )->get();
        return view('chefs', compact('teams'));
    }
}

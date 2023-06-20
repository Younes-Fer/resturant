<?php

namespace TCG\Voyager\Http\Controllers;

use TCG\Voyager\Facades\Voyager;

class VoyagerReservationController extends Controller
{

    public function index()
    {
        // Check permission
        // $this->authorize('browse_media');

        // return Voyager::view('voyager::reservation.index');
        return Voyager::view('voyager::reservation.index');
    }
}

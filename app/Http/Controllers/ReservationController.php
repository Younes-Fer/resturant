<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Validator;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reservations = Reservation::get();
        return view('admin.reservation.index', compact('reservations'));
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
        try {
            //code...

            $validate = Validator::make(
                $request->all(),
                [
                    'numtable' => ['required', 'integer'],
                    'fullname' => ['required', 'string', 'min:6'],
                    'email' => ['required'],
                    'persons' => ['required', 'integer'],
                    'phone' => ['required', 'numeric', 'digits:10'],
                    'date' => ['required', 'date'],
                    'time' => ['required', 'string'],
                    'note' => 'nullable|string'
                ],
                [
                    'Num table not valid !!!',
                    // 'fullname' => 'Fullname not valid !!!',
                    'Fullname not valid !!!',
                    // 'email' => 'Email not valid !!!',
                    'Email not valid !!!',
                    //  'persons' => 'Personns not valid !!!',
                    'Personns number not valid !!!',
                    // 'phone' => 'Phone not valid !!!',
                    'Phone not valid !!!',
                    //'date' => 'Date not valid !!!',
                    'date' => 'Date not valid !!!',
                    //'time' => 'Time not valid !!!',
                    'Time not valid !!!',
                    // 'note' => 'Note not valid !!!'
                    'Note not valid !!!'

                ]
            );
            if ($validate->fails()) {
                return  back()->with('error', $validate->errors());
            }
            $reserve = Reservation::create(
                [
                    'num_table' => $request->numtable,
                    'fullname' => $request->fullname,
                    'email' => $request->email,
                    'personnes' => $request->persons,
                    'num_phone' => $request->phone,
                    'date' => Carbon::createFromFormat('m/d/Y', $request->date)->format('Y-m-d'),
                    'time' => $request->time,
                    'note' => empty($request->note) ? '' : $request->note
                ]
            );
            if ($reserve) {
                return  back()->with('success', 'The table has been reserved');
            }
        } catch (\Throwable $th) {
            return  back()->with('error', $th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $rsv_item = Reservation::find($id);
        //dd($rsv_item);
        return response()->json($rsv_item);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Reservation $reservation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Reservation $reservation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $rsv_id = Reservation::find($id);

        $rsv_id->delete();
        $data = [
            'status' => true,
            'msg' => 'Resercation has been delete'
        ];
        return response()->json($data);
    }
}

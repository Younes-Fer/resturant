<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{
    public function index()
    {
        return view('contact');
    }
    public function send(Request $req)
    {
        try {

            $valid = Validator::make($req->all(), [
                'message' => ['required', 'string'],
                'name' => ['required', 'string'],
                'email' => ['required', 'string'],
                'subject' => ['required', 'string']
            ], [
                'message' => 'Message not valid',
                'name' =>  'Name not valid',
                'email' => 'Email not valid',
                'subject' => 'Subject not valid'
            ]);
            if ($valid->fails()) {
                //return  redirect()->back()->with('error', $valid->errors());
                return  redirect()->back()->withErrors($valid)
                    ->withInput();;
                $valid->errors();
            }
            $data = [
                'message' => $req->message,
                'name' => $req->name,
                'email' => $req->email,
                'subject' => $req->subject
            ];
            Mail::to('devmailyou@gmail.com')->send(new ContactMail($data));
            return redirect()->back()->with('success', 'email send with successfully');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', $th->getMessage());
        }
    }
}

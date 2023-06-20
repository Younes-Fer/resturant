<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    use HasFactory;

    protected $fillable = [
        'num_table',
        'fullname',
        'email',
        'personnes',
        'num_phone',
        'date',
        'time',
        'note'
    ];
}

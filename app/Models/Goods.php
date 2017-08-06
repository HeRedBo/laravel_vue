<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Goods extends Model
{
    //
    public function getPictureAttribute($pic)
    {

        if(\Request::method() == 'PUT' || \Request::method() == "DELETE")
        {
            return $pic;
        }
        if ($pic) 
        {
            return Storage::disk('local')->url($pic);
        } else 
        {
            return Storage::disk('local')->url('admin/noavatar.png');
        }
        
    }
}

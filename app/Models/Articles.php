<?php

namespace App\Models;

use Carbon\Carbon;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use Illuminate\Http\Request;

class Articles extends Model
{
    protected $table = 'articles';
    //protected $appends = ['url'];

    public function category()
    {
    	return $this->belongsTo(Category::class, 'category_id','id');
    }

    public function getPictureAttribute($pic)
    {
      
        if(\Request::method() == 'PUT' || (\Request::method() == 'DELETE'))
        {
            return $pic;
        }
        if ($pic) 
        {
            return Storage::disk('local')->url($pic);
        } 
        else 
        {
            return Storage::disk('local')->url('admin/noavatar.png');
        }
    	
    }

    public function getCreateAtAttribute($date)
    {
        return Carbon::parse($date)->diffForHumans();
    }


    // public function getUrlAttribute()
    // {
    //     return URL::route('articles.detail',['id' => $this->id]);
    // }
}

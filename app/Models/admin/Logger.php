<?php
namespace App\Models\admin;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Logger extends Model
{
    //
    protected $table = 'admin_logger';
    public $timestamps = false;
    
    public function users()
    {
        return $this->belongsTo(Admin::class,'user_id','id')
                    ->select(['id','username']);
    }
    
    public function getCreatedAtAttribute($date)
    {
        return Carbon::parse(date('Y-m-d H:i:s',$date))->diffForHumans();
    }
    
    
    
    
}
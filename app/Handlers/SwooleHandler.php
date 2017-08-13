<?php

namespace App\Handlers;

use Illuminate\Support\Facades\Redis;
use App\Models\Admin\Message;

class SwooleHandler 
{
     public  function onOpen($ws, $request)
     {
         $uid = $request->get['uid'];
         echo "client-{$request->fd} is opened\n";
         Redis::hSet('ADMIN_USERS', $uid, $request->fd);
         var_dump(Redis::hGet('ADMIN_USERS',9));

     }

     /**
      * 消息推送
      * @param  [type] $ws    [description]
      * @param  [type] $frame [description]
      * @return [type]        [description]
      */
     public function onMessage($ws, $frame)
     {
        $uid = $frame->data;
        $fd = Redis::hGet('ADMIN_USERS',$uid);
        echo "client-{$fd} is send\n";
        $num = Message::query()->where('to_uid',$uid)->count();
        $ws->push($fd,$num);
     }

     public function onClose($ws, $fd)
     {
        echo "client-{$fd} is closed\n";
        $all = Redis::hGetAll('ADMIN_USERS');
        foreach ($all as $key => $val) {
            if($fd== Redis::hGet('ADMIN_USERS',$k)) {
                Redis::hDel('ADMIN_USERS',$k);
                echo "del {$key}";
            }
        }
     }


}
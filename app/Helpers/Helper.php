<?php
/**
 * 公共函数
 */


function upBase64Img($base64_imgage_content, $path = 'images')
{
    if (preg_match('/^(data:\s*image\/(\w+);base64,)/',  $base64_imgage_content, $result)) {
        $type = $result[2];
        $name = date('YmdHis').microtime(true).rand(100,999). '.'.  $type;
        $new_file = $path .'/' .$name;
        $res = \Illuminate\Support\Facades\Storage::disk('local')->put($new_file,base64_decode(str_replace($result, '', $base64_imgage_content)));
        return $new_file; 
    } 
}
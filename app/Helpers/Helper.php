<?php
/**
 * 公共函数
 */


function upBase64Img($base64_image_content, $path = 'images')
{
    $new_file = '';
    if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)) {
        $type = $result[2];
        $name = date('YmdHis') . microtime(true) . rand(100, 999) . '.' . $type;
        $new_file = $path . '/' . $name;
        $res = \Illuminate\Support\Facades\Storage::disk('files')->put($new_file, base64_decode(str_replace($result[1], '', $base64_image_content)));
        
    }
    return $new_file;
}
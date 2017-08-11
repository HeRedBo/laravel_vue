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
        $res = \Illuminate\Support\Facades\Storage::disk('local')->put($new_file, base64_decode(str_replace($result[1], '', $base64_image_content)));

    }
    return $new_file;
}

/**
 * 判断字符串是否是base64编
 * @param string $image_content
 * @return bool 返回数据校验结果
 */
function checkBase64Image($image_content)
{
	if(preg_match('/^(data:\s*image\/(\w+);base64,)/', $image_content))
	{
		return true;
	}
	return false;
}

function object2array(&$object)
{
     $object =  json_decode( json_encode( $object),true);
     return  $object;
}


function adminMsg($toUid, $msg, $title = '')
{
    $res = \Illuminate\Support\Facades\Event::fire(new \App\Events\AdminMessage($toUid, $msg,$title));
}

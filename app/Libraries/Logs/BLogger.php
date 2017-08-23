<?php
namespace App\Libraries\Logs;

use Monolog\Handler\StreamHandler;
use Monolog\Logger;
use Illuminate\Log\Writer;

class BLogger
{
    // 所有的LOG都要求在这里注册
    const LOG_INFO = 'laravel';
    const LOG_ERROR = 'error';
    const LOG_QUERY_REAL_TIME = 'sql_query_log';
    private $levels = [
    	'emergency', 'alert', 'critical',
        'error', 'warning', 'notice',
        'info', 'debug'
    ];

    private static $loggers = array();

    // 获取一个实例
    public static function getLogger($type = self::LOG_INFO, $day = 30,$level = 'debug')
    {
        if (empty(self::$loggers[$type])) {
            self::$loggers[$type] = new Writer(new Logger($type));
            self::$loggers[$type]->useDailyFiles(storage_path().'/logs/'. $type .'.log', $day, $level);
        }
        $log = self::$loggers[$type];
        return $log;
    }
}


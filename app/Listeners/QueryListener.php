<?php

namespace App\Listeners;

use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Libraries\Logs\BLogger;

class QueryListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  QueryExecuted  $event
     * @return void
     */
    public function handle(QueryExecuted $event)
    {
        $sql  = str_replace("?", '"%s"', $event->sql);
        $sql  = vsprintf($sql, $event->bindings);
        $time = $event->time;
        $name = $event->connectionName;
        $data = compact('sql','time','name');
        BLogger::getLogger(BLogger::LOG_QUERY_REAL_TIME)->info($data);
    }
}

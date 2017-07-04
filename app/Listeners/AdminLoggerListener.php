<?php

namespace App\Listeners;

use App\Events\AdminLogger;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class AdminLoggerListener
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
     * @param  =AdminLogger  $event
     * @return void
     */
    public function handle(AdminLogger $event)
    {
        $model = $event->model;
        $model->user_id = auth('admin')->user()->id;
        $model->catalog = $event->catalog;
        $model->intro  = $event->intro;
        $model->url = url()->current();
        $model->ip  = request()->ip();
        $model->created_at = time();
        $model->save();
    }
}

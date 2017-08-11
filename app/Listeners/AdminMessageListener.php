<?php

namespace App\Listeners;

use App\Events\AdminMessage;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class AdminMessageListener
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
     * @param  AdminMessage  $event
     * @return void
     */
    public function handle(AdminMessage $event)
    {
        $model              = $event->model;
        $model->from_uid    = auth('admin')->user()->id;
        $model->title       = $event->title;
        $model->to_uid      = $event->to_uid;
        $model->content     = $event->content;
        $model->created_at  = time();
        $model->save();
    }
}

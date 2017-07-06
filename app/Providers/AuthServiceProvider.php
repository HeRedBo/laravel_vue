<?php

namespace App\Providers;

use Illuminate\Contracts\Access\Gate as GateContract;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    protected $except = [
        'admin',
        'admin.error'
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot(GateContract $gate)
    {
        $this->registerPolicies();
        if(!empty($_SERVER['SCRIPT_NAME']) && strtolower($_SERVER['SCRIPT_NAME'] == 'artisan'))
        {
            return false;
        }

        $gate->before(function($user, $ssdf ){});
    }
}

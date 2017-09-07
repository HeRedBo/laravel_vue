<?php

namespace App\Providers;


use Illuminate\Contracts\Auth\Access\Gate as GateContract;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     * 应用的策略映射.
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
     *  注册任意认证 / 授权服务.
     *
     * @return void
     */
    public function boot(GateContract $gate)
    {
        $this->registerPolicies();
        if(!empty($_SERVER['SCRIPT_NAME']) && strtolower($_SERVER['SCRIPT_NAME']) === 'artisan')
        {
            return false;
        }

        // 中止权限检查
        $gate->before(function($user, $ability){
            if($user->id === 1 || in_array($ability, $this->except)) {
                return true;
            };
        });
        $permissions = \App\Models\Admin\Permission::with('roles')->get();

        foreach ($permissions as $permission)
        {
            $gate->define($permission->name, function($user) use ($permission)
            {
                return $user->hasPermisson($permission);
            });
        }
    }
}

<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminPermissionRoleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_permission_role', function(Blueprint $table)
        {
            $table->increments('id');
            $table->integer('permission_id')->unsigned()->comment('用户ID');
            $table->integer('role_id')->unsigned()->index()->comment('角色ID');
            $table->unique(['permission_id','role_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('admin_permission_role');
    }
}

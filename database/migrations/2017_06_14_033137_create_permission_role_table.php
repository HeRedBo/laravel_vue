<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePermissionRoleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
         Schema::create('permission_role', function (Blueprint $table) {
            $table->increments('id')->comment('主键ID');
            $table->integer('permission_id')->unsigned()->comment('权限id');
            $table->integer('role_id')->unsigned()->index('permission_role_role_id_foreign')->comment('角色ID');
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
        //
        Schema::dropIfExists('permission_role');
    }
}

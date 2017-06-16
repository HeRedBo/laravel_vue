<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_roles', function (Blueprint $table) {
            $table->increments('id',11)->comment('主键ID');
            $table->string('name', 50)->unique('roles_name_unique')->comment('角色名称');
            $table->string('display_name', 50)->default('')->comment('显示名称');
            $table->string('description', 100)->default('')->comment('角色描述');
            $table->timestamps();
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
        Schema::dropIfExists('admin_roles');
    }
}

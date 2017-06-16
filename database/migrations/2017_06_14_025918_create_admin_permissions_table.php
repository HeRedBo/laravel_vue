<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminPermissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('admin_permissions', function (Blueprint $table) {
            $table->increments('id',11)->comment('主键ID');
            $table->string('name',50)->unique('permissions_name_unique')->comment('权限名称');
            $table->string('display_name', 50)->default('')->comment('显示名称');
            $table->string('description', 100)->default('')->comment('角色描述');
            $table->smallInteger('level')->unsigned()->default(0)->comment('层级');
            $table->string('icon', 20)->default('')->comment('icon 图标');
            $table->integer('parent_id')->unsigned()->default(0)->comment('父级ID');
            $table->boolean('is_show')->default(1)->comment('是否显示');
            $table->smallInteger('order_num')->default(0)->comment('排序');
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
        Schema::dropIfExists('admin_permissions');
    }
}

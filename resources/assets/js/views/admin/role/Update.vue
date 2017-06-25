<template>
    <div class="row">
        <div class="col-md-12">
            
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{$route.name}}</h3>
                </div>

                <div class="box-body">
                   

                    <div class="form-group">
                        <label class="control-label">角色名称</label>
                        <input type="text" class="form-control" v-model="role.name" name="name" maxlength="100" placeholder="请输入角色名称">
                        <div class="help-block"></div>
                    </div>

                    

                    <div class="form-group">
                        <label class="control-label">角色概述</label>
                        <input type="text" v-model="role.description" name="description" class="form-control" maxlength="50">
                        <div class="help-block"></div>
                    </div>


                    <div class="form-footer">
                        <button ref="add_btn" @click="add" class="btn btn-success">添加 <i class="fa fa-plus"></i></button>
                        <button ref="edit_btn" style="display: none;" @click="edit" class="btn btn-success">编辑</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script type="text/javascript">
    export default {
        data() {
            return {
                role: {
                    name: '',
                    description : ''
                }
            }
        },
        created () {
            this.init();
        },
        methods: {
            init : function() {
                var url = '/admin/role/edit', id = this.$route.params.id , that = this;
                this.callHttp('POST',url, {id: id}, function(json) {
                    that.role = json;
                })
            }
            update() {
                var url = '/admin/role/'+ this.$route.params.id, id = this.$route.params.id, that = this, role = this.role;
                var that = this;
                this.callHttp('POST', url, role, function(json){
                    if(json.status) {
                        toastr.success('添加后台角色成功');
                        that.$router.back();
                    }
                })
            }
        }
    }
</script>
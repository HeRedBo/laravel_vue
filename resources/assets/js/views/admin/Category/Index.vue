<template>
    <div class="row">
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">快速添加</h3>
                </div>

                <div class="box-body">
                    
                    <div class="form-group">
                        <label>父级</label>
                        <v-select v-model="parentSelect" placeholder="请选择父级" :options="parentOptions"></v-select>
                    </div>

                    <div class="from-group field-adminnacl-name required">
                        <lable class="control-label">名称</lable>
                        <input type="text" name="AdminAcl[name]" v-model="category.name" class="form-control" maxlength="100">
                        <div class="help-block"></div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">排序</label>
                        <input type="text" v-model="category.order_num" class="form-control">

                        <div class="help-block"></div>
                    </div>

                    <div class="form-group">
                        <button class="btn btn-success" ref="add_btn" @click="add">添加</button>
                        <button class="btn btn-success" ref="edit_btn" @click="edit" style="display:none;">编辑</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">权限数</h3>
                </div>

                <div id="treeAcl">
                    
                </div>
            </div>
        </div>
    </div>
</template>

<script type="text/javascript">
    require('jstree/dist/themes/default/style.min.css');
    import vSelect from 'vue-select';
    export default {
        components : {vSelect},
        data() {
            return {
                category: {
                    id : null,
                    name : '',
                    parent_id : 0,
                    order_num : 0
                },
                parentSelect : null,
                parentOptions : [],
                treeData:null,
                treeDom : "#treeAcl"
            }
        },
        watch : {
            treeData() {

                $.jstree.reference(this.treeDom).settings.core.data = this.treeData;
                $.jstree.reference(this.treeDom).reference();
            }
        },

        mounnted () {
            this.loadList();
        },
        methods : {
            loadList: function() {
                var url = '/admin/category/index', that = this;
                this.callHttp('POST',url, {}, function(json) {
                    this.treeData = json.tree;
                    this.initTree();
                    this.parentOptions = json.select;

                });
            },
            initTree : function() {
                var that = this, treeData = this.treeData;
                $(this.treeDom).jstree({
                    'core': {
                        'check_callback': true,
                        'themes' : {
                            "theme" : 'default',
                        },
                        'data':treeData
                    },
                    "contextmenu" : {
                        "items" : function(node) {
                            return {
                                "create" : {
                                    "separator_before":false,
                                    "separator_after": true,
                                    "label" : "添加子权限",
                                    "action": function(obj) {
                                        that.addUI(node.id, node.next)
                                    }
                                },
                                "edit" : {
                                    "separator_before" : false,
                                    "separator_after": false,
                                    "label" : "编辑",
                                    "action" : function(obj) {
                                        that.edtiUI(node.id)
                                    }
                                },
                                "delete": {
                                    "separator_before" : false,
                                    "separator_after": false,
                                    "label" : "删除",
                                    "action" : function(obj) {
                                        that.del(node.id)
                                    }
                                }
                            }
                        }
                    },
                    "plugins": ["themes","types","contextmenu"]
                });
            },
            addUI: function(id, next) {
                var $refs = this.$refs;
                this.parentSelect = {label:text,value: id};
                this.permission = {};
                $($refs.add_btn).show();
                $($refs.edit_btn).hide();
            },
            edtiUI : function(id) {
                var url = '/admin/category/' + id + '/edit', that = this, $refs = this.$refs;
                this.callHttp('GET', url, {}, function(json) {
                    that.permission = json;
                    that.parentSelect = json.parent;
                    $($refs.add_btn).hide();
                    $($refs.edit_btn).show();
                }) ;
            },
            add : function() {
                var $permission = this.permission;
                var url = '/admin/category', that  = this;
                $permission.parent_id = this.parentSelect.value;
                $permission.is_show = $permission.is_show ? 1: 0;
                this.callHttp('POST',url, $permission, function() {
                    if(json.status) {
                        toastr.success('添加分类权限成功');
                        that.permission = {};
                        that.parentSelect = null;
                        that.loadList();
                    }
                }) 
            },
            edit : function () {
                var $permission = this.permission;
                var url = '/admin/category' + $category.id, that = this;
                $category.parent_id = this.parentSelect?this.parentSelect.value:0;
                this.callHttp("PUT", url, $category, function (json) {
                    if (json.status) {
                        toastr.success('更新分类成功!')
                        that.permission = {};
                        that.parentSelect = null;
                        that.loadList();
                    }
                });
            },
            del : function(id) {
                var url = '/admin/category/' + id, that = this;
                this.callHttp('DELETE',url, {}, function(json) {
                    if(json.status) {
                        toastr.success('删除分类成功');
                        $.jstree.reference(that.treeDom).delete_node(id);
                    } else {
                        toastr.error(json.msg,'出错了！');
                    }
                })
            }

        }
    }
</script>
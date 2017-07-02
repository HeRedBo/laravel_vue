<template>
    <div class="row">
        
        <div class="col-md-6">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">权限树</h3>
                </div>

                <div id="treeAcl"></div>
                <div class="box-footer">
                    <button type="button" @click="add" class="btn btn-success">设置</button>
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
                treeData : null,
                treeDom : "#treeAcl"
            }
        },
        watch : {

        },

        mounted () {

            this.loadList();
        },
        methods: {
            loadList: function () {
                var url = '/admin/role/getAcl', that = this, id = this.$route.params.id;
                this.callHttp("POST", url, {id:id}, function (json) {
                    this.treeData = json.tree;
                    this.initTree();
                });
            },
            initTree: function () {
                var that = this, treeData = this.treeData;
                $(that.treeDom).jstree({
                    'core': {
                        'check_callback': true,
                        "themes": {
                            "theme": "default",
                        },
                        'data': treeData
                    },
                    ui: {
                        theme_name : "classic"
                    },
                    "checkbox": {
                        cascade : "", three_state : true, whole_node: true
                    },
                    'plugins': ['types', 'checkbox', 'ui']
                });


            },
            add: function () {
               var url = '/admin/role/setAcl', that = this, id = this.$route.params.id,
                    permission = $.jstree.reference(this.treeDom).get_selected();
                    console.log(permission);return;
                this.callHttp("POST", url, {id:id, permission : permission}, function (json) {
                    if (json.status) {
                       toastr.success('设置权限成功');
                       that.$router.back();
                    }
                });
            }
        }
    }
</script>
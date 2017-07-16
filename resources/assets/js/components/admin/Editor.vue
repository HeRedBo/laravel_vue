<template>
    <div :id="id" style="height:400px">

    </div>
</template>
<script type="text/javascript">
    import wangEditor from 'wangeditor'

    export default {
        name: 'editor',
        data() {
            return {
                editor : "",
            }
        },
        props : {
            id :{
                type : String,
                default : "editor"
            },
            html : {
                type : String,
                default : null
            },
           
        },
         watch : {
                html() {
                    if(this.html != null) {
                        this.editor.txt.html(this.html);
                    }
                }
        },
        mounted () {
            var editor = new wangEditor('#' + this.id), self = this;
            editor.customConfig.uploadImgServer = '/admin/upImg';
            editor.customConfig.uploadImgParams ={
                _token: Laravel.csrfToken
            };

            editor.customConfig.onchange  = function() {
                var content = editor.txt.html();
                console.log(content);
                self.$emit('content',content);
            }
            editor.create();
            this.editor = editor;
        }
    }

</script>
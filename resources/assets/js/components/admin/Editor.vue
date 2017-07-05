<template>
    <div :id="id" style="height:400px">
        
    </div>
</template>

<script type="text/javascript">
    require("wangeditor/dist/js/wangEditor.js");
    require("wangeditor/dist/css/wangEditor.css");

    export default {
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
            watch : {
                html() {
                    if(this.html != null) {
                        this.editor.$text.html(this.html);
                    }
                }
            },
            mounted () {
                var editor = new wangEditor(this.id), self = this;
                editor.config.uploadImageUrl = '/admin/upImg';

                editor.config.uploadParams = {
                    _token : Lavavel.csrfToken
                };

                editor.onchange  = function() {
                    var content = editor.$txt.html();
                    self.$emit('content',content);
                }
                editor.create();
                this.editor = editor;
            }
        }
    }

</script>
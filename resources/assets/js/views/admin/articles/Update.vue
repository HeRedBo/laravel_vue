<template>
    <div class="row">
        <div class="col-md-12">
            
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{$route.name}}</h3>
                </div>

                <div class="box-body">
                   

                    <div class="form-group">
                        <label class="control-label">标题</label>
                        <input type="text" class="form-control" v-model="article.title" name="title" maxlength="100" placeholder="请输入标题">
                        <div class="help-block"></div>
                    </div>

                    
                    <image-upload label="上传封面" :picture="article.picture" v-on:pic="getPicuture()"> </image-upload>


                    <div class="form-group">
                        <label class="control-label">简介 </label>
                        <textarea  class="form-control" name="description" v-model="article.info" rows="3" placeholder="输入简介">
                        </textarea>   
                    </div>

                     <div class="form-group">
                        <label class="control-label">标签 </label>
                        <tag v-on:tags="getTags" id="tags" :tags="article.tags"></tag>
                    </div>

                    <div class="form-group">
                        <label class="control-label">内容</label>
                        <editor :html="article.content" v-on:content="getContent"></editor>  
                    </div>

                    <div class="form-footer">
                        <button type="submit" @click="$router.back" class="btn btn-default">返回</button>
                        <button type="submit" @click="update" class="btn btn-info pull-right">编辑</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script type="text/javascript">
    import vSelect from 'vue-select';
    import ImageUpload from "../../../components/admin/ImgaeUpload.vue";
    import Editor from "../../../components/admin/Editor.vue";
    import TagEditor from "../../../components/admin/TagEditor.vue";

    export default {
        components : { vSelect, 'image-upload': ImageUpload, Editor, "tag" : TagEditor},
        data() {
            return {
                article: {
                    category_id : '',
                    picture : '',
                    title : '',
                    tags : '',
                    info : '',
                    content : ''
                },
                category : null,
                categoryOptions : []
            }
        },
        created() {
            this.init();
        },
        methods: {
            init : function () {
                this.getCategory();
                var url = '/admin/articles/edit', id = this.$route.params.id;
                this.callHttp("POST", url, {id : id}, function(json) {
                    this.article = json;
                    this.category = json.category;

                });
            },
            update() {
                var url = '/admin/articles/' + this.$route.params.id;
                this.article.category_id = this.category.value;
                this.callHttp('PUT', url, this.article, function(json){
                    if(json.status) {
                        toastr.success('更新文章成功');
                        that.$router.back();
                    }
                })
            },

            getCategory () {
                var url = '/admin/articles/category';
                this.callHttp("GET", url, {}, function(json) {
                    this.categoryOptions = json;
                });
            },

            getContent(value) {
                this.article.content = value;
            },

            getTags (value) {
                this.article.tags = value;
            },

            getPicture(value) {
                this.article.picture = value;
            } 


        }
    }
</script>
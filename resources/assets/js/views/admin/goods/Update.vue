<template>
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{$route.name}}</h3>
                </div>

                <div class="box-body">
                    <div class="form-group">
                        <label>商品名称</label>
                        <input type="text" class="form-control" name="username" v-model="goods.name" placeholder="输入商品名称" />
                    </div>

                    <div class="form-group">
                        <label>价格</label>
                        <input type="text" class="form-control" name="pirce" v-model="goods.price" placeholder="输入价格">
                    </div>

                     <image-upload label="上传头像" :picture="goods.picture" v-on:pic="getPicture"></image-upload>

                    <div class="form-group">
                        <label>关键词(淘宝搜索用)</label>
                        <input type="text" class="form-control" name="goods.tag" v-model="goods.tag" placeholder="输入关键词">
                    </div>

                
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-default" @click="$router.back();">返回</button>
                    <button type="submit" class="btn btn-info pull-right" @click="update">更新</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script type="text/javascript">
import ImageUpload from '../../../components/admin/ImgaeUpload.vue';
export default {
    components : {'image-upload':ImageUpload},
    data() {
        return {
            goods: {
                name : '',
                price : '',
                tag :'',
                picture : '',
            }
        }
    },
    
    created() {
        this.init();
    },
    methods: {
        init : function () 
        {
            var url = '/admin/goods/edit', id = this.$route.params.id;
            this.callHttp('POST', url, {id : id }, function(json){
                this.goods = json;
            });
        },
        update() {
            var url = '/admin/goods/' + this.$route.params.id;
            this.callHttp('PUT', url, this.goods, function(json){
                if(json.status) {
                    toastr.success('更新商品成功！');
                    that.$router.back();
                }
            });
        },
        
        getPicture (value) {
            this.goods.picture = value;
        }
    }
}
</script>
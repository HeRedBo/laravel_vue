<template>
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">{{$route.name}}</h3>
				</div>

				<div class="box-body">
				<div class="form-group">
					<label>账号</label>
					<input type="text" class="form-control" name="username" v-model="user.username" placeholder="输入账号">
				</div>

				<div class="form-group">
					<label>密码</label>
					<input type="password" class="form-control" name="password" v-model="user.password" placeholder="输入密码">
				</div>
				
				<div class="form-group">
					<label>姓名</label>
					<input type="text" class="form-control" name="user.name" v-model="user.name" placeholder="姓名">
				</div>

				<div class="form-group">
					<label>手机号</label>
					<input type="number" class="form-control" name="user.phone" v-model="user.phone" placeholder="输入手机号">
				</div>
				 <div class="form-group">
                        <label>邮箱</label>
                        <input type="text" class="form-control" v-model="user.email" name="email" placeholder="输入邮箱">
                    </div>
				<div class="form-group">
					<label>角色</label>
					<v-select v-model="roles" multiple :options="roleOptions"></v-select>	
				</div>
				<image-upload label="上传头像" v-on:pic="getPicture"></image-upload>

			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-default" @click="$router.back();">返回</button>
                <button type="submit" class="btn btn-info pull-right" @click="add">添加</button>
			</div>
		</div>

			
		</div>
	</div>
</template>
<script type="text/javascript">
	import ImageUpload from '../../../components/admin/ImgaeUpload.vue';
	import vSelect  from 'vue-select';
	export default {
		components : {'image-upload':ImageUpload,vSelect},
		data() {
			return {
				user: {
					username : '',
					password : '',
					name :'',
					phone : '',
					email : '',
					roles : null,
					picture : ''
				},
				roles : null,
				roleOptions: [],
			}
		},

		created() {
			this.getRole();
		},
		methods: {
			add() {
				var url = '/admin/user',that=this,roleArr = [];
				for(var i in this.roles) {
					roleArr.push(this.roles[i].value)
				}
				this.user.roles = roleArr;
				console.log(this.user);
				this.callHttp('POST', url, this.user, function(json){
					if(json.status) {
						toastr.success('添加后台用户成功！');
						that.$router.back();
					}
				});
			},

			getRole () {
				var url = '/admin/user/role', that = this;
				this.callHttp('GET',url , {} , function(json){
					var options = [];
					for (var i in json ) {
							options.push({value : json[i].id , label: json[i].name});
					}	
					that.roleOptions = options;
				});
			},
			getPicture (value) {
				this.user.picture = value;
			}
		}
	}
</script>
<template>
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">{{$route.name}}</h3>
				</div>
			</div>

			<div class="box-body">
				<div class="form-group">
					<label>账号</label>
					<input type="text" class="form-control" name="username" v-model="user.username" placeholder="输入账号">
				</div>

				<div class="form-group">
					<label>密码</label>
					<input type="text" class="form-control" name="password" v-model="user.password" placeholder="输入密码">
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
</template>
<script type="text/javascript">
	import ImageUpload from '../../../components/admin/ImgaeUpload.vue';
	export default {
		components : {'image-upload':ImageUpload},
		data() {
			user: {
				username:'',
				password:'',
				name:'',
				phone: '',
				roles:null,
				picture: ''
			},
			roles : null,
			roleOptions: [],
		},

		created() {
			//this.getRole();
		},
		methods: {
			add() {
				var url = '/admin/user/role',that=this,roleArr = [];
				for(var i in this.roles) {
					roleArr.push(this.roles[i].value)
				}
				this.user.roles = roleArr;
				this.callHttp('POST', url, this.user, function(json){
					if(json.status) {
						toastr.success('添加后台用户成功！');
						that.$router.back();
					}
				});
			},

			getPicture (value) {
				this.user.picture = value;
			}
		}
	}
</script>
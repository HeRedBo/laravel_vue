<template>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">

				<listHeader table="123">
					<template slot ="form">
						<div class="input-group input-group-sm">
							<span class="input-group-addon"><strong>ID</strong></span>
							<input type="text" name="keyword" v-model="params.keyword" class="form-control" placeholder="请输入要查询的账号或姓名">
						</div>
					</template>
				</listHeader>



				<vTable ref="table"
					stripped
					hover
					:ajax_url = "ajax_url"
					:params="params"
					:items="items"
					:fields="fields"
					:current-page="currentPage"
					:per-page="perPage"
					:del="del"
					:checkbox="checkbox"
				>
					<template slot="isOnLine" scope="item">
						<i :class="['fa','fa-circle',item.item.isOnLine==1?'text-success':'text-danger']"></i>
					</template>
					<template slot="username" scope="item">
						<img :src="item.item.picture" width="20px" height="20px" class="img-circle"/>
						{{item.item.username}}
					</template>

					<template slot="actions" scope="item">
						<div class="btn-group">
							<a href="#" @click.prevent="view(item.item.id)" class="btn btn-success btn-xs">查看</a>
							<a href="#" @click.prevent="msgBox(item.item)" v-if="item.item.id!=$store.state.uid" class="btn btn-info btn-xs">消息</a>
							<router-link :to="{path:'update/'+ item.item.id}" class="btn bg-orange btn-xs">编辑</router-link>
							<a href="#" @click.prevent="$refs.table.onDel(item.item.id)" class="btn btn-danger btn-xs">删除</a>
						</div>
					</template>

				</vTable>
			</div>
		</div>

		<div id="user_view_box" style="display: none">

			<div class="box box-widget widget-user-2">
				<div class="widget-user-header bg-yellow">
					<div class="widget-user-image">
						<img class="img-circle" :src="user.picture" alt="User Avatar"/>
					</div>

					<h3 class="widget-user-username">{{user.username}}</h3>
					<h5 class="widget-user-desc">{{user.name}}</h5>
				</div>

				<div class="box-footer no-padding">
					<ul class="nav nav-stacked">
						<li><a href="#">手机号<span class="pull-right badge bg-blue">{{user.phone}}</span></a></li>
						<li><a href="#">角色<span class="pull-right badge bg-aqua">{{user.rolesStr}}</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				items :[],
				checkbox: true,
				fields: {
					id : {label : 'ID' ,sortable:true},
					username : {label : '用户名'},
					name : {label: '姓名'},
					isOnLine : {label: '在线'},
					created_at : {label: '添加时间',sortable:true},
					actions : {label: '操作'},
				},
				user : {
					username: '',
					password: '',
					name : '',
					phone : '',
					rolesStr: '未分配',
					picture: ''
				},
				text : '',
				ajax_url : '/admin/user/index',
				params : {keyword : ''},
				total : 0,
				currentPage :1,
				perPage :15,
				del:{url:'/admin/user',title:'确定要删除用户吗？',successText: '删除后台用户成功！'}
			}
		},
		watch : {},
		created () {

		},
		methods : {
			view : function(id) {
				var url = '/admin/user/show';
				id = $.trim(id);
				this.callHttp('GET', url, {id:id}, function(json) {
					this.user = json;
					setTimeout(function() {
						swal({
							title:'',
							html : $("#user_view_box").html(),
							customClass : 'user_view_box'
						});
					}, 100)
				});
			},
			msgBox : function(item) {
				var that = this;
				var websocket = this.$store.state.websocket;
				setTimeout(function(){
					$(that.$refs.msg_text).attr('id','msgText' + item.id);
					swal({
						title : 'To:' + item.username,
						input: 'textarea',
						showCancelButton : true,
						closeOnConfirm: false,
						showLoaderButtonText: '发送',
						cancelButtonText  : '取消',

					}).then( function(text){
						var uid = item.id;
						var url = '/admin/user/send';
						that.callHttp('POST',url, {uid: uid, text: text}, function(json) {
							if(json.status) {
								websocket.send(item.id);
								swal({
									title : '成功',
									text : '发送成功',
									timer : 2000,
									showConfirmButton : false
								});
							}
						});
					});
				});
			}
		}

	}
</script>

<style>
	.user_view_box {
		width : 312px;
	}

	.nav-stacked > li > a {
		text-align: left;
	}
</style>

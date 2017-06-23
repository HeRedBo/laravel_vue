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
						<v-select v-model="parentSelect" placeholder="请选择父级" 
						:options="parentOptions"></v-select>
					</div>

					<div class="form-group field-adminacl-name required">
						<label class="control-label">名称</label>
						<input type="text" class="form-control" v-model="permission.display_name" name="AdminAcl[name]" maxlength="100">
						<div class="help-block"></div>
					</div>

					<div class="form-group field-adminacl-icon ">
						<label  class="control-label">图标</label>
						<input type="text" v-model="permission.icon" class="form-control" maxlength="50">
						<div class="help-block"></div>
					</div>

					<div class="form-group field-adminacl-module">
						<label class="control-label">权限别名</label>
						<input type="text" v-model="permission.name" class="form-control" maxlength="50">
						<div class="help-block"></div>
					</div>

					<div class="form-group">
						<label class="control-label">排序</label>
						<input type="text" v-model="permission.order_num" class="form-control">
						<div class="help-block"></div>
					</div>
					
					<div class="form-group field-adminacl-is_show">

                        <label><input type="checkbox" v-model="permission.is_show" value="0">
                            左侧是否显示</label>

                        <div class="help-block"></div>
                    </div>
					
					<div class="form-group">
						<button ref="add_btn" @click="add" class="btn btn-success">添加 <i class="fa fa-plus"></i></button>
						<button ref="edit_btn" style="display: none;" @click="edit" class="btn btn-success">编辑</button>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-61">
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
	required('jstree/dist/themes/default/style.minl.css');
	import vSelect from 'vue-from';
	export default {
		components : {vSelect},
		data() {
			return {
				permission : {
					id : null,
					display_name : '',
					icon : '',
					name : '',
					parent_id : '',
					order_num : '',
					is_show : ''
				},
				parentSelect : null,
				parentOptions : [],
				treeData:null,
				treeDom : "#treeAcl"
			}
		},
		watch : {
			
		}
	}
</script>
<template>
	<div class="box-body table-responsive no-padding"></div>

	<table :class="['table table-bordered dataTable',stripped?'table-striped':'',hover?'table-hover':'']"
		<thead>
			<tr>
				<th @click="headClick(field, key)" :class="[field.sortable?'sorting':null,sort===key?'sorting_' + (sortDesc?'desc':'asc'):'']" v-for="field, key in fields">
					{{field.label}}
				</th>
			</tr>
			<tbody>
				<tr v-for="item in _items" :key="items_key" :class="[item.state?'table-'+item.state:null]">
					<td v-for="(field, key ) in fields">
						<slot :name="key" :value="field.need?item[field.need][key]:item[key]" :item="item">
							{{field.need?item[filed.need][key]:item[key]}}
						</slot>
					</td>
				</tr>
			</tbody>
		</thead>
	</table>
	<div class="col-sm-7">
		<vPagination 
			size="md",
			:tatal-rows="tatal"
			:per-page="perPage"
			v-model="currentPage"
		/>
			
		
	</div>
</template>
<script type="text/javascript">
	 require('admin-lte/plugins/datatables/dataTables.bootstrap.css');
	 import Pagination from './Pagenation.vue';

</script>
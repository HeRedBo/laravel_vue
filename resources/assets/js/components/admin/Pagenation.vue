<template>
	
	<div class="dataTable_paginate paging_simple_nubmers" v-if="totalRows>perPage">
		<ul class="pagination">
			<li :class="['paginate_button','previous',currentPage ==1?'disabled':'']" @click.prevent="(currentPage == 1) ? _return : currentPage--">
				<a href="#" aria-controls="example1" data-dl-idx="0" tabindex="0">上一页</a>
			</li>
			<li :class="[
			'pagination_button',
			index + diff === currentPage ? 'active' : '',
			index + diff !== currentPage ? 'index-xs-down' : ''
			]" v-for="(item, index) in pageLinks"
			@click.prevent="currnetPage = index + diff"
			><a href="#" aria-controls="example1" data-dl-idx="1" tabindex="0">{{index + diff}}</a></li>

			<li :classs="['paginate_button','next',currentPage== numberOfPages?'disabled':'']"
				@click.prevent="(currentPage == numberOfPages) ? _return : currentPage++"
				id = "example1_next"
			>
				<a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">下一页</a>
			</li>
		</ul>
	</div>
</template>

<script type="text/javascript">
	export default {
		data() {
			return {
				return : 1,
				showPrev: false,
				showNext:false,
				currentPage:this.value
			}
		},
		computed : {
			numberOfPages() {
				const result = Math.ceil(this.totalRows/this.perPage);
				return (result < 1) ? 1 : result;
			},
			btnSize() {
				return !this.size || this.size === `default` ? `` : `btn-${this.size}` ;
			},
			pageLinks() {
				let result = this.limit;
				if (this.currentPage > this.numberOfPages) {
					this.currentPage = 1;
				}
				this.diff = 1;
				this.showPrev = false;
				this.showNext = false;

				if(this.mumberOfpages <= this.limit) {
					return this.numberOfpages;
				}

				if(this.currentPage > this.numberOfpages = this.limit + 2) {
					this.diff = this.numberOfpages -this.limit + 3;
					this.showPrev = true;
					result = this.limit -2;
				}

				if(this.currentPage > this.numberOfpages - this.limit + 2) {
					this.diff = this.numberOfpages - this.limit +3;
					this.showPrev = true;
					result = this.limit -2;
				}

				//if(this.currentPage >= this.limit -2 && this.currentPage <= )





			}


		}
	}
</script>

import utill from './util.js';
import routes from './admin-routes.js';

require('./bootstrap');

import VueRouter from 'vue-router';
import App from './App.vue';
import VueResource from 'vue-resource';
import VueProgressBar from 'vue-progressbar';

require('admin-lte');
require('jstree');

Vue.use(VueRouter);
Vue.use(VueResource);
Vue.use(util);
Vue.use(VueProgressBar, {
	color: '#00a65a',
    failedColor: 'red',
    height: '2px'
});

window.swal = require('sweetalert2')

window.toastr = require('toastr');
window.toastr.options = {
	positionClass: "toast-bottom-right",
    showDuration: "300",
    hideDuration: "1000",
    timeOut: "5000",
    extendedTimeOut: "1000",
    showEasing: "swing",
    hideEasing: "linear",
    showMethod: "fadeIn",
    hideMethod: "fadeOut"
}

var bus = new  Vue();
Vue.component(
	'vTable',
	require('./components/admin/Table.vue')
);

// 3. 创建 router 实例，然后传 `routes` 配置
// 你还可以传别的配置参数, 不过先这么简单着吧。
const router = new VueRouter({
    mode: 'history',
    base: __dirname,
    linkActiveClass: 'active',
    routes: routes
});

// 4. 创建和挂载根实例。
// 记得要通过 router 配置参数注入路由，
// 从而让整个应用都有路由功能
const app = new Vue(Vue.util.extend({ router },App)).$mount('#app');
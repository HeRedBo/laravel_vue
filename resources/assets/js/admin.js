
import utill from './util.js';
import routes from './admin-routes.js';

require('./bootstrap');

import VueRouter from 'vue-router';
import App fro './App.vue';
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

window.toastr = require('taostr');
window.taostr.options = {
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

Vue.components(
    
);




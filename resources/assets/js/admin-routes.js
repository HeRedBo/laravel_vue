
import Main from './views/admin/layouts/Main.vue'
import Parent from './views/admin/layouts/Parent.vue'

export default [
{
    path:'/admin',
    component: Main,
    children : [
        {
        	path: 'user',
        	component : Parent,
        	name : '用户管理',
        	children : [
        		// {
        		// 	path: 'index',
        		// 	name: '用户列表',
        		// 	component: require('./views/admin/user/Index.vue')
        		// },
                {
                    path: 'create',
                    name: '添加用户',
                    component: require('./views/admin/user/Create.vue')
                },
                // {
                //     path: 'update/:id',
                //     name: '编辑用户',
                //     component: require('./views/admin/user/Update.vue')
                // },
        	]
        },
        {
            path : '*',
            redirect : '/admin '
        },
    ]

}
]


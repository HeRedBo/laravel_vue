
import Main from './views/admin/layouts/Main.vue'
import Parent from './views/admin/layouts/Parent.vue'

export default [
{
    path:'/admin',
    component: Main,
    children : [
        {
            path : '*',
            redirect : '/admin '
        },
        {
        	path: 'user',
        	component : Parent,
        	name : '用户管理',
        	children : [
        		{
        			path: 'index',
        			name: '用户列表',
        			component:
        		}
        	]
        }
    ]

}
]


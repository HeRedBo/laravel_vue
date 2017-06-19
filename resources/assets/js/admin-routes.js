
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
        }
    ]

}
]


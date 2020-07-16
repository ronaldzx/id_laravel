import Vue from 'vue'
import VueRouter from 'vue-router'
import Example from './components/ExampleComponent.vue'
import MisGrupos from './components/MisGrupos'
import Grupos from './components/Grupos'
Vue.use(VueRouter)

export default new VueRouter({
    mode:'history',
    routes: [
        {
            path:'/example',
            name: 'example',
            component:Example
        },
        {
            path:'/mis_grupos',
            name:'mis_grupos',
            hidden: true,
            component:MisGrupos,
        },
        {
            path:'/grupos',
            name:'grupos',
            hidden: true,
            component:Grupos,
        },
    ],
    base: process.env.BASE_URL,
})
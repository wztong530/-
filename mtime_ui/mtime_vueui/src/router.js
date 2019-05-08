import Vue from 'vue'
import Router from 'vue-router'
import notfound from './views/notfound'
import home from './views/home'
import shop from './views/shop'
import film from './views/film'
import login from './views/login'
import register from './views/register'
import ad from './views/ad'
import show from './views/show'
import willshow from './views/willshow'
import movie from './views/movie'
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/movie',component:movie},
    {path:'/willshow',component:willshow},
    {path:'/show',component:show},
    {path:'/ad',component:ad},
    {path:'/shop',component:shop},
    {path:'/film',component:film},
    {path:'/register',component:register},
    {path:'/login',component:login},
    {path:'/home',component:home},
    {path:'/',component:home},
    {path:'*',component:notfound}
  ]
})

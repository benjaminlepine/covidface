import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Covidgame from '../components/Covidgame';
import Homepage from '../components/HomePage';

Vue.use(VueRouter)

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/Home', component: Home },
  { path: '/Covidgame', component: Covidgame},
  { path: '/Homepage', component: Homepage},
  { path: '/about', name: 'About', component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')},
  { path: '*', component: Home }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

import MainViewVue from '@/views/MainView.vue'
import LoginViewVue from '@/views/LoginView.vue'
import UserViewVue from '@/views/UserView.vue'
import { createRouter, createWebHashHistory } from 'vue-router'
import users from '@/router/users'
import infos from '@/router/info'
import business from "@/router/business";
import reward from "@/router/reward";
const routes = [
	{
		path:'/',
		redirect:'/login'
	},
	{
		path:'/login',
		component:LoginViewVue
	},
	{
		path:'/user',
		component:UserViewVue
	},
	{
		path:'/main',
		component:MainViewVue,
		children:[
			...users,
			...infos,
			...business,
			...reward
		]
	}

]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router

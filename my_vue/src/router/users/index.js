import AddUserViewVue from "@/views/users/AddUserView.vue";
import SearchUserViewVue from "@/views/users/SearchUserView.vue";

let users=[
	{
		path:'/addUser',
		component:AddUserViewVue
	},
	{
		path:'/searchUser',
		component:SearchUserViewVue
	}
]

export default users;
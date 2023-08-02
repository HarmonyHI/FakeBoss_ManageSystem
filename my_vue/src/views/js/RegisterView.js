export default {
    name:'RegisterView',
    data() {
        return{
            user:{
                userName:'',
                userPwd:'',
                confirmPwd:'',
                userSex: 1,
                userEmail:'',
                userBirthday: '1980-01-01',
            }
        }
    },
    methods:{
        doRegister(){
            if(this.user.userPwd!==this.user.confirmPwd){
                this.$message("两次输入密码不一致");
            }
            else if(this.user.userPwd.length<8) {
                this.$message("密码过短");
            }
            else if(this.user.userName.length<8) {
                this.$message("账号过短");
            }
            else{
                this.$axios.post("UsersController/Register",this.user)
                    .then(rst=>{
                        let resultJson=rst.data;
                        let info=resultJson.data;
                        this.$message("注册成功");
                        this.$router.push("/login");
                        let str=JSON.stringify(info);
                        sessionStorage.setItem("info",str);
                    }).catch(err=>{
                    console.log(err);
                })
            }
        }
    }

}
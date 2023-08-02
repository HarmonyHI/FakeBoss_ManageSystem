export default{
    name:'EditPwd',
    data() {
        return{
            user:{
                oldPwd:'',
                newPwd:'',
                rePwd:'',
                userID:''
            }
        }
    },
    methods:{
        doEdit() {
            if(this.user.newPwd === '' || this.user.oldPwd === '' || this.user.rePwd === ''){
                this.$message("密码不能为空");
            }
            else{
                if(this.user.newPwd.length < 8 || this.user.oldPwd.length < 8 || this.user.rePwd.length < 8 ){
                    this.$message("密码过短");
                }
                else if (this.user.newPwd !== this.user.rePwd) {
                    this.$message("两次密码输入不一致");
                } else {
                    this.$axios
                        .post("UsersController/updatePwd", this.user)
                        .then((rst) => {
                            let resultJson = rst.data;
                            if (resultJson.code === 200) {
                                this.$message("修改成功");
                            } else {
                                this.$message("原密码错误，请重新输入");
                            }
                        })
                        .catch((err) => {
                            console.log(err);
                            this.$message(err);
                        });
                }
            }
        }
    },
    created() {
        let str=sessionStorage.getItem("info");
        this.user.userID=JSON.parse(str).userID;
    }
}
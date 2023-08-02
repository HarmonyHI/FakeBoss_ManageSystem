export default{
    name:'EditInfoView',
    data() {
        return{
            user:{
            }
        }
    },
    methods:{
        checkEmail(str){
            return (str.search("@") !== -1)&&(str.search("@") !== str.length-1);
        },
        doEdit(){
            if(!this.checkEmail(this.user.userEmail)){
                this.$message("请输入正确的邮箱地址");
            }
            else if(this.user.userName === ''){
                this.$message("用户名不能为空");
            }
            else{
                this.$axios.post("UsersController/update",this.user)
                    .then(rst=>{
                        let resultJson=rst.data;
                        if(resultJson.code===200){
                            this.$message("修改成功!");
                            let str=JSON.stringify(this.user);
                            sessionStorage.setItem("info",str);
                            this.$emit("info",this.user);
                        }else{
                            this.$message("修改失败");
                        }
                    }).catch(err=>{
                    this.$message("修改失败，用户名可能已存在");
                    console.log(err)
                })
            }
        }
    },
    created() {
        let str=sessionStorage.getItem("info");
        this.user=JSON.parse(str);
    }
}
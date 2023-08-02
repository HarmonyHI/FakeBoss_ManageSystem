
export default {
    name: 'rewardManagement',
    data(){
        return{
            jc:{
                userID:'',
                jcTime:'',
                jcMoney:'',
                jcDis:'',
            }
        }
    },
    methods:{
        doSaveReward(){
            if(this.jc.jcDis === '' || this.jc.jcMoney === '' || this.jc.jcTime === '' || this.jc.userID === ''){
                this.$message("请将信息填写完整");
            }
            else {
                this.$axios.post("UsersController/jcCin",this.jc)
                    .then(resp=>{
                        if(resp.data.code===200){
                            this.$message("上传成功");
                            this.jc.jcDis = '';
                            this.jc.jcMoney = '';
                            this.jc.jcTime = '';
                            this.jc.userID = '';
                        }
                        else {
                            this.$message("上传失败");
                        }
                    }).catch(err=>{
                    this.$message("用户不存在");
                    console.log(err);
                })
            }
        }
    }
}

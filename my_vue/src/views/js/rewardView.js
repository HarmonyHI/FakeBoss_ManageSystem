export default {

    name: 'rewardView',
    data() {
        return{
            user:{
                userID:''
            },
            reward:[],
        }
    },
    methods:{
        doSearch() {
            this.$axios.post("UsersController/jcFind",this.user)
                .then(rst=>{
                    //获取响应的数据
                    let resultJson=rst.data;
                    //获取查询的记录
                    this.reward=resultJson.data;
                    if(this.user.userID===''){
                        this.$message("请输入待查员工ID");
                    }
                    else if(this.reward.length===0){
                        this.$message("没有查到相关记录");
                    }
                }).catch(()=>{
            })
        },
    }
}

export default {
    name: 'signIn',
    data(){
        return{
            user:{
                userID:''
            },
            dataArr:[],
            dataArr2:[],
            signIn:[],
            pageData:[-1,-1,-1,-1,-1,-1]
        }
    },
    created(){
        this.$axios.post("UsersController/ask1")
            .then(rst=>{
                try{
                    this.dataArr = rst.data.data
                    this.pageData[0]=this.dataArr[0]['n1']
                    this.pageData[1]=this.dataArr[0]['n2']
                    this.pageData[2]=this.dataArr[0]['n3']
                }catch (e){
                    this.$message(e.toString())
                }
            }).catch((err)=>{
                this.$message('拉取统计数据A错误' + err.toString())
        })
        this.$axios.post("UsersController/ask2")
            .then(rst=>{
                this.dataArr2 = rst.data.data
                this.pageData[3]=this.dataArr2[0]['n1']
                this.pageData[4]=this.dataArr2[0]['n2']
                this.pageData[5]=this.dataArr2[0]['n3']
            }).catch((err)=>{
            this.$message('拉取统计数据B错误' + err.toString())
        })
        this.$axios.post("UsersController/ask3", this.user)
            .then(rst=>{
                let resultJson=rst.data;
                this.signIn=resultJson.data;
            }).catch((err)=>{
            this.$message("拉取签到记录错误" + err.toString());
        })
    },
    methods:{
        doSearch() {
            this.$axios.post("UsersController/ask3",this.user)
                .then(rst=>{
                    let resultJson=rst.data;
                    this.signIn=resultJson.data;
                    if(this.signIn.length===0){
                        this.$message("没有查到签到记录");
                    }
                }).catch((err)=>{
                    this.$message("拉取签到记录错误" + err.toString());
            })
        },
        unPacker(dict){
            try {
                JSON.parse(dict)
            }catch (err){
                this.$message(err.toString())
            }
            return dict
        }
    }
}
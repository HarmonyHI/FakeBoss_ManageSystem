import { ArrowDown } from '@element-plus/icons-vue'
export default{
    name:'MainView',
    data() {
        return{
            user:{},
            pressInfo:false
        }
    },
    created() {
        let str=sessionStorage.getItem("info");
        if(str==null){
            this.$router.push("/login");
        }else{
            this.user=JSON.parse(str);
        }
        if(this.user.WID !== 1){
            this.$message("参数非法");
            sessionStorage.removeItem("info");
            this.$router.push("/login")
        }
    },
    methods:{
        exit(){
            sessionStorage.removeItem("info");
            this.$message("退出登录成功");
            this.$router.push("/login")
        },
        changeInfo(v){
            this.user=v;
        },
        handleCommand(command) {
            this.$message('click on item ' + command);
        }
    }
}

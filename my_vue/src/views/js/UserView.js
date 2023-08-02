import router from "@/router";
import {say_hi_word} from "./utils.js";
import * as utils from "@/views/js/utils";

export default {
  name: "UserView",
  data() {
    //把json格式的字符串转为json对象
    return {
      user: {
        userID: "",
        WName: "",
      },
      my_rest: {
        userID: "",
        t1: "",
        t2: "",
        dis: "",
      },
      jcCount: 0,
      rest: [],
      reward: [],
      signIn:[],
      displayChangePwd: false,
      displayChangeInfo: false,
      restApplySuccess: false,
      userNameBkp: "",
    };
  },
  created() {
    let str = sessionStorage.getItem("info");
    if (str == null) {
      this.$message("参数非法");
      this.$router.push("/login");
    } else {
      this.user = JSON.parse(str);
    }
      if (this.user.WID !== 2 && this.user.WID !== 3) {
        this.$message("参数非法");
        sessionStorage.removeItem("info");
        this.$router.push("/login");
      }
      else{
        this.$axios
            .post("UsersController/jcFind", this.user)
            .then((rst) => {
              //获取响应的数据
              let resultJson = rst.data;
              //获取查询的记录
              this.reward = resultJson.data;
              this.jcCount = this.reward.length;
            })
            .catch(() => {});
        this.$axios
            .post("UsersController/restQuery", this.user)
            .then((rst) => {
              //获取响应的数据
              let resultJson = rst.data;
              //获取查询的记录
              this.rest = resultJson.data;
            })
            .catch((err) => {
              this.$message(err.toString());
            });
        this.userNameBkp = this.user.userName;
        this.$axios.post("UsersController/ask3",this.user)
            .then(rst=>{
              let resultJson=rst.data;
              this.signIn=resultJson.data;
            }).catch((err)=>{
          this.$message("拉取签到记录错误" + err.toString());
        })
      }
  },
  methods: {
    doEdit() {
      if (this.user.newPwd !== this.user.rePwd) {
        this.$message("两次密码输入不一致");
      } else if (
        this.user.newPwd === undefined ||
        this.user.oldPwd === undefined
      ) {
        this.$message("密码不能为空");
      } else if (this.user.newPwd.length < 8) {
        this.$message("密码过短");
      } else {
        this.$axios
          .post("UsersController/updatePwd", this.user)
          .then((rst) => {
            let resultJson = rst.data;
            if (resultJson.code === 200) {
              this.$message("修改成功");
              this.displayChangePwd = false;
            } else {
              this.$message("原密码错误，请重新输入");
            }
          })
          .catch((err) => {
            console.log(err);
            this.$message(err);
          });
      }
    },

    doEditInfo() {
      if (!utils.checkEmail(this.user.userEmail)) {
        this.$message("请输入正确的邮箱地址");
      } else {
        this.$axios
          .post("UsersController/update", this.user)
          .then((rst) => {
            let resultJson = rst.data;
            if (resultJson.code === 200) {
              this.$message("修改成功!");
              this.displayChangeInfo = false;
              let str = JSON.stringify(this.user);
              sessionStorage.setItem("info", str);
              this.$emit("info", this.user);
              router.go(0);
            } else {
              this.$message("修改失败!");
            }
          })
          .catch((err) => {
            console.log(err);
            this.$message(err.toString());
          });
      }
    },
    goSignIn(){
      this.$axios.post("UsersController/SignIn", this.user).then(r => {
        const res = r.data;
        if(res.code === 200){
          this.$message("打卡成功!");
        }
        else {
          this.$message("打卡失败");
        }
        router.go(0);
      }
      ).catch((err)=>{
        this.$message(err.toString());
      })
    },
    goRest() {
      if (
        this.my_rest.dis === "" ||
        this.my_rest.t1 === "" ||
        this.my_rest.t2 === ""
      ) {
        this.$message("请完善你的请假信息");
      } else if (Date.parse(this.my_rest.t2) < Date.parse(this.my_rest.t1)) {
        this.$message("销假时间不能早于请假时间");
      } else if (Date.parse(this.my_rest.t1) < Date.now()) {
        this.$message("请假时间早于今天");
      } else {
        this.my_rest.userID = this.user.userID;
        this.$axios
          .post("UsersController/restReg", this.my_rest)
          .catch((err) => {
            this.$message(err.toString());
          });
        this.restApplySuccess = true;
      }
    },
    restSuccessAcknowledge() {
      this.my_rest.dis = "";
      this.my_rest.t1 = "";
      this.my_rest.t2 = "";
      this.restApplySuccess = false;
      router.go(0);
    },
    trans(row) {
      if (row.agree === 1) {
        return "已通过";
      } else if (row.agree === 2) {
        return "未通过";
      } else {
        return "待审批";
      }
    },
    transB(row) {
      if (row.isSignIn === 1) {
        return "是";
      } else {
        return "否";
      }
    },
    say_hi() {
      this.$message(this.user.WName + " ID:" + this.user.userID + say_hi_word());
    },
    changePwd() {
      this.displayChangePwd = true;
    },
    changeInfo() {
      this.displayChangeInfo = true;
    },
    exit() {
      sessionStorage.removeItem("info");
      this.$message("退出登录成功");
      this.$router.push("/login");
    },
  },
};

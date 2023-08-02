import * as utils from "@/views/js/utils";

export default {
  name: "LoginView",
  data() {
    return {
      user: {
        loginName: "",
        loginPwd: "",
        depart: 0,
      },
      RegUser: {
        userName: "",
        userPwd: "",
        confirmPwd: "",
        userSex: 1,
        userEmail: "",
        userBirthday: "1980-01-01",
      },
      forgetParcel: {
        userPwd: "",
        userName: "",
      },
      registerWindow: false,
      registerSuccess: false,
      forgetPassword: false,
      updatePassword: false,
      forgetAccount: "",
      forgetNewPwd: "",
      findExistAccount: {
        userName: "",
      },
      checkCode: "",
      repeatPwd: "",
      lastSendTime: 0,
      acceptTreaty: false,
      accountAvailable: [],
      rewardMsg: [
        "获取公告板失败",
        "蔡徐坤",
        "iKun",
        "2.5",
        "250",
        "验证码0000",
      ],
    };
  },
  created() {
    this.$axios
      .post("UsersController/getBoard")
      .then((rst) => {
        for(let i=0;i<6;i++){
          this.rewardMsg[i] = rst.data.data[i]['userName'] + ' 今日于 ' + rst.data.data[i]['signInTime'] + ' 签到';
        }
      })
      .catch((err) => {
        this.$message("拉取公示板失败" + err.toString());
        console.log(err);
      });
  },
  methods: {
    doLogin() {
      if (this.user.loginName === "") {
        this.$message("用户名不能为空");
        return;
      }
      if (this.user.loginPwd === "") {
        this.$message("用户名不能为空");
        return;
      }
      this.$axios
        .post("UsersController/login", this.user)
        .then((rst) => {
          let info = rst.data.data;
          if (info == null) {
            this.$message("账号密码输入有误或用户类型错选！");
          } else {
            if (info.WID === 1) {
              this.$router.push("/leaveApply");
            } else if (info.WID === 2 || info.WID === 3) {
              this.$router.push("/user");
            } else {
              this.$message("用户类型未指定");
              return;
            }
            //把json对象转为字符串
            let str = JSON.stringify(info);
            //存放到浏览器
            sessionStorage.setItem("info", str);
            this.$message(
              info.WName + " " + info.userName + utils.say_hi_word()
            );
          }
        })
        .catch((err) => {
          this.$message(err.toString());
          console.log(err);
        });
    },
    doRegister() {
      if (this.RegUser.userName.length < 8) {
        if (this.RegUser.userName === "") {
          this.$message("用户名不能为空");
        } else {
          this.$message("账号过短");
        }
        return;
      }
      if (!this.acceptTreaty) {
        this.$message("请阅读并同意用户协议");
        return;
      }
      const msg = utils.password_available(
        this.RegUser.userPwd,
        this.RegUser.confirmPwd
      );
      if (msg === 1) {
        this.$axios
          .post("UsersController/Register", this.RegUser)
          .then(() => {
            this.registerWindow = false;
            this.registerSuccess = true;
          })
          .catch(() => {
            this.$message("用户名已存在");
          });
      } else {
        this.$message(msg.toString());
      }
    },

    forgetPwd() {
      if (this.forgetAccount === "") {
        this.$message("用户名不能为空");
      } else {
        this.forgetParcel.userName = this.forgetAccount;
        if (this.checkCode === "0000") {
          this.forgetPassword = false;
          this.updatePassword = true;
        } else {
          this.$message("验证码错误");
        }
      }
    },
    abortRegister() {
      this.RegUser.userPwd = "";
      this.RegUser.userName = "";
      this.RegUser.confirmPwd = "";
      this.acceptTreaty = false;
    },
    registerSuccessAfter() {
      this.abortRegister();
      this.registerSuccess = false;
    },
    abortForget() {
      this.forgetAccount = "";
      this.checkCode = "";
    },
    sendCode() {
      if (this.forgetAccount === "") {
        this.$message("用户名不能为空");
      } else {
        if (Date.now() - this.lastSendTime < 60000) {
          this.$message(
            "发送过于频繁，请" +
              parseInt(
                ((60000 - (Date.now() - this.lastSendTime)) / 1000).toString()
              ) +
              "秒后再试"
          );
          return;
        }
        this.findExistAccount.userName = this.forgetAccount;
        this.$axios
          .post("UsersController/haveUser", this.findExistAccount)
          .then((rst) => {
            this.accountAvailable = parseInt(rst.data.data[0]["haveUser"]);
          })
          .catch((err) => {
            this.$message("查询用户列表失败" + err.toString());
            console.log(err);
          });
        if (this.accountAvailable === 0) {
          this.$message("用户不存在，请先注册");
        } else if (this.accountAvailable === 1) {
          //发送验证码API
          this.$message("验证码已发送");
          this.lastSendTime = Date.now();
        }
      }
    },
    cancelForget() {
      this.forgetPassword = false;
      this.forgetAccount = "";
      this.checkCode = "";
    },
    updatePwd() {
      const info = utils.password_available(this.forgetNewPwd, this.repeatPwd);
      if (info === 1) {
        this.forgetParcel.userPwd = this.forgetNewPwd;
        this.$axios
          .post("UsersController/forgetParcel", this.forgetParcel)
          .then(() => {
            this.$message("重置密码成功");
            this.completeForget();
          })
          .catch((err) => {this.$message("请求失败 " + err.toString());});
        this.forgetPassword = false;
      } else {
        this.$message(info.toString());
      }
    },
    completeForget(){
      this.forgetNewPwd = '';
      this.repeatPwd = '';
      this.updatePassword = false;
    }
  },
};

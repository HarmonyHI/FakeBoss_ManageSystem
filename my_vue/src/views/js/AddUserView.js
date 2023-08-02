import EditInfoView from "@/views/js/EditInfoView";

export default {
  name: "AddUserView",
  data() {
    return {
      user: {
        userName: "",
        userSex: "1",
        userPwd: "",
        userEmail: "",
        userBirthday: "",
        age: 0,
        WID: "2",
      },
    };
  },
  methods: {
    doSave() {
      if (
        !(
          this.user.userName !== "" &&
          this.user.userBirthday !== "" &&
          this.user.userEmail !== "" &&
          this.user.userSex !== null &&
          this.user.WID !== null
        )
      ) {
        this.$message("请将信息补充完整");
      } else if (!EditInfoView.methods.checkEmail(this.user.userEmail)) {
        this.$message("邮箱格式错误");
      } else {
        this.$axios
          .post("UsersController/save", this.user)
          .then((rst) => {
            let resultJson = rst.data;
            if (resultJson.code === 200) {
              this.$message("添加成功!");
              this.user.userName = "";
              this.user.userPwd = "";
              this.user.userSex = "1";
              this.user.userBirthday = "";
              this.user.userEmail = "";
              this.user.WID = "2";
            } else {
              this.$message("操作失败!");
            }
          })
          .catch((err) => {
            this.$message("拒绝访问或用户已存在 " + err.toString());
          });
      }
    },
  },
};

import EditInfoView from "@/views/js/EditInfoView";

export default {
  name: "SearchUserView",
  data() {
    return {
      user: {
        userName: "",
        userSex: "0",
        userAge: [0, 100],
        maxx: "0",
        minn: "0",
        WID: "0",
      },
      users: [],
      deleteDialogVisible: false,
      param: {},
      editDialogVisible: false,
      editDrawer: false,
      direction: "rtl",
      ids: [],
      showBatchDeleteDialog: false,
      ensureBatchDeleteDialog: false,
    };
  },

  methods: {
    getAge(birth) {
      birth = Date.parse(birth.replace("/-/g", "/"));
      if (birth) {
        const year = 1000 * 60 * 60 * 24 * 365;
        const now = new Date();
        const birthday = new Date(birth);
        return Math.floor((now - birthday) / year);
      }
    },
    doSearch() {
      const backup = this.user.userAge;
      this.user.minn = this.user.userAge[0].toString();
      this.user.maxx = this.user.userAge[1].toString();
      this.user.userAge = null;
      this.$axios
        .post("UsersController/findByParam", this.user)
        .then((rst) => {
          //获取响应的数据
          let resultJson = rst.data;
            //获取查询的记录
            this.users = resultJson.data;
        })
        .catch(() => {});
      this.user.userAge = backup;
    },
    handleSelectionChange(rows) {
      //清空数组中的数据
      this.ids = [];
      //编写el-table选择的行
      for (let i = 0; i < rows.length; i++) {
        //把每一行中的userID添加数组中
        this.ids.push(rows[i].userID);
      }
    },
    showDeleteDialog(row) {
      this.deleteDialogVisible = true;
      this.param = row;
    },
    doDelete() {
      this.deleteDialogVisible = false;
      //构建删除的数据对象
      this.ids = [];
      this.ids.push(this.param.userID);
      //执行批量删除
      this.doDeleteSelect();
    },
    showEditDialog(row) {
      this.editDialogVisible = true;
      this.param = row;
    },
    doEdit() {
      if (this.param.userName === '') {
        this.$message("姓名不能为空");
      } else if (!EditInfoView.methods.checkEmail(this.param.userEmail)) {
          this.$message("邮箱格式错误");
      } else {
        this.$axios.post("UsersController/update", this.param).then((rst) => {
          let resultJson = rst.data;
          if (resultJson.code === 200) {
            this.$message("操作成功!");
            this.editDialogVisible = false;
            this.editDrawer = false;
            //跟新页面数据
            this.doSearch();
          } else {
            this.$message("操作失败!");
          }
        });
      }
    },
    showEditDrawer(row) {
      this.editDrawer = true;
      this.param = row;
    },
    doDeleteSelect() {
      //说明没有选择要删除的数据
      if (this.ids.length === 0) {
        this.$message("请选择要删除的数据");
      } else {
        if (!this.showBatchDeleteDialog) {
          this.showBatchDeleteDialog = true;
        } else if (this.ensureBatchDeleteDialog) {
          this.showBatchDeleteDialog = false;
          this.$axios
            .post("UsersController/delete", this.ids)
            .then((rst) => {
              let resultJson = rst.data;
              if (resultJson.code === 200) {
                this.$message("已删除");
                this.doSearch();
              } else {
                this.$message("操作失败!");
              }
            })
            .catch((err) => {
              console.log(err);
            });
          this.ensureBatchDeleteDialog = false;
        }
      }
    },
  },
};

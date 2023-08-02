<template>
	<div class="container">
    <div class="sm_box">
      <h2>
        添加员工
      </h2>
    </div>
    <div class="sm_box">
      <el-form label-width="120px">
        <el-form-item label="姓名:">
          <el-input placeholder="请输入用户名" v-model="user.userName"></el-input>
        </el-form-item>
          <el-form-item label="初始密码:">
              <el-input v-model="user.userPwd" show-password></el-input>
          </el-form-item>
        <el-form-item label="性别:">
          <el-select v-model="user.userSex" style="width: 100%;">
            <el-option label="男" value="1"></el-option>
            <el-option label="女" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="邮箱:">
          <el-input placeholder="请输入联系邮箱" v-model="user.userEmail"></el-input>
        </el-form-item>
        <el-form-item label="生日:">
          <el-date-picker v-model="user.userBirthday"
                          format="YYYY-MM-DD" value-format="YYYY-MM-DD"
                          style="width: 100%;"></el-date-picker>
        </el-form-item>
        <el-form-item label="职位种类:">
          <el-select v-model="user.WID" style="width: 100%;">
            <el-option label="科研" value="2"></el-option>
            <el-option label="后勤" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button @click="doSave">添加</el-button>
        </el-form-item>
      </el-form>
    </div>
	</div>
</template>

<script type="text/javascript" src="../js/AddUserView.js"></script>

<style>
@import url(../css/mycss.css);
</style>
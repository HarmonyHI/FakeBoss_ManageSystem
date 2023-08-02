<template>
	<div class="container">
    <div class="sm_box">
      <h2>
        编辑信息
      </h2>
    </div>
    <div class="sm_box">
      <el-form label-width="120px" size="large">
        <el-form-item label="用户名:">
          <el-input v-model="user.userName"></el-input>
        </el-form-item>
        <el-form-item label="性别:">
          <el-select v-model="user.userSex" style="width: 100%;">
            <el-option label="女" :value="0"></el-option>
            <el-option label="男" :value="1"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="邮箱:">
          <el-input v-model="user.userEmail"></el-input>
        </el-form-item>
        <el-form-item label="生日:">
          <el-date-picker v-model="user.userBirthday" type="date"  style="width: 100%;"
                          format="YYYY-MM-DD" value-format="YYYY-MM-DD" ></el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button @click="doEdit">修改</el-button>
        </el-form-item>
      </el-form>
    </div>
	</div>
</template>

<script type="text/javascript" src="../js/EditInfoView.js"></script>

<style>
@import url(../css/mycss.css);
</style>
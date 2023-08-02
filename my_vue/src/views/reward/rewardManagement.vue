<template>
  <div id="infoContainer">
    <div class="sm_box">
      <h2>
        添加奖惩
      </h2>
    </div>
    <div class="sm_box">
      <el-form label-width="120px">
        <el-form-item label="员工ID:">
          <el-input placeholder="请输入员工ID" v-model="jc.userID" ></el-input>
        </el-form-item>
        <el-form-item label="时间:">
          <el-date-picker
              format="YYYY-MM-DD" value-format="YYYY-MM-DD"
              style="width: 100%;" v-model="jc.jcTime"></el-date-picker>
        </el-form-item>
        <el-form-item label="改变金额:">
          <el-input placeholder="请输入改变金额" v-model="jc.jcMoney"></el-input>
        </el-form-item>
        <el-form-item label="原因:">
          <el-input placeholder="请输入奖惩原因" v-model="jc.jcDis"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="doSaveReward">上传</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script type="text/javascript" src="../js/rewardManagement.js"></script>

<style>
@import url(../css/mycss.css);
</style>
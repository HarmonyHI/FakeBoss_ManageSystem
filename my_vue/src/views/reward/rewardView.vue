<template>
  <div class="container">
    <div class="sm_box">
      <h2>
        奖惩概览
      </h2>
    </div>
    <div class="searchContent">
      <el-form label-width="120px">
        <el-form-item label="员工ID:">
          <el-input v-model="user.userID" placeholder="输入员工ID"></el-input>
            <el-button type="primary" @click="doSearch" style="position: absolute; left: 350px">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="boader">
      <div class="searchResult" style="min-width: 700px">
        <el-table :data="reward" border stripe>
            <el-table-column label="员工姓名" prop="userName"></el-table-column>
            <el-table-column label="职位" prop="WName"></el-table-column>
          <el-table-column label="时间" prop="jcTime"></el-table-column>
          <el-table-column label="金额" prop="jcMoney"></el-table-column>
          <el-table-column label="描述" prop="jcDis"></el-table-column>
        </el-table>
      </div>
    </div>
  </div>

</template>

<script type="text/javascript" src="../js/rewardView.js"></script>

<style>
@import url(../css/mycss.css);
</style>
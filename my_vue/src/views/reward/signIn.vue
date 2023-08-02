<template>
  <div class="container">
    <div class="sm_box">
      <h2>签到管理</h2>
    </div>
    <MobileConfig/>
    <div class="searchContent">
      <el-form label-width="120px">
        <el-form-item label="员工ID:">
          <el-input
            placeholder="输入员工ID"
            v-model="this.user.userID"
          ></el-input>
          <el-button
            type="primary"
            @click="doSearch"
            style="position: absolute; left: 350px"
            >查询</el-button
          >
        </el-form-item>
      </el-form>
    </div>
    <div style="margin-left: 20px; min-width: 700px">
      <div class="boader" style="margin-left: 50px">
        <el-row :gutter="20" :data="dataArr">
          <el-col :span="8" style="margin-bottom: 20px">
            <div>
              <el-statistic title="未打卡" :value="pageData[0]" />
            </div>
          </el-col>
          <el-col :span="8">
            <div>
              <el-statistic title="签到未签退" :value="pageData[1]" />
            </div>
          </el-col>
          <el-col :span="8">
            <div>
              <el-statistic title="已签退" :value="pageData[2]" />
            </div>
          </el-col>
          <el-col :span="8">
            <div>
              <el-statistic title="迟到" :value="pageData[3]" />
            </div>
          </el-col>
          <el-col :span="8">
            <div>
              <el-statistic title="早退" :value="pageData[4]" />
            </div>
          </el-col>
          <el-col :span="8">
            <div>
              <el-statistic title="正常出勤" :value="pageData[5]" />
            </div>
          </el-col>
        </el-row>
      </div>
      <div class="boader">
        <div class="searchResult">
          <el-table border stripe :data="signIn">
            <el-table-column
              label="员工ID"
              prop="userID"
              sortable
            ></el-table-column>
            <el-table-column
              label="员工姓名"
              prop="userName"
              sortable
            ></el-table-column>
            <el-table-column
              label="职位"
              prop="WName"
              sortable
            ></el-table-column>
            <el-table-column label="是否签到" sortable prop="isSignIn">
              <template #default="scope">
                {{ scope.row.isSignIn === 1 ? "是" : "否" }}
              </template>
            </el-table-column>
            <el-table-column
              label="今日首次打卡"
              prop="signInTime"
              sortable
              width="150px"
            ></el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>

<script type="text/javascript" src="../js/signIn.js"></script>

<style>
@import url(../css/mycss.css);
</style>

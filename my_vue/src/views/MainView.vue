<template>
  <div class="mainContainer">
    <div class="top">
        <div class="top_0">
            <div class="boader">
                <h1 class="myh1">山寨公司人员管理系统</h1>
            </div>
        </div>
      <div class="top_1">
        <el-menu class="el-menu-demo" mode="horizontal">
            <el-menu-item index="1" @click="this.$router.push('/leaveApply')"><el-icon><edit /></el-icon>请假审批</el-menu-item>
            <el-menu-item index="2" @click="this.$router.push('/signIn')"><el-icon><edit /></el-icon>签到管理</el-menu-item>

          <el-sub-menu index="3">
            <template #title><el-icon><comment /></el-icon>奖惩系统</template>
            <el-menu-item index="3-1" @click="this.$router.push('/rewardView')">奖惩概览</el-menu-item>
            <el-menu-item index="3-2" @click="this.$router.push('/rewardManagement')">新增奖惩</el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="4">
            <template #title><el-icon><User /></el-icon>员工管理</template>
            <el-menu-item index="4-1" @click="this.$router.push('/addUser')">添加员工</el-menu-item>
            <el-menu-item index="4-2" @click="this.$router.push('/searchUser')">员工概览</el-menu-item>
          </el-sub-menu>

        </el-menu>
      </div>
      <div class="top_2">
        <el-dropdown style="margin-right: 20px;margin-top: 3px">
          <span>
            {{ user.WName }}&nbsp;{{ user.userName }}
            <el-icon class="el-icon--right">
              <arrow-down />
            </el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item @click="this.pressInfo = true"
                >我的信息</el-dropdown-item
              >
              <el-dropdown-item @click="this.$router.push('/editInfo')">
                编辑信息
              </el-dropdown-item>
              <el-dropdown-item @click="this.$router.push('/editPwd')">
                修改密码
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
        <router-link to="#" @click="exit" class="main_text">退出</router-link>
      </div>
    </div>
    <div class="center">
      <div>
        <router-view @info="changeInfo"></router-view>
      </div>
    </div>
    <div class="bottom">SPRING&nbsp;20230507</div>
  </div>
  <el-dialog v-model="this.pressInfo" width="500px" title="我的信息">
    <el-form label-width="120px">
      <el-form-item label="编号:">
        {{ user.userID }}
      </el-form-item>
      <el-form-item label="用户名:">
        {{ user.userName }}
      </el-form-item>
      <el-form-item label="性别:">
        {{ user.userSex === 1 ? "男" : "女" }}
      </el-form-item>
      <el-form-item label="邮箱:">
        {{ user.userEmail == null ? "未填" : user.userEmail }}
      </el-form-item>
      <el-form-item label="生日:">
        {{ user.userBirthday }}
      </el-form-item>
      <el-form-item label="职位:">
        {{ user.WID === 1 ? "经理" : user.WID === 2 ? "科研" : "后勤" }}
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script type="text/javascript" src="./js/MainView.js"/>

<style>
@import url(./css/mycss.css);
@import url(./css/MainView.css);
</style>

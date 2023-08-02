<template>
  <div id="loginScreen">
      <div class="loginBlock">
          <h2 class="loginBlockH2" style="margin-left: 40px">考勤公示板</h2>
          <hr style="margin-left: 40px; margin-bottom:15px; max-width: 100%; ">
          <h3 class="loginBlockH3">{{rewardMsg[0]}}</h3>
          <h3 class="loginBlockH3">{{rewardMsg[1]}}</h3>
          <h3 class="loginBlockH3">{{rewardMsg[2]}}</h3>
          <h3 class="loginBlockH3">{{rewardMsg[3]}}</h3>
          <h3 class="loginBlockH3">{{rewardMsg[4]}}</h3>
          <h3 class="loginBlockH3">{{rewardMsg[5]}}</h3>
      </div>
      <div id="loginContent">
          <h2 class="loginBlockH2" style="margin-left: 40px">登录</h2>
      <el-form label-width="120px" size="large">
        <el-form-item class="loginItemWhite" label="账号:">
          <el-input placeholder="用户名或邮箱" v-model="user.loginName"></el-input>
        </el-form-item>
        <el-form-item class="loginItemWhite" label="密码:">
          <el-input show-password placeholder="请输入密码" v-model="user.loginPwd"></el-input>
        </el-form-item>
        <el-form-item class="loginItemWhite" label="职位:">
          <el-select v-model="user.depart" style="max-width: 170px">
            <el-option label="员工" :value="0"></el-option>
            <el-option label="经理" :value="1"></el-option>
          </el-select>
          <el-button
            type="primary"
            color="pink"
            style="min-width: 170px; margin-left: 40px"
            @click="doLogin"
            >登录</el-button
          >
        </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item>
          <div id="loginBottom">
            <router-link to="#" @click="this.forgetPassword = true"
              >忘记密码</router-link
            >
            <el-space style="color: #ffffff">|</el-space>
              <router-link to="#" @click="this.registerWindow = true"
              >经理注册</router-link
              >
          </div>
        </el-form-item>
      </el-form>
    </div>
  </div>
    <el-dialog v-model="this.forgetPassword" @close="abortForget" title="忘记密码" width=450px>
        <div id="editContent" style="max-width: 350px; margin-left: 25px">
            <el-form label-width="80px">
        <el-form-item label="登录名:">
            <el-input v-model="this.forgetAccount"></el-input>
        </el-form-item>
        <el-form-item label="验证码:">
            <el-input v-model="this.checkCode" style="max-width: 130px"></el-input>
            <el-button style="margin-left: 35px" @click="sendCode">发送验证码</el-button>
        </el-form-item>
            </el-form>
        </div>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="cancelForget">取消</el-button>
        <el-button type="primary" @click="forgetPwd" color="pink"> 确定 </el-button>
      </span>
        </template>
    </el-dialog>
    <el-dialog v-model="registerSuccess" @click="registerSuccessAfter">
        <el-result
                icon="success"
                title="注册成功"
                subTitle="稍后请选择经理身份进行登录"
        />
    </el-dialog>
    <el-dialog v-model="this.registerWindow" @close="abortRegister" title="经理注册" width=600px>
        <el-form label-width="120px" size="large" style="max-width: 500px">
            <el-form-item class="loginItem" label="账号:">
                <el-input placeholder="账号/邮箱" v-model="RegUser.userName"></el-input>
            </el-form-item>
            <el-form-item class="loginItem" label="密码:">
                <el-input
                        show-password
                        placeholder="登录密码"
                        v-model="RegUser.userPwd"
                ></el-input>
            </el-form-item>
            <el-form-item class="loginItem" label="确认密码:">
                <el-input
                        show-password
                        placeholder="确认密码"
                        v-model="RegUser.confirmPwd"
                ></el-input>
            </el-form-item>

            <el-form-item>
                <el-checkbox v-model="acceptTreaty" style="margin-bottom: 14px">
                    我已阅读并同意
                    <el-link style="margin-left: 1px;margin-bottom: 2px" :underline="false" target="_blank" href="http://www.npc.gov.cn/npc/c30834/201901/ffad2d4ae4da4585a041abf66e74753c.shtml">
                        《缺德公司用户管理系统不平等协议》
                    </el-link>
                </el-checkbox>
                <el-button type="primary" style="width: 170px;margin-left: 70px;" @click="doRegister" color="pink">注册</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>
  <el-dialog v-model="this.updatePassword" title="设置新密码" width="30%">
    <div id="editContent" style="max-width: 350px; margin-left: 25px">
      <el-form label-width="80px">
        <el-form-item label="新密码:">
          <el-input v-model="this.forgetNewPwd" show-password></el-input>
        </el-form-item>
        <el-form-item label="确认密码:">
          <el-input v-model="this.repeatPwd" show-password></el-input>
        </el-form-item>
      </el-form>
    </div>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="completeForget">取消</el-button>
        <el-button type="primary" @click="updatePwd" color="pink"> 确定 </el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script type="text/javascript" src="./js/LoginView.js"></script>

<style>
@import url(./css/mycss.css);
@import url(./css/LoginView.css);

</style>

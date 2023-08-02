<template>
  <div class="mainContainer">
    <div class="top">
        <div class="top_0">
            <div class="boader">
                <h1 class="myh1">员工个人页面</h1>
            </div>
        </div>

      <div class="top_2">
        <router-link to="#" class="main_text" @click="say_hi">
          {{user.WName}}&nbsp;{{ this.userNameBkp }}
        </router-link>
        <router-link to="#" class="main_text" @click="changePwd">
          修改密码
        </router-link>
        <router-link to="#" class="main_text" @click="changeInfo">
          编辑个人信息
        </router-link>
        <router-link to="#" class="main_text" @click="exit"> 退出 </router-link>
      </div>
    </div>
    <div class="center">
      <div class="a_blk">
        <div class="bg_box">
          <div class="boader_bg">
            <button class="big_btn_orange" @click="goSignIn">
              立&nbsp;&nbsp;&nbsp;即&nbsp;&nbsp;&nbsp;打&nbsp;&nbsp;&nbsp;卡
            </button>
          </div>
          <div class="boader_bg">
                  <h2>打卡记录</h2>
                  <div class="searchResult">
                      <el-table :data="signIn" max-height="140">
                          <el-table-column label="今日首次签到时间" prop="signInTime"></el-table-column>
                          <el-table-column label="是否按时打卡" prop="isSignIn" :formatter="transB"></el-table-column>
                          <el-table-column label="打卡次数" prop="出勤次数"></el-table-column>

                      </el-table>
                  </div>
            <h2>我的奖惩情况</h2>
              <div class="square_context_round">
                <div class="el-autocomplete">
                  <p>{{ "目前共有" + this.jcCount + "条奖惩信息" }}</p>
                </div>
              </div>
              <div class="searchResult">
                <el-table :data="reward" border stripe max-height="250" style="max-width: 470px">
                  <el-table-column label="时间" prop="jcTime"></el-table-column>
                  <el-table-column
                    label="金额"
                    prop="jcMoney"
                  ></el-table-column>
                  <el-table-column label="描述" prop="jcDis"></el-table-column>
                </el-table>
              </div>

          </div>
        </div>
      </div>
      <div class="b_blk">
        <div class="bg_box">
          <div class="boader_bg">
            <button class="big_btn" @click="goRest">
              马&nbsp;&nbsp;&nbsp;上&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;假
            </button>
          </div>
        </div>
        <div class="bg_box">
          <div class="boader_bg">
            <div class="square_inputs_round">
              <el-form label-width="100px" style="margin-left: 20px">
                <el-form-item label="请假理由:">
                  <el-input
                    v-model="my_rest.dis"
                    clearable
                    style="width: 80%"
                  ></el-input>
                </el-form-item>
                <el-form-item label="开始时间:">
                  <el-date-picker
                    v-model="my_rest.t1"
                    format="YYYY-MM-DD"
                    value-format="YYYY-MM-DD"
                    style="width: 80%"
                  ></el-date-picker>
                </el-form-item>
                <el-form-item label="结束时间:">
                  <el-date-picker
                    v-model="my_rest.t2"
                    format="YYYY-MM-DD"
                    value-format="YYYY-MM-DD"
                    style="width: 80%"
                  ></el-date-picker>
                </el-form-item>
              </el-form>
            </div>
          </div>
        </div>
          <div class="boader_bg">
              <h2>我的请假记录</h2>
              <div class="boader">
                  <div id="searchResult">
                      <el-table :data="rest" border stripe style="max-width: 600px">
                          <el-table-column label="开始日期" prop="t1"></el-table-column>
                          <el-table-column label="结束日期" prop="t2"></el-table-column>
                          <el-table-column
                                  label="请假理由"
                                  prop="dis"
                          ></el-table-column>
                          <el-table-column
                                  label="审批情况"
                                  prop="agree"
                                  :formatter="trans"
                          ></el-table-column>
                      </el-table>
                  </div>
              </div>
          </div>
      </div>
    </div>
    <div class="bottom">SPRING_DEMO&nbsp;20230507</div>
  </div>

  <el-dialog v-model="displayChangePwd" width="400px" title="修改密码">
    <el-form label-width="100px">
      <el-row>
        <el-form-item label="原始密码:">
          <el-input show-password v-model="user.oldPwd"></el-input>
        </el-form-item>
      </el-row>
      <el-row>
        <el-form-item label="新密码:">
          <el-input show-password v-model="user.newPwd"></el-input>
        </el-form-item>
      </el-row>

      <el-row>
        <el-form-item label="确认密码:">
          <el-input show-password v-model="user.rePwd"></el-input>
        </el-form-item>
      </el-row>

      <el-row>
        <el-form-item>
          <el-button
            type="primary"
            @click="doEdit"
            round
            style="min-width: 200px"
            >&nbsp;修改&nbsp;</el-button
          >
        </el-form-item>
      </el-row>
    </el-form>
  </el-dialog>
  <el-dialog v-model="displayChangeInfo" width="600px" title="编辑个人信息">
    <div class="sm_box">
      <el-form label-width="120px" size="large">
        <el-form-item label="姓名:">
          <el-input clearable v-model="user.userName"></el-input>
        </el-form-item>
        <el-form-item label="性别:">
          <el-select v-model="user.userSex" style="width: 100%">
            <el-option label="女" :value="2"></el-option>
            <el-option label="男" :value="1"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item clearable label="邮箱:">
          <el-input v-model="user.userEmail"></el-input>
        </el-form-item>
        <el-form-item label="生日:">
          <el-date-picker
            v-model="user.userBirthday"
            type="date"
            style="width: 100%"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
          ></el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            round
            @click="doEditInfo"
            style="min-width: 280px"
            >修改</el-button
          >
        </el-form-item>
      </el-form>
    </div>
  </el-dialog>
  <el-dialog v-model="restApplySuccess" @close="restSuccessAcknowledge">
    <el-result
      icon="success"
      title="请假审批已提交"
      subTitle="请等待经理审核"
    />
  </el-dialog>
</template>

<script type="text/javascript" src="./js/UserView.js"></script>

<style>
@import url(./css/mycss.css);
</style>

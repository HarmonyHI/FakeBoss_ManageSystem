<template>
  <div id="infoContainer">
    <div class="sm_box">
      <h2>待审批</h2>
    </div>
    <div class="boader">
      <div id="searchResult">
        <div class="boader">
          <div id="btnContent">
            <el-button type="primary" @click="check">刷新</el-button>
            <el-button type="primary" @click="showBatchApplyDialog">通过</el-button>
            <el-button type="danger" @click="showBatchDenyDialog">拒绝</el-button>
          </div>
        </div>
        <div class="boader">
          <el-table
            :data="rests"
            border
            stripe
            @selection-change="handleSelectionChange"
          >
            <el-table-column fixed type="selection" width="55" />
            <el-table-column
              label="请假ID"
              prop="idx"
              width="90px"
            ></el-table-column>
            <el-table-column
              label="员工ID"
              prop="userID"
              sortable
              width="110px"
            ></el-table-column>
            <el-table-column
              label="姓名"
              prop="userName"
              width="80px"
            ></el-table-column>
            <el-table-column
              label="职位"
              prop="Wname"
              width="80px"
            ></el-table-column>
            <el-table-column
              label="请假理由"
              prop="dis"
              width="120"
            ></el-table-column>
            <el-table-column
              label="开始日期"
              prop="t1"
              sortable
              width="120"
            ></el-table-column>
            <el-table-column
              label="结束日期"
              prop="t2"
              sortable
              width="120"
            ></el-table-column>
            <el-table-column fixed="right" label="操作" width="110px">
              <template #default="scope">
                <el-link @click="showApplyDialog(scope.row)">通过</el-link>
                <el-link @click="showDenyDialog(scope.row)">拒绝</el-link>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
  <div id="infoContainer">
    <div class="sm_box">
      <h2>已审批</h2>
    </div>
    <div class="boader">
      <div id="searchResult">
        <div class="boader">
          <el-table
            :data="hisRests"
            border
            stripe
            @selection-change="handleSelectionChange"
          >
              <el-table-column
                      fixed
                      label="请假ID"
                      prop="idx"
                      sortable
                      width="110px"
              ></el-table-column>
            <el-table-column
              fixed
              label="员工ID"
              prop="userID"
              sortable
              width="100"
            ></el-table-column>
            <el-table-column label="姓名" prop="userName"></el-table-column>
            <el-table-column label="职位" prop="Wname"></el-table-column>
            <el-table-column label="请假理由" prop="dis" width="120"></el-table-column>
            <el-table-column
              label="开始日期"
              prop="t1"
              width="120"
              sortable
            ></el-table-column>
            <el-table-column
              label="结束日期"
              prop="t2"
              width="120"
              sortable
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
  <el-dialog v-model="applyDialogVisible" title="提示" width="30%">
    <span>是否通过该申请?</span>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="applyDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ensureApplyDialog()">确定</el-button>
      </span>
    </template>
  </el-dialog>

  <el-dialog v-model="denyDialogVisible" title="提示" width="30%">
    <span>是否拒绝该申请?</span>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="denyDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ensureDenyDialog()">确定</el-button>
      </span>
    </template>
  </el-dialog>

  <el-dialog v-model="applyBatchDialogVisible" title="提示" width="30%">
    <span>是否通过所选申请?</span>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="applyBatchDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ensureBatchApplyDialog()"
          >确定</el-button
        >
      </span>
    </template>
  </el-dialog>

  <el-dialog v-model="denyBatchDialogVisible" title="提示" width="30%">
    <span>是否拒绝所选申请?</span>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="denyBatchDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ensureBatchDenyDialog()"
          >确定</el-button
        >
      </span>
    </template>
  </el-dialog>
</template>

<script type="text/javascript" src="../js/leaveApply.js"></script>

<style scoped></style>

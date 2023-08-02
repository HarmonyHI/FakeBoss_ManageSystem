<template>
	<div class="container">
    <div class="sm_box">
      <h2>
        员工概览
      </h2>
    </div>
		<div class="searchContent">
			<el-form label-width="200px">
				<el-form-item label="用户姓名:">
					<el-input placeholder="支持模糊查询" v-model="user.userName"/>
				</el-form-item>
				<el-form-item label="职位:">
					<el-select v-model="user.WID">
						<el-option label="所有" value="0"/>
						<el-option label="科研" value="2"/>
						<el-option label="后勤" value="3"/>
					</el-select>
				</el-form-item>
				<el-form-item label="性别:">
					<el-select v-model="user.userSex">
						<el-option label="所有" value="0"/>
						<el-option label="男" value="1"/>
						<el-option label="女" value="2"/>
					</el-select>
				</el-form-item>
				<el-form-item label="年龄范围:">
					<el-slider class="left_nbsp" v-model="user.userAge" range/>
				</el-form-item>
				<el-form-item>
					<el-button @click="doSearch">查询</el-button>
				</el-form-item>
			</el-form>
		</div>
    <div>
      <div class="searchResult">
        <div class="boader">
          <div id="btnContent">
            <el-button type="danger" @click="doDeleteSelect">批量删除</el-button>
          </div>
        </div>
        <el-table :data="users" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" />
          <el-table-column label="编号" prop="userID" sortable></el-table-column>
          <el-table-column label="姓名" prop="userName"></el-table-column>
          <el-table-column label="性别">
            <template #default="scope">
              {{scope.row.userSex===1?'男':'女'}}
            </template>
          </el-table-column>
					<el-table-column label="年龄" sortable>
						<template #default="scope">
							{{getAge(scope.row.userBirthday)}}
						</template>
					</el-table-column>
					<el-table-column label="职位" prop="WName"></el-table-column>
          <el-table-column label="邮箱" prop="userEmail"></el-table-column>
          <el-table-column label="操作" width="100">
            <template #default="scope">
              <router-link to="#"  class="main_text" @click="showEditDialog(scope.row)">编辑</router-link>
              <router-link to="#" class="main_text" @click="showDeleteDialog(scope.row)">删除</router-link>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
  </div>
	<el-dialog v-model="deleteDialogVisible" title="提示" width="30%">
		<span>删除员工【{{param.userName}}】吗?</span>
		<template #footer>
			<span class="dialog-footer">
				<el-button @click="deleteDialogVisible = false">取消</el-button>
				<el-button type="primary" @click="doDelete">
					确定
				</el-button>
			</span>
		</template>
	</el-dialog>
	<el-dialog v-model="showBatchDeleteDialog" title="提示" width="30%">
		<span>删除所选员工吗?</span>
		<template #footer>
			<span class="dialog-footer">
				<el-button @click="showBatchDeleteDialog = false">取消</el-button>
				<el-button type="primary" @click="ensureBatchDeleteDialog = true;doDeleteSelect()">
					确定
				</el-button>
			</span>
		</template>
	</el-dialog>
	<el-dialog v-model="editDialogVisible" title="编辑" width="30%">
		<div id="editContent" style="max-width: 300px">
			<el-form label-width="80px">
				<el-form-item label="姓名:">
					<el-input v-model="param.userName"></el-input>
				</el-form-item>
				<el-form-item label="性别:">
					<el-select v-model="param.userSex">
						<el-option label="男" :value="1"></el-option>
						<el-option label="女" :value="2"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item label="邮箱:">
					<el-input v-model="param.userEmail"></el-input>
				</el-form-item>
			</el-form>
		</div>
		<template #footer>
			<span class="dialog-footer">
				<el-button @click="editDialogVisible = false">取消</el-button>
				<el-button type="primary" @click="doEdit">
					确定
				</el-button>
			</span>
		</template>
	</el-dialog>
</template>

<script type="text/javascript" src="../js/SearchUserView.js"></script>

<style>
  @import url(../css/mycss.css);
</style>

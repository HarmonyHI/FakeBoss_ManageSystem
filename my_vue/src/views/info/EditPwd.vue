<template>
	<div class="container">
    <div class="sm_box">
      <h2>
        修改密码
      </h2>
    </div>
		<div class="sm_box">
			<el-form label-width="120px" size="large">
				<el-form-item label="原始密码:">
					<el-input show-password v-model="user.oldPwd"></el-input>
				</el-form-item>
				<el-form-item label="新密码:">
					<el-input show-password v-model="user.newPwd"></el-input>
				</el-form-item>
				<el-form-item label="确认密码:">
					<el-input show-password v-model="user.rePwd"></el-input>
				</el-form-item>
				<el-form-item>
					<el-button @click="doEdit">修改</el-button>
				</el-form-item>
			</el-form>
		</div>

	</div>
</template>

<script type="text/javascript" src="../js/EditPwd.js"></script>


<style>
@import url(../css/mycss.css);
</style>
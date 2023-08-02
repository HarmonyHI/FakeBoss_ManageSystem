export default {
    name: 'leaveView',
    data() {
        return {
            rest: {},
            rests: [],
            hisRest: {},
            hisRests:[],
            leaveIdxArr: [],
            param: {},
            applyDialogVisible: false,
            denyDialogVisible: false,
            applyBatchDialogVisible: false,
            denyBatchDialogVisible: false,
            ava: true
        }
    },
    created(){
        this.getData()
    },
    methods: {
        check() {
            this.getData()
        },
        getData(){
            this.$axios.post("UsersController/whoRest0", this.rest).then(resp => {
                let resoutJSON = resp.data;
                this.rests = resoutJSON.data;
                if (resoutJSON.code === 200) {

                }

            })
            this.$axios.post("UsersController/whoRest12", this.hisRest).then(resp => {
                let resoutJSON = resp.data;
                this.hisRests = resoutJSON.data;
                if (resoutJSON.code === 200) {

                }

            })
        },
        handleSelectionChange(rows) {
            //清空数组中的数据
            this.leaveIdxArr = [];
            //编写el-table选择的行
            for (let i = 0; i < rows.length; i++) {
                this.leaveIdxArr.push(rows[i].idx);
            }
        },
        showApplyDialog(row) {
                this.applyDialogVisible = true;
                this.param = row;
        },
        showBatchApplyDialog(row) {
            if (this.leaveIdxArr.length === 0) {
                this.$message("未选择数据");
            }
            else{
                this.applyBatchDialogVisible = true;
            }
        },
        ensureApplyDialog() {
            this.applyDialogVisible = false;
            this.leaveIdxArr.push(this.param.idx);
            this.apply();
        },
        ensureBatchApplyDialog() {
            this.applyBatchDialogVisible = false;
            this.apply();
        },
        apply() {
            let _this = this;
            if (this.leaveIdxArr.length === 0) {
                this.$message("未选择数据");
            }
            else {
                console.log(this.leaveIdxArr);//这个地方修改删除的ajax
                this.$axios.post("UsersController/restAgree",this.leaveIdxArr)
                    .then(function(resp){
                        let resoutJSON = resp.data;
                        if(resoutJSON.code===200){
                            _this.$message("已完成");
                            _this.check();
                        }else{

                        }
                    })
            }
            this.leaveIdxArr = [];
        },
        showDenyDialog(row) {
                this.denyDialogVisible = true;
                this.param = row;
        },
        showBatchDenyDialog(row) {
            if (this.leaveIdxArr.length === 0) {
                this.$message("未选择数据");
            }
            else{
                this.denyBatchDialogVisible = true;
            }
        },
        ensureDenyDialog() {
            this.denyDialogVisible = false;
            this.leaveIdxArr.push(this.param.idx);
            this.deny();
        },
        ensureBatchDenyDialog() {
            this.denyBatchDialogVisible = false;
            this.deny();
        },
        deny() {
            let _this = this;
                this.$axios.post("UsersController/restDisAgree",this.leaveIdxArr)
                    .then(function(resp){
                        let resoutJSON = resp.data;
                        if(resoutJSON.code===200){
                            _this.$message("已完成");
                            _this.check();
                        }else{

                        }
                    })
            this.leaveIdxArr = [];
        },
        trans(row){
            if(row.agree === 0){
                return '待审批';
            }
            else if(row.agree === 1){
                return '已通过';
            }
            else {
                return '已拒绝';
            }
        }
    }
}

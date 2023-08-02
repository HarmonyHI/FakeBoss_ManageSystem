package com.asrc.mybatis.service;

import com.asrc.mybatis.mapper.UsersMapper;
import com.asrc.mybatis.util.ResultJson;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {
    //注入操作，不需要new、
    @Resource
    private UsersMapper usm;


    //------------------------------------------------------------------------

    // 0 - 用户注册
    public ResultJson SXHSB(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.SXHNB(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }


    // 0 - 更新密码
    public ResultJson doUpdatePwd(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.updatePwd(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }

    // 1 - 登录查询
    public ResultJson login(Map<String, String> m1) {
        ResultJson res = new ResultJson();
        Map<String, Object> m2 = usm.login(m1);
        res.success(m2);
        return res;
    }


    //------------------------------------------------------------------------


    // 2 - 添加员工
    public ResultJson doSave(Map<String, String> map) {
        ResultJson res = new ResultJson();
        if (map.get("WID").equals("1"))
            map.put("depart", "1");
        else
            map.put("depart", "0");
        int row = usm.save(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }

    // 3 - 查询员工
    public ResultJson findByParam(Map<String, String> map) {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.findByParam(map);
        res.success(list);
        return res;
    }


    // 4 - 修改员工
    public ResultJson doUpdate(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.update(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }


    // 5 - 删除员工
    public ResultJson doDelete(String[] ids) {
        ResultJson res = new ResultJson();
        int row = usm.delete(ids);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }


    //------------------------------------------------------------------------


    // 6 - 请假人员查询
    public ResultJson findSleeper(Map<String, String> map) {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.sleep(map);
        res.success(list);
        return res;
    }

    public ResultJson findSleeper0(Map<String, String> map) {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.sleep0(map);
        res.success(list);
        return res;
    }

    public ResultJson findSleeper12(Map<String, String> map) {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.sleep12(map);
        res.success(list);
        return res;
    }


    // 6 - 部门审批
    public ResultJson Agree(String[] ids) {
        ResultJson res = new ResultJson();
        //mode 模式      1代表批量同意      2代表批量否定
        int row = usm.restAgree(ids);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }

    public ResultJson DisAgree(String[] ids) {
        ResultJson res = new ResultJson();
        //mode 模式      1代表批量同意      2代表批量否定
        int row = usm.restDisAgree(ids);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }


    //------------------------------------------------------------------------


    // 7 - 奖惩登记
    public ResultJson jcCin(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.jcRegister(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }

    // 8 - 奖惩查询
    public ResultJson jcFind(Map<String, String> map) {
        ResultJson res = new ResultJson();
        System.out.println(map.toString());
        List<Map<String, Object>> list = usm.jcQuery(map);
        res.success(list);
        return res;
    }


    //------------------------------------------------------------------------


    // 9 - 请假登记
    public ResultJson restReg(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.restReg(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }


    // 10 - 请假查询
    public ResultJson restQuery(Map<String, String> map) {
        ResultJson res = new ResultJson();
        System.out.println(map.toString());
        List<Map<String, Object>> list = usm.restQuery(map);
        res.success(list);
        return res;
    }


    // 11 - 用户存在查询
    public ResultJson findUser(Map<String, String> map) {
        ResultJson res = new ResultJson();
        System.out.println(map.toString());
        List<Map<String, Object>> list = usm.findUser(map);
        res.success(list);
        return res;
    }


    //------------------------------------------------------------------------

    // 12 - 纵览 · 打卡    在岗、下班、未签到
    public ResultJson ask1() {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.ask1();
        res.success(list);
        return res;
    }

    // 13 - 纵览 · 出勤    迟到、早退、正常
    public ResultJson ask2() {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.ask2();
        res.success(list);
        return res;
    }

    // 14 - 出勤查询        指定员工/全体员工
    public ResultJson ask3(Map<String, String> map) {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.ask3(map);
        res.success(list);
        return res;
    }

    //  15 - 打卡上班
    public ResultJson SignIn(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.signIn(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }

    // 16 - 修改密码
    public ResultJson forgetParcel(Map<String, String> map) {
        ResultJson res = new ResultJson();
        int row = usm.forgetParcel(map);
        if (row > 0) {
            res.success();
        } else {
            res.fail();
        }
        return res;
    }

    // 17 - 获取公告板
    public ResultJson getBoard() {
        ResultJson res = new ResultJson();
        List<Map<String, Object>> list = usm.getBoard();
        res.success(list);
        return res;
    }
}

















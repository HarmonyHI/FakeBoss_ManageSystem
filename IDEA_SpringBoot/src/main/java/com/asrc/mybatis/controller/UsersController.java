package com.asrc.mybatis.controller;

import com.asrc.mybatis.service.UserService;
import com.asrc.mybatis.util.ResultJson;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

//允许跨域访问
@CrossOrigin("*")
//表示控制器返回的数据是数据，而不是页面名称
@RestController
//设置该控制器中方法的访问目录，虚拟目录
@RequestMapping("/UsersController")
public class UsersController {

    @Resource
    private UserService usv;

    //----------------------------------------------------------------------------------------------------------

    // 0 - 用户注册
    @RequestMapping("/Register")
    public ResultJson SXH2B(@RequestBody Map<String, String> map) {
        return usv.SXHSB(map);
    }


    // 0 - 更新密码
    @RequestMapping("/updatePwd")
    public ResultJson updatePwd(@RequestBody Map<String, String> map) {
        return usv.doUpdatePwd(map);
    }


    // 1 - 登录查询
    @RequestMapping("/login")
    public ResultJson login(@RequestBody Map<String, String> map) {
        return usv.login(map);
    }

    //------------------------------------------------------------------------------------------------------------


    // 2 - 添加员工
    @RequestMapping("/save")
    public ResultJson save(@RequestBody Map<String, String> map) {
        return usv.doSave(map);
    }


    // 3 - 查询员工
    @RequestMapping("/findByParam")
    public ResultJson findByParam(@RequestBody Map<String, String> map) {
        return usv.findByParam(map);
    }


    // 4 - 修改员工
    @RequestMapping("/update")
    public ResultJson update(@RequestBody Map<String, String> map) {
        return usv.doUpdate(map);
    }


    // 5 - 删除员工
    @RequestMapping("/delete")
    public ResultJson delete(@RequestBody String[] ids) {
        return usv.doDelete(ids);
    }


    //------------------------------------------------------------------------------------------------------------


    // 6 - 查询请假人员
    @RequestMapping("/whoRest")
    public ResultJson whoRest(@RequestBody Map<String, String> map) {
        return usv.findSleeper(map);
    }

    @RequestMapping("/whoRest0")
    public ResultJson whoRes0t(@RequestBody Map<String, String> map) {
        return usv.findSleeper0(map);
    }

    @RequestMapping("/whoRest12")
    public ResultJson whoRest12(@RequestBody Map<String, String> map) {
        return usv.findSleeper12(map);
    }


    // 6 - 部门审批 - 通过
    @RequestMapping("/restAgree")//通过
    public ResultJson restAgree(@RequestBody String[] ids) {
        return usv.Agree(ids);
    }

    @RequestMapping("/restDisAgree")//不通过
    public ResultJson restDisAgree(@RequestBody String[] ids) {
        return usv.DisAgree(ids);
    }


    //------------------------------------------------------------------------------------------------------------


    // 7 - 奖惩登记
    @RequestMapping("/jcCin")
    public ResultJson jcCin(@RequestBody Map<String, String> map) {
        return usv.jcCin(map);
    }

    // 8 - 奖惩查询
    @RequestMapping("/jcFind")
    public ResultJson jcFind(@RequestBody Map<String, String> map) {
        return usv.jcFind(map);
    }


    //------------------------------------------------------------------------------------------------------------


    // 9 - 请假登记
    @RequestMapping("/restReg")
    public ResultJson restReg(@RequestBody Map<String, String> map) {
        return usv.restReg(map);
    }


    // 10 - 请假查询
    @RequestMapping("/restQuery")
    public ResultJson restQuery(@RequestBody Map<String, String> map) {
        return usv.restQuery(map);
    }


    // 11 - 用户存在查询
    @RequestMapping("/haveUser")
    public ResultJson haveUser(@RequestBody Map<String, String> map) {
        return usv.findUser(map);
    }


    //------------------------------------------------------------------------------------------------------------

    //@RequestBody Map<String, String> map

    // 12 - 纵览 · 打卡
    @RequestMapping("/ask1")
    public ResultJson ask1() {
        return usv.ask1();
    }

    // 13 - 纵览 · 出勤
    @RequestMapping("/ask2")
    public ResultJson ask2() {
        return usv.ask2();
    }

    // 14 - 出勤查询        单个员工/全体员工
    @RequestMapping("/ask3")
    public ResultJson ask3(@RequestBody Map<String, String> map) {
        return usv.ask3(map);
    }

    //  15 - 打卡上班
    @RequestMapping("/SignIn")
    public ResultJson SignIn(@RequestBody Map<String, String> map) {
        return usv.SignIn(map);
    }

    //  16 - 修改密码
    @RequestMapping("/forgetParcel")
    public ResultJson forgetParcel(@RequestBody Map<String, String> map) {
        return usv.forgetParcel(map);
    }

    // 17 - 公告板  6条
    @RequestMapping("/getBoard")
    public ResultJson getBoard() {
        return usv.getBoard();
    }

}




























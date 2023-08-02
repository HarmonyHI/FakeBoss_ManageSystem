package com.asrc.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UsersMapper {

    //------------------------------------------------------------------------

    //【0 - 用户注册】
    int SXHNB(Map<String, String> map);


    //【0 - 修改密码】
    int updatePwd(Map<String, String> map);

    //【1 - 登录查询】
    Map<String, Object> login(Map<String, String> map);


    //------------------------------------------------------------------------


    //【2 - 添加员工】
    int save(Map<String, String> map);

    //【3 - 查询员工】（模糊查询）
    List<Map<String, Object>> findByParam(Map<String, String> map);

    //【4 - 修改员工】
    int update(Map<String, String> map);

    //【5 - 删除员工】
    int delete(String[] ids);


    //------------------------------------------------------------------------


    //【6 - 请假人员查询】
    List<Map<String, Object>> sleep(Map<String, String> map);
    List<Map<String, Object>> sleep0(Map<String, String> map);
    List<Map<String, Object>> sleep12(Map<String, String> map);

    //【6 - 部门审批】 - 同意
    int restAgree(String[] ids);// idx=1代表通过，idx=2代表不通过

    //【6 - 部门审批】 - 不同意
    int restDisAgree(String[] ids);// idx=1代表通过，idx=2代表不通过


    //------------------------------------------------------------------------


    //【7 - 奖惩登记】
    int jcRegister(Map<String, String> map);

    //【8 - 奖惩查询】
    List<Map<String, Object>> jcQuery(Map<String, String> map);


    //------------------------------------------------------------------------


    //【9 - 奖惩登记】
    int restReg(Map<String, String> map);


    //【10 - 查询请假信息 - 根据userID】
    List<Map<String, Object>> restQuery(Map<String, String> map);




    //------------------------------------------------------------------------



    //【11 - 查询是否有这个用户 - 根据userName】

    List<Map<String, Object>> findUser(Map<String, String> map);




    //------------------------------------------------------------------------



        //  12 - 纵览 · 打卡
    List<Map<String, Object>> ask1();
        //  13 - 纵览 · 出勤
    List<Map<String, Object>> ask2();
        //  14 - 员工出勤查询（全体员工/指定员工）
    List<Map<String, Object>> ask3(Map<String, String> map);


    //------------------------------------------------------------------------
        //  15  打卡上班
    int signIn(Map<String, String> map);
        //  16  修改密码
    int forgetParcel(Map<String, String> map);
        //  17 - 公告板
    List<Map<String, Object>> getBoard();


}




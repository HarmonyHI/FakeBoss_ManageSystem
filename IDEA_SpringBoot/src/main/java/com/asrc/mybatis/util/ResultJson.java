package com.asrc.mybatis.util;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
//快速写完setter getter方法
public class ResultJson {
    private int code;//前端根据返回信息判断返回是否成功
    private String msg;//错误信息原因汇报
    private Object data;

    public ResultJson success() {
        this.code = 200;
        this.msg = "成功！";
        return this;
    }

    public ResultJson fail() {
        this.code = 500;
        this.msg = "失败！";
        return this;
    }

    public ResultJson success(Object data) {
        this.code = 200;
        this.msg = "成功！";
        this.data = data;
        return this;
    }
}

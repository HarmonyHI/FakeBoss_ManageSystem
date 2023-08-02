package com.asrc.mybatis;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.Map;

@SpringBootTest
class MybatisApplicationTests {

    @Test
    void contextLoads() {
        System.out.printf("Hello~\n");
        Map<String,String> map=new HashMap<>();
        map.put("WID","1");

        if(map.get("WID").equals("1"))
            map.put("depart","1");
        else
            map.put("depart","0");

        if(map.get("depart").equals("1"))
            System.out.printf("Teacher");
        else
            System.out.printf("Student");

    }

}

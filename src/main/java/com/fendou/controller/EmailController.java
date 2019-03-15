package com.fendou.controller;

import com.fendou.utils.MailUtil;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/email")
public class EmailController {

    @RequestMapping("/getCode")
    @ResponseBody
    public void getCode(@Param("email") String email,HttpServletResponse response){
        Map<String,String > map = new HashMap<>();
        String code = UUID.randomUUID().toString();
        System.out.println(code);

        map.put("codevalue", code);

        MailUtil mailUtil = new MailUtil(email,  code);
        mailUtil.run();



        if(email.matches("^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$")){
            map.put("flag", "验证码发送成功！");
        }else{
            map.put("flag", "验证码发送失败");
        }
        Gson g = new Gson();
        String json = g.toJson(map);
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        writer.print(json);
    }


}

package com.fendou.controller;

import com.fendou.pojo.User;
import com.fendou.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //点击显示注册账号的页面
    @RequestMapping("/addUserTo")
    public String addUserTo(@Param("category") String category, Model model){
        model.addAttribute("category", category);
        return "forward:/administrator/reToMain";
    }


    /**
     * 点击注册按钮将用户信息加入数据库
     */

        @RequestMapping("/addUser")
        public String  addUser(User user, Model model){

        boolean addFlag = userService.addUser(user);
        model.addAttribute("addFlag", addFlag);

        return "forward:/index.jsp";
    }

}



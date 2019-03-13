package com.fendou.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {


    @RequestMapping("/addUserTo")
    public String addUserTo(@Param("category") String category, Model model){
        model.addAttribute("category", category);

        return "forward:/administrator/reToMain";
    }
}


package com.fendou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jumpto")
public class JumpToController {

    @RequestMapping("/loginPage")
    public String loginPage(){
        return "login";
    }

}

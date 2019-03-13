package com.fendou.controller;

import com.fendou.pojo.Admin;
import com.fendou.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;
//用户信息校验
    @RequestMapping("/checkAdmin")
    public String checkAdmin(Admin admin, HttpSession httpSession, Model model){
        admin = loginService.selectByNamePwd(admin.getAname(),admin.getApwd());
        if(admin!=null){
            //登录成功
            httpSession.setAttribute("admin", admin);
            return "forward:/index.jsp";
        }else {
            //登录失败
            model.addAttribute("error", "用户名或密码错误，请重新输入！");
            return "login";
        }
    }


//注销操作
    @RequestMapping("/logout")
    public String logoutAdmin(HttpSession httpSession){
        httpSession.removeAttribute("admin");
        httpSession.invalidate();
        return "redirect:/jumpto/loginPage";
    }



    //返回首页功能
    @RequestMapping("/returnToIndex")
    public String returnToIndex(){
        return "redirect:/index.jsp";
    }
}

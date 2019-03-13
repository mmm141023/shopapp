package com.fendou.controller;

import com.fendou.pojo.Admin;
import com.fendou.service.AdministratorService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/administrator")
public class AdministratorController {

    @Autowired
    private AdministratorService administratorService;

    @RequestMapping("/selectAll")
    public String selectAll(Model model,@Param("category") String category){
        List<Admin> admins = administratorService.selectAll();
        model.addAttribute("admins", admins);
        model.addAttribute("category", category);
        return "forward:/index.jsp";
    }

    @RequestMapping("/reToMain")
    public String reToMain(){
        return "forward:/index.jsp";
    }
//删除用户
    @RequestMapping("/deleteById/{id}")
    public String deleteById(@PathVariable("id") Integer id,Model model){
        boolean deleteFlag = administratorService.deleteById(id);
        model.addAttribute("deleteFlag", deleteFlag);
        return "forward:/administrator/selectAll?category=administrator";
    }


//    增加用户
    @RequestMapping("/addAdmin")
    public String addAdmin(Admin admin,Model model){
        boolean addFlag = administratorService.addAdmin(admin);
        model.addAttribute("addFlag", addFlag);
        return "forward:/administrator/selectAll?category=administrator";
    }



    //修改用户名密码
    @RequestMapping("/updateAdmin")
    public String updateAdmin(Admin admin,Model model){
        boolean updateFlag = administratorService.updateByNameWithPwd(admin);
        model.addAttribute("updateFlag", updateFlag);
        return "forward:/administrator/selectAll?category=administrator";
    }
}

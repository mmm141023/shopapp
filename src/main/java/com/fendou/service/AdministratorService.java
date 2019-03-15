package com.fendou.service;

import com.fendou.pojo.Admin;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AdministratorService {

    boolean deleteById(Integer id);

    boolean addAdmin(Admin admin);

    Admin selectById(Integer id);

    boolean updateByNameWithPwd(Admin admin);

    List<Admin> selectAll();

    int counts();
}

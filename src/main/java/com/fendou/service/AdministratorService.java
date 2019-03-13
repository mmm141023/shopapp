package com.fendou.service;

import com.fendou.pojo.Admin;

import java.util.List;

public interface AdministratorService {
    List<Admin> selectAll();

    boolean deleteById(Integer id);

    boolean addAdmin(Admin admin);

    Admin selectById(Integer id);

    boolean updateByNameWithPwd(Admin admin);
}

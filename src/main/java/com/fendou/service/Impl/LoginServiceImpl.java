package com.fendou.service.Impl;

import com.fendou.dao.AdminMapper;
import com.fendou.pojo.Admin;
import com.fendou.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin selectByNamePwd(String aname, String apwd) {
        return adminMapper.selectByNamePwd(aname,apwd);
    }
}

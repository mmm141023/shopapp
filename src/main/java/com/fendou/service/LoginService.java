package com.fendou.service;

import com.fendou.pojo.Admin;

public interface LoginService {

    Admin selectByNamePwd(String aname, String apwd);
}

package com.fendou.service.Impl;

import com.fendou.dao.UserMapper;
import com.fendou.pojo.User;
import com.fendou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean addUser(User user) {
        return userMapper.insert(user) == 1 ? true:false;
    }
}

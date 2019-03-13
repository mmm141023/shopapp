package com.fendou.service.Impl;

import com.fendou.dao.AdminMapper;
import com.fendou.pojo.Admin;
import com.fendou.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("administratorServic")
public class AdministratorServiceImpl implements AdministratorService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Admin> selectAll() {
        return adminMapper.selectAll();
    }

    @Override
    public boolean deleteById(Integer id) {
        return adminMapper.deleteByPrimaryKey(id) == 1? true:false;
    }

    @Override
    public boolean addAdmin(Admin admin) {
        return adminMapper.insert(admin) == 1?true:false;
    }

    @Override
    public Admin selectById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateByNameWithPwd(Admin admin) {
        return adminMapper.updateByPrimaryKey(admin) == 1?true:false;
    }

}

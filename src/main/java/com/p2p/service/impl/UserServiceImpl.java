package com.p2p.service.impl;

import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.UserMapper;
import com.p2p.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 娃娃鱼 on 2017/12/21.
 */
@Service
public class UserServiceImpl extends AbstractServiceImpl implements UserService{

    private UserMapper userMapper;

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userMapper.getByPhonePwd(phone, upwd);
    }

    public void setUserMapper(UserMapper userMapper) {
        super.setBaseDAO(userMapper);
        this.userMapper = userMapper;
    }
}

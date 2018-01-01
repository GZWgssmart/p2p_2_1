package com.p2p.service.impl;

import com.p2p.bean.UserMoney;
import com.p2p.dao.UserMoneyMapper;
import com.p2p.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class UserMoneyServiceImpl extends AbstractServiceImpl implements UserMoneyService {

    private UserMoneyMapper userMoneyMapper;

    @Autowired
    public void setUserMoneyMapper(UserMoneyMapper userMoneyMapper) {
        super.setBaseDAO(userMoneyMapper);
        this.userMoneyMapper = userMoneyMapper;
    }

    @Override
    public UserMoney getUserMoney(Integer uid) {
        return userMoneyMapper.getUserMoney(uid);
    }
}

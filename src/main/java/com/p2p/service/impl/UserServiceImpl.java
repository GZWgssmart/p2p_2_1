package com.p2p.service.impl;

import com.p2p.bean.Rzvip;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.RzvipMapper;
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
    private RzvipMapper rzvipMapper;

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userMapper.getByPhonePwd(phone, upwd);
    }

    @Override
    public ServerResponse<Integer> getByPhone(String phone) {
        if(userMapper.getByPhone(phone) == 1) {
            return ServerResponse.createByError("手机号不存在");
        } else {
            return ServerResponse.createBySuccess("手机号存在");
        }
    }

    /**
     * 添加认证信息
     * 更新user表，然后再保存认证表
     * @param user
     * @param rzvip
     * @return
     */
    @Override
    public ServerResponse saveBorrow(User user, Rzvip rzvip) {
        ValidationResult validationResult = ValidationUtils.validateEntity(user);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        validationResult = ValidationUtils.validateEntity(rzvip);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        if(userMapper.update(user) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        rzvip.setUid(user.getUid());
        if(rzvipMapper.save(rzvip) == 0){
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }


    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        super.setBaseDAO(userMapper);
        this.userMapper = userMapper;
    }

    @Autowired
    public void setRzvipMapper(RzvipMapper rzvipMapper) {
        this.rzvipMapper = rzvipMapper;
    }
}

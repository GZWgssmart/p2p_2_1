package com.p2p.service.impl;

import com.p2p.bean.*;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.*;
import com.p2p.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by 娃娃鱼 on 2017/12/21.
 */
@Service
public class UserServiceImpl extends AbstractServiceImpl implements UserService{

    private UserMapper userMapper;
    private RzvipMapper rzvipMapper;
    private RecommendMapper recommendMapper;
    private UserMoneyMapper userMoneyMapper;
    private UserTicketMapper userTicketMapper;

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userMapper.getByPhonePwd(phone, upwd);
    }

    @Override
    public ServerResponse<Integer> getByPhone(String phone) {
        try {
            if(userMapper.getByPhone(phone) != 0) {
                return ServerResponse.createBySuccess("手机号存在");
            }
        } catch (RuntimeException e) {
            return ServerResponse.createByError("手机号不存在");
        }
        return ServerResponse.createByError("手机号不存在");
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

    /**
     * 如果填写了推荐码，则用户信息和推荐列表一起添加
     * @param user
     * @param recommend
     * @return
     */
    @Override
    public ServerResponse saveRecommend(User user, Recommend recommend) {
        UserTicket userTicket = new UserTicket();
        ValidationResult validationResult = ValidationUtils.validateEntity(user);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        validationResult = ValidationUtils.validateEntity(recommend);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        user.setResstr1(Calendar.getInstance().getTime());
        if(userMapper.save(user) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        UserMoney userMoney = new UserMoney();
        userMoney.setUid(user.getUid());
        if(userMoneyMapper.save(userMoney) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        recommend.setUid(user.getUid());
        recommend.setTname(recommend.getTid() + "");
        if(recommendMapper.save(recommend) == 0){
            return ServerResponse.createByError("保存失败");
        }
        userTicket.setUid(recommend.getTid());
        userTicket.setKid(1);
        userTicket.setTktime(new Date());
        if(userTicketMapper.save(userTicket) == 0){
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }

    @Override
    public ServerResponse<Integer> updateVip(String[] uid) {
        try {
            if(userMapper.updateVip(uid) != 0) {
                return ServerResponse.createBySuccess("更新成功");
            } else {
                return ServerResponse.createByError("更新失败");
            }
        } catch (RuntimeException e) {
            return ServerResponse.createByError("更新失败");
        }
    }


    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        super.setBaseDAO(userMapper);
        this.userMapper = userMapper;
    }

    @Override
    public ServerResponse<Integer> save(Object obj) {
        User user = (User)obj;
        super.save(user);
        UserMoney userMoney = new UserMoney();
        userMoney.setUid(user.getUid());
        user.setResstr1(Calendar.getInstance().getTime());
        if(userMoneyMapper.save(userMoney) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }

    @Autowired
    public void setRzvipMapper(RzvipMapper rzvipMapper) {
        this.rzvipMapper = rzvipMapper;
    }
    @Autowired
    public void setRecommendMapper(RecommendMapper recommendMapper) {
        this.recommendMapper = recommendMapper;
    }
    @Autowired
    public void setUserMoneyMapper(UserMoneyMapper userMoneyMapper) {
        this.userMoneyMapper = userMoneyMapper;
    }
    @Autowired
    public void setUserTicket(UserTicketMapper userTicketMapper) {
        this.userTicketMapper = userTicketMapper;
    }

}

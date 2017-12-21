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
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userMapper.getByPhonePwd(phone, upwd);
    }

    @Override
    public ServerResponse<String> save(Object obj) {
        try{
            userMapper.save(obj);
            return ServerResponse.createBySuccess("保存成功");
        }catch (Exception e) {
            return ServerResponse.createByError("保存失败");
        }
    }

    @Override
    public ServerResponse<String> remove(Object obj) {
        return null;
    }

    @Override
    public ServerResponse<String> removeById(Long id) {
        return null;
    }

    @Override
    public ServerResponse<String> active(Long id, Byte status) {
        return null;
    }

    @Override
    public ServerResponse<String> update(Object obj) {
        try{
            userMapper.update(obj);
            return ServerResponse.createBySuccess("修改成功");
        }catch (Exception e) {
            return ServerResponse.createByError("修改失败");
        }
    }

    @Override
    public Object getById(Integer id) {
        try{
            userMapper.getById(id);
            return ServerResponse.createBySuccess("成功");
        }catch (Exception e) {
            return ServerResponse.createByError("失败");
        }
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        return null;
    }
}

package com.p2p.service.impl;

import com.p2p.bean.Huser;
import com.p2p.common.ServerResponse;
import com.p2p.dao.HuserMapper;
import com.p2p.service.HkbService;
import com.p2p.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qingfeng on 2017/12/27.
 */
@Service
public class HuserServiceImpl extends AbstractServiceImpl implements HuserService {

    private HuserMapper huserMapper;

    @Override
    public Huser getByPhonePwd(String phone, String pwd) {
        return huserMapper.getByPhonePwd(phone, pwd);
    }

    @Override
    public ServerResponse<Integer> getByPhone(String phone) {
        if(huserMapper.getByPhone(phone) != 0) {
            return ServerResponse.createBySuccess("手机号存在");
        } else {
            return ServerResponse.createByError("手机号不存在");
        }
    }

    @Autowired
    public void setUserMapper(HuserMapper huserMapper) {
        super.setBaseDAO(huserMapper);
        this.huserMapper = huserMapper;
    }


}

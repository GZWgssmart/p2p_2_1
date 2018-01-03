package com.p2p.service.impl;

import com.p2p.bean.Huser;
import com.p2p.bean.RoleUser;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.HuserMapper;
import com.p2p.dao.RoleUserMapper;
import com.p2p.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qingfeng on 2017/12/27.
 */
@Service
public class HuserServiceImpl extends AbstractServiceImpl implements HuserService {

    private HuserMapper huserMapper;
    private RoleUserMapper roleUserMapper;

    @Override
    public Huser getByPhonePwd(String phone, String pwd) {
        return huserMapper.getByPhonePwd(phone, pwd);
    }

    @Override
    public ServerResponse<Integer> getByPhone(String phone) {
        try {
            if (huserMapper.getByPhone(phone) != 0) {
                return ServerResponse.createBySuccess("手机号存在");
            } else {
                return ServerResponse.createByError("手机号不存在");
            }
        } catch (RuntimeException e) {
            return ServerResponse.createByError("手机号不存在");
        }
    }

    @Override
    public ServerResponse saveRoleUser(Huser huser, RoleUser roleUser) {
        ValidationResult validationResult = ValidationUtils.validateEntity(huser);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        validationResult = ValidationUtils.validateEntity(roleUser);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        if(huserMapper.save(huser) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        roleUser.setHuid(huser.getHuid());
        if(roleUserMapper.save(roleUser) == 0){
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }

    @Autowired
    public void setUserMapper(HuserMapper huserMapper) {
        super.setBaseDAO(huserMapper);
        this.huserMapper = huserMapper;
    }

    @Autowired
    public void setRoleUserMapper(RoleUserMapper roleUserMapper) {
        this.roleUserMapper = roleUserMapper;
    }


}

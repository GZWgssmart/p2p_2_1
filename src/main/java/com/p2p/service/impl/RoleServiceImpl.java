package com.p2p.service.impl;

import com.p2p.bean.Role;
import com.p2p.bean.Rolejur;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.RoleMapper;
import com.p2p.dao.RolejurMapper;
import com.p2p.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qingfeng on 2017/12/26.
 */
@Service
public class RoleServiceImpl extends AbstractServiceImpl implements RoleService {

    private RoleMapper roleMapper;
    private RolejurMapper rolejurMapper;

    @Override
    public ServerResponse saveRolejur(Role role, Rolejur rolejur) {
        ValidationResult validationResult = ValidationUtils.validateEntity(role);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        validationResult = ValidationUtils.validateEntity(rolejur);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        if(roleMapper.save(role) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        rolejur.setRid(role.getRid());
        if(rolejurMapper.save(rolejur) == 0){
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper){
        super.setBaseDAO(roleMapper);
        this.roleMapper = roleMapper;
    }

    @Autowired
    public void setRolejurMapper(RolejurMapper rolejurMapper) {
        this.rolejurMapper = rolejurMapper;
    }

}

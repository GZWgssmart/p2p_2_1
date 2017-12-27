package com.p2p.service.impl;

import com.p2p.dao.RoleMapper;
import com.p2p.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qingfeng on 2017/12/26.
 */
@Service
public class RoleServiceImpl extends AbstractServiceImpl implements RoleService {

    private RoleMapper roleMapper;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper){
        super.setBaseDAO(roleMapper);
        this.roleMapper = roleMapper;
    }
}

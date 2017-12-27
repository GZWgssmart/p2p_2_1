package com.p2p.service.impl;

import com.p2p.dao.RoleUserMapper;
import com.p2p.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qingfeng on 2017/12/26.
 */
@Service
public class RoleUserServiceImpl extends AbstractServiceImpl implements RoleUserService {

    private RoleUserMapper roleuserMapper;

    @Autowired
    public void setRolejurMapper(RoleUserMapper roleuserMapper){
        super.setBaseDAO(roleuserMapper);
        this.roleuserMapper = roleuserMapper;
    }
}

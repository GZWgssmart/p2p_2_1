package com.p2p.service;

import com.p2p.bean.RoleUser;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by qingfeng on 2017/12/26.
 */
public class RoleUserTest extends BaseTest {

    @Autowired
    private RoleUserService roleUserService;

    @Test
    public void testSave(){
        RoleUser roleUser = new RoleUser();
        roleUser.setRid(1);
        roleUser.setHuid(1);
        roleUserService.save(roleUser);
    }

}

package com.p2p.service;

import com.p2p.bean.Role;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by qingfeng on 2017/12/26.
 */
public class RoleTest extends BaseTest {

    @Autowired
    private RoleService roleService;

    private Role role;
    //添加角色
    @Test
    public void saveRole(){
        role = new Role();
        role.setRname("root");
        role.setContent("最高级用户");
        roleService.save(role);
    }
    //更新角色
    @Test
    public void updateRole(){
        role = new Role();
        role.setRid(1);
        role.setRname("CEO");
        role.setContent("我是CEO");
        roleService.update(role);
    }
    //角色删除
    @Test
    public void removeByIdRole(){
        role = new Role();
        role.setRid(2);
        roleService.removeById(role.getRid());
    }

    @Test
    public void testAll() {
        roleService.listAll();
    }

    @Test
    public void testPages(){
        Role role = new Role();
        roleService.listPagerCriteria(1,10,role);
    }

}

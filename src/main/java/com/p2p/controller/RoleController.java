package com.p2p.controller;

import com.p2p.bean.Role;
import com.p2p.common.ServerResponse;
import com.p2p.dao.RoleMapper;
import com.p2p.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingfeng on 2017/12/26.
 */
@Controller
@RequestMapping("/data/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    private Role role;

    /**
     *
     * @return
     */
    @RequestMapping("save")
    public ServerResponse saveRole(){
        return roleService.save(role);
    }

    /**
     *
     * @return
     */
    @RequestMapping("update")
    public ServerResponse updateRole(Integer id){
        role = new Role();
        role.setRname(role.getRname());
        role.setContent(role.getContent());
        role.setRid(id);
        return roleService.update(role);
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse removeByIdRole(Integer id){
        role = new Role();
        role.setRid(id);
        return roleService.removeById(role.getRid());
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Role> allType() {
        List<Object> objects = roleService.listAll();
        List<Role> roles = new ArrayList<>();
        for (Object obj : objects) {
            Role type = (Role) obj;
            roles.add(type);
        }
        return roles;
    }
}

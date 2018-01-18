package com.p2p.controller;

import com.p2p.bean.Role;
import com.p2p.bean.RoleUser;
import com.p2p.common.ServerResponse;
import com.p2p.service.HuserService;
import com.p2p.service.RoleService;
import com.p2p.service.RoleUserService;
import com.p2p.vo.RoleHuserTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingfeng on 2017/12/26.
 */
@RestController
@RequestMapping("/rolehuser")
public class RoleUserController {

    @Autowired
    private RoleUserService roleUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private HuserService huserService;


    @RequestMapping("/addRoleUser")
    public ServerResponse save(RoleUser roleUser){
        return roleUserService.save(roleUser);
    }

    @RequestMapping("remove")
    public ServerResponse remove(RoleUser roleUser){
        return roleUserService.remove(roleUser);
    }

    @RequestMapping("all")
    public List<RoleHuserTree> roleHuserTree(Integer huid) {
        List<Object> objects = roleService.listAll();
        List<Role> roles = roleUserService.getRoleUser(huid);
        List<RoleHuserTree> roleHuserTrees = new ArrayList<>();
        List<RoleHuserTree> objects1 = new ArrayList<>();
        for (Object obj : objects) {
            Role role = (Role) obj;
            roleHuserTrees.add(new RoleHuserTree(role.getContent(),role.getRid() + "", false,objects1));
        }
        for (RoleHuserTree roleHuserTree : roleHuserTrees) {
            for(Role role : roles) {
                if(roleHuserTree.getValue().equals(role.getRid() + "")) {
                    roleHuserTree.setChecked(true);
                }
            }
        }
        return roleHuserTrees;
    }

}

package com.p2p.controller;

import com.p2p.bean.RoleUser;
import com.p2p.common.ServerResponse;
import com.p2p.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by qingfeng on 2017/12/26.
 */
@Controller
@RequestMapping("/role")
public class RoleUserController {

    @Autowired
    private RoleUserService roleUserService;

    private ServerResponse serverResponse;

    @RequestMapping(value = "/addRoleUser",method= RequestMethod.POST)
    public ServerResponse save(RoleUser roleUser){
        return roleUserService.save(roleUser);
    }

}

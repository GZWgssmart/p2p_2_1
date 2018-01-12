package com.p2p.controller;

import com.p2p.bean.Role;
import com.p2p.bean.Rolejur;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.RoleService;
import com.p2p.vo.JurRoleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingfeng on 2017/12/26.
 */
@RestController
@RequestMapping("/data/Role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    /**
     *添加角色
     * @return
     */
    @RequestMapping("save")
    public ServerResponse saveRole(JurRoleVO jurRoleVO) {
        Role role = new Role();
        Rolejur rolejur = new Rolejur();
        role.setRname(jurRoleVO.getRname());
        role.setContent(jurRoleVO.getContent());
        rolejur.setRid(jurRoleVO.getRid());
        rolejur.setJid(jurRoleVO.getJid());
        return roleService.saveRolejur(role, rolejur);
    }

    /**
     *更新角色
     * @return
     */
    @RequestMapping("update")
    public ServerResponse updateRole(Role role){
        return roleService.update(role);
    }

    @RequestMapping("roleDetail")
    public Role roleDetail(Integer roleId){
        Object obj = roleService.getById(roleId);
        return (Role) obj;
    }


    /**
     * 删除角色
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse removeByIdRole(Role role){
        return roleService.removeById(role.getRid());
    }

    /**
     * 角色分页
     * @return
     */
    @RequestMapping("roleList")
    @ResponseBody
    public Pager HuserList(int page, int limit, Role role) {
        return roleService.listPagerCriteria(page,limit,role);
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

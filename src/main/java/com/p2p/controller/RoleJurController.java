package com.p2p.controller;

import com.p2p.bean.Jur;
import com.p2p.bean.Rolejur;
import com.p2p.common.ServerResponse;
import com.p2p.service.JurService;
import com.p2p.service.RoleJurService;
import com.p2p.vo.RoleJurTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created  qingfeng on 2017/12/26.
 */
@Controller
@RequestMapping("/rolejur")
public class RoleJurController {

    @Autowired
    private RoleJurService rolejurService;

    @Autowired
    private JurService jurService;

    private ServerResponse serverResponse;

    @RequestMapping("addRoleJur")
    public ServerResponse save(Rolejur rolejur){
        return rolejurService.save(rolejur);
    }

    @PostMapping("remove1/{rjid}")
    @ResponseBody
    public ServerResponse removeById(@PathVariable("rjid")Integer rjid){
        return rolejurService.removeById(rjid);
    }

    @PostMapping("remove")
    @ResponseBody
    public ServerResponse remove(Rolejur rolejur){
        return rolejurService.remove(rolejur);
    }

    @RequestMapping("all")
    @ResponseBody
    public List<RoleJurTree> roleJurTree(Integer rid) {
        List<Object> objects = jurService.listAll();
        List<Jur> jurs = rolejurService.getRoleJur(rid);
        List<RoleJurTree> roleJurTrees = new ArrayList<>();
        List<RoleJurTree> objects1 = new ArrayList<>();
        for (Object obj : objects) {
            Jur jur = (Jur) obj;
            roleJurTrees.add(new RoleJurTree(jur.getContent(),jur.getJid() + "", false,objects1));
        }
        for (RoleJurTree roleJurTree : roleJurTrees) {
            for(Jur jur : jurs) {
                if(roleJurTree.getValue().equals(jur.getJid() + "")) {
                    roleJurTree.setChecked(true);
                }
            }
        }
        return roleJurTrees;
    }

    @RequestMapping("list")
    @ResponseBody
    public RoleJurTree roleJurTree1(Integer rid) {
        RoleJurTree roleJurTreeYes = new RoleJurTree();
        List<Object> objects = jurService.listAll();
        List<Jur> jurs = rolejurService.getRoleJur(rid);
        List<RoleJurTree> roleJurTrees = new ArrayList<>();
        List<RoleJurTree> objects1 = new ArrayList<>();
        for (Object obj : objects) {
            Jur jur = (Jur) obj;
            roleJurTrees.add(new RoleJurTree(jur.getContent(),jur.getJid() + "", false,objects1));
        }
        for (RoleJurTree roleJurTree : roleJurTrees) {
            for(Jur jur : jurs) {
                if(roleJurTree.getValue().equals(jur.getJid() + "")) {
                    roleJurTree.setChecked(true);
                }
            }
        }
        roleJurTreeYes.setTitle("权限");
        roleJurTreeYes.setValue(rid+"");
        roleJurTreeYes.setData(roleJurTrees);
        return roleJurTreeYes;
    }

}

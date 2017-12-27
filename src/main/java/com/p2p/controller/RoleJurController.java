package com.p2p.controller;

import com.p2p.bean.Rolejur;
import com.p2p.common.ServerResponse;
import com.p2p.service.RoleJurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created  qingfeng on 2017/12/26.
 */
@Controller
@RequestMapping("/rolejur")
public class RoleJurController {

    @Autowired
    private RoleJurService rolejurService;

    private ServerResponse serverResponse;

    @RequestMapping("/addRoleJur")
    public ServerResponse save(Rolejur rolejur){
        return rolejurService.save(rolejur);
    }
    @PostMapping("remove/{rjid}")
    @ResponseBody
    public ServerResponse removeById(@PathVariable("rjid")Integer rjid){
        return rolejurService.removeById(rjid);
    }

}

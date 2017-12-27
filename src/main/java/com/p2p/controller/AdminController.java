package com.p2p.controller;

import com.p2p.bean.Huser;
import com.p2p.common.ServerResponse;
import com.p2p.dao.HuserMapper;
import com.p2p.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created  qingfeng on 2017/12/27.
 */
@Controller
@RequestMapping("/admin/data")
public class AdminController {

    @Autowired
    private HuserService huserService;

    @RequestMapping("addhuser")
    public ServerResponse save(Huser huser){
        return huserService.save(huser);
    }
}

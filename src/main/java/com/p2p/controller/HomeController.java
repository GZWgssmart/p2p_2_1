package com.p2p.controller;

import com.p2p.bean.Home;
import com.p2p.common.ServerResponse;
import com.p2p.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by yao on 2017/12/27.
 */
@Controller
@RequestMapping("/data/home")
public class HomeController {

    @Autowired
    private HomeService homeService;

    @RequestMapping("addIndexMsg")
    @ResponseBody
    public ServerResponse addIndexMsg(Home home){
        return homeService.save(home);
    }

}

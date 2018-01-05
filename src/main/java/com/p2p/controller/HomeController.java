package com.p2p.controller;

import com.p2p.bean.Home;
import com.p2p.common.Pager;
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

    @RequestMapping("indexMsg")
    @ResponseBody
    public Pager pagerCriteria(int page, int limit, Home home){
        return homeService.listPagerCriteria(page,limit,home);
    }

    @RequestMapping("getById")
    @ResponseBody
    public Home getById(int hid){
        return (Home)homeService.getById(hid);
    }
    @RequestMapping("editIndexMsg")
    @ResponseBody
    public ServerResponse update(Home home){
        return homeService.update(home);
    }

    @RequestMapping("delete")
    @ResponseBody
    public ServerResponse delete(int  homeId){
        return homeService.removeById(homeId);
    }
}

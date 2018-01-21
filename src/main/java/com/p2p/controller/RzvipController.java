package com.p2p.controller;

import com.p2p.bean.RzCheck;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.RzCheckService;
import com.p2p.service.RzvipService;
import com.p2p.service.UserService;
import com.p2p.vo.UserRzvipVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by 娃娃鱼 on 2018/1/2.
 */
@RestController
@RequestMapping("/data/vip")
public class RzvipController {

    @Autowired
    private RzvipService rzvipService;

    @Autowired
    private UserService userService;

    @Autowired
    private RzCheckService rzCheckService;

    @RequestMapping("novip")
    @ResponseBody
    public Pager allNOvip(int page, int limit, UserRzvipVO userRzvipVO) {
        return rzvipService.listPagerCriteria(page,limit,userRzvipVO);
    }

    @RequestMapping("userVip")
    @ResponseBody
    public Pager allVip(int page, int limit, User user){
        return userService.listPagerCriteria(page,limit,user);
    }

    @RequestMapping("checkVip")
    public ServerResponse checkVip(RzCheck rzCheck) {
        rzCheck.setCreatedTime(new Date());
        User user = new User();
        user.setUid(rzCheck.getUid());
        user.setIsvip(rzCheck.getIsok());
        userService.update(user);
        return rzCheckService.save(rzCheck);
    }

}

package com.p2p.controller;

import com.p2p.bean.LogCz;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.LogCzService;
import com.p2p.service.LogMoneyService;
import com.p2p.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/28.
 * @author  ChuYIming
 * Recharge  充值
 */
@RestController
@RequestMapping("/data/logCz")
public class LogCzController {

    @Autowired
    private LogCzService logCzService;
    @Autowired
    private LogMoneyService logMoneyService;
    @Autowired
    private UserMoneyService userMoneyService;

    @RequestMapping("save")
    public ServerResponse save(LogCz logCz){
        System.out.println(logCz);
        return logCzService.save(logCz);
    }

    @RequestMapping("listPagerCriteria")
    public Pager listPage(int page, int limit, LogCz logCz, HttpSession session){
        Object obj= session.getAttribute("user");
        if(obj != null) {
            User user = (User)obj;
            logCz.setUid(user.getUid());
            return logCzService.listPagerCriteria(page, limit, logCz);
        }
        return logCzService.listPagerCriteria(page, limit, logCz);
    }

}

package com.p2p.controller;

import com.p2p.bean.LogMoney;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.service.LogMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/8.
 * @author ChuYIming
 */
@RestController
@RequestMapping("/data/logMoney")
public class LogMoneyController {
    @Autowired
    private LogMoneyService logMoneyService;

    @RequestMapping("record")
    public Pager listPage(int page, int limit, LogMoney logMoney, HttpSession session){
        Object obj= session.getAttribute("user");
        if(obj != null) {
            User user = (User)obj;
            logMoney.setUid(user.getUid());
            return logMoneyService.listPagerCriteria(page, limit, logMoney);
        }
        return logMoneyService.listPagerCriteria(page, limit, logMoney);
    }
}

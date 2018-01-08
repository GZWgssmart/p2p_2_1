package com.p2p.controller;

import com.p2p.bean.LogTx;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.LogMoneyService;
import com.p2p.service.LogTxService;
import com.p2p.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/4.
 * @author  ChuYiming
 */
@RestController
@RequestMapping("/data/logTx")
public class LogTxController {

    @Autowired
    private LogTxService logTxService;

    @Autowired
    private LogMoneyService logMoneyService;
    @Autowired
    private UserMoneyService userMoneyService;

    @RequestMapping("save")
    public ServerResponse addCard(LogTx logTx){
        return logTxService.save(logTx);
    }

    @RequestMapping("listPagerCriteria")
    public Pager listPage(int page, int limit, LogTx logTx, HttpSession session){
        Object obj= session.getAttribute("user");
        if(obj != null) {
            User user = (User)obj;
            logTx.setUid(user.getUid());
            return logTxService.listPagerCriteria(page, limit, logTx);
        }
        return logTxService.listPagerCriteria(page, limit, logTx);
    }
}

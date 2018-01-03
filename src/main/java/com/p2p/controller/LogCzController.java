package com.p2p.controller;

import com.p2p.bean.LogCz;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.LogCzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Calendar;

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

    @RequestMapping("save")
    public ServerResponse addCard(LogCz logCz){
        ServerResponse serverResponse = null;
        if(logCz!=null){
            logCz.setCreatedTime(Calendar.getInstance().getTime());
            logCzService.save(logCz);
            serverResponse = ServerResponse.createBySuccess();
        } else {
            serverResponse = ServerResponse.createByError();
        }
        return serverResponse;
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

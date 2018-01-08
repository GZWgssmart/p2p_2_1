package com.p2p.controller;

import com.p2p.bean.LogCz;
import com.p2p.bean.LogMoney;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.LogCzService;
import com.p2p.service.LogMoneyService;
import com.p2p.service.UserMoneyService;
import com.p2p.vo.UserMoneyVO;
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
    @Autowired
    private LogMoneyService logMoneyService;
    @Autowired
    private UserMoneyService userMoneyService;

    @RequestMapping("save")
    public ServerResponse addCard(LogCz logCz){
        ServerResponse serverResponse = null;
        if(logCz!=null){
            logCz.setCreatedTime(Calendar.getInstance().getTime());
            // 将资金记录对象拿下
            LogMoney logMoney = new LogMoney();
            logMoney.setCreatedTime(Calendar.getInstance().getTime());
            logMoney.setUid(logCz.getUid());
            logMoney.setType(0);
            logMoney.setIncome(logCz.getMoney());
            logMoneyService.save(logMoney);
            UserMoneyVO userMoneyVO = new UserMoneyVO();
            userMoneyVO.setUid(logCz.getUid());
            userMoneyVO.setzMoney(logCz.getMoney());
            userMoneyVO.setKyMoney(logCz.getMoney());
            userMoneyService.save(userMoneyVO);
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

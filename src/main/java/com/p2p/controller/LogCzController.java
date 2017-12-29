package com.p2p.controller;

import com.p2p.bean.LogCz;
import com.p2p.common.ServerResponse;
import com.p2p.service.LogCzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
            logCzService.save(logCz);
            serverResponse = ServerResponse.createBySuccess();
        } else {
            serverResponse = ServerResponse.createByError();
        }
        return serverResponse;
    }

}

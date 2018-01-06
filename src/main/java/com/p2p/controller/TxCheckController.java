package com.p2p.controller;

import com.p2p.bean.LogTx;
import com.p2p.common.ServerResponse;
import com.p2p.service.TxCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Calendar;

/**
 * Created by Administrator on 2018/1/5.
 * @author ChuYiming
 */
@RestController
@RequestMapping("data/txCheck")
public class TxCheckController {
    @Autowired
    private TxCheckService txCheckService;

    @RequestMapping("txCheck")
    public ServerResponse checkStatus(LogTx logTx){
        ServerResponse serverResponse = null;
        if(logTx!=null){
            logTx.setCreatedTime(Calendar.getInstance().getTime());
            txCheckService.update(logTx);
            serverResponse = ServerResponse.createBySuccess();
        } else {
            serverResponse = ServerResponse.createByError();
        }
        return serverResponse;
    }
}

package com.p2p.service.impl;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.p2p.bean.LogMoney;
import com.p2p.bean.LogTx;
import com.p2p.bean.UserMoney;
import com.p2p.common.BankResult;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.LogMoneyMapper;
import com.p2p.dao.LogTxMapper;
import com.p2p.dao.UserMoneyMapper;
import com.p2p.service.LogTxService;
import com.p2p.utils.HttpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Calendar;


/**
 * Created by Administrator on 2017/12/22.
 *
 * @author ChuYiming
 */
@Service
public class LogTxServiceImpl extends AbstractServiceImpl implements LogTxService {
    /**
     * 提现记录 记录永远保存 不支持删除 不支持修改  允许用户管理了查看记录
     * 提现状态 1 yu 0
     */
    private LogTxMapper logTxMapper;
    private LogMoneyMapper logMoneyMapper;
    private UserMoneyMapper userMoneyMapper;

    @Autowired
    public void setLogTxMapper(LogTxMapper logTxMapper) {
        super.setBaseDAO(logTxMapper);
        this.logTxMapper = logTxMapper;
    }

    @Autowired
    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        this.logMoneyMapper = logMoneyMapper;
    }

    @Autowired
    public void setUserMoneyMapper(UserMoneyMapper userMoneyMapper) {
        this.userMoneyMapper = userMoneyMapper;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logTxMapper.listPagerCriteria(pager, obj));
        pager.setTotal(logTxMapper.countCriteria(obj));
        return pager;
    }


    @Override
    @Transactional
    public ServerResponse<Integer> save(Object obj) {
        if (obj != null) {
            LogTx logTx = (LogTx) obj;
            Object object = JSON.parseObject(HttpUtils.sendPost("http://localhost:8081/mention",
                    "realName=" + "name" + "&bank=" + "建设银行" + "&bankCardNo=" + logTx.getBankcard() + "&money=" + logTx.getMoney() + "&phone=" + "13803576897"), new TypeReference<BankResult>() {
            });
                    logTx.setCreatedTime(Calendar.getInstance().getTime());
                    // 将资金记录对象拿下
                    LogMoney logMoney = new LogMoney();
                    logMoney.setCreatedTime(Calendar.getInstance().getTime());
                    logMoney.setUid(logTx.getUid());
                    logMoney.setType(1);
                    logMoney.setOutlay(logTx.getMoney());
                    logMoneyMapper.save(logMoney);
                    UserMoney userMoney = userMoneyMapper.getUserMoney(logTx.getUid());
                    BigDecimal i = userMoney.getZmoney();
                    BigDecimal j = logTx.getMoney();
                    int k = i.compareTo(j);
                    if (k == 0 || k == 1) {
                        userMoney.setZmoney(userMoney.getZmoney().subtract(logTx.getMoney()));
                        userMoney.setKymoney(userMoney.getKymoney().subtract(logTx.getMoney()));
                        userMoneyMapper.update(userMoney);
                        logTx.setStatus(1);
                        logTxMapper.save(logTx);
                        return ServerResponse.createBySuccess("提现成功");
                    }else {
                        logTx.setStatus(0);
                        logTxMapper.save(logTx);
                        return ServerResponse.createByError("提现失败,余额不足 !");
                    }
                }
       return ServerResponse.createByError("请仔细查看所填信息!");
    }

}

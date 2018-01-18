package com.p2p.service.impl;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.p2p.bean.LogCz;
import com.p2p.bean.LogMoney;
import com.p2p.bean.UserMoney;
import com.p2p.common.BankResult;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.LogCzMapper;
import com.p2p.dao.LogMoneyMapper;
import com.p2p.dao.UserMoneyMapper;
import com.p2p.service.LogCzService;
import com.p2p.utils.HttpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;

/**
 * Created by Administrator on 2017/12/22.
 *
 * @author ChuYiming
 */
@Service
public class LogCzServiceImpl extends AbstractServiceImpl implements LogCzService {

    private LogCzMapper logCzMapper;
    private LogMoneyMapper logMoneyMapper;
    private UserMoneyMapper userMoneyMapper;

    @Autowired
    public void setLogCzMapper(LogCzMapper logCzMapper) {
        super.setBaseDAO(logCzMapper);
        this.logCzMapper = logCzMapper;
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
        pager.setRows(logCzMapper.listPagerCriteria(pager, obj));
        pager.setTotal(logCzMapper.countCriteria(obj));
        return pager;
    }

    @Override
    @Transactional
    public ServerResponse<Integer> save(Object obj) {
        if (obj!=null){
            LogCz logCz = (LogCz) obj;
            Object object = JSON.parseObject(HttpUtils.sendPost("http://localhost:8081/recharge",
                    "realName="+"name"+"&bankCardNo="+logCz.getBankcard()+"&bank="+logCz.getBanktype()+"&money="+logCz.getMoney()+"&phone="+"13803576897" ), new TypeReference<BankResult>(){});
                    logCz.setCreatedTime(Calendar.getInstance().getTime());
                    // 将资金记录对象拿下
                    LogMoney logMoney = new LogMoney();
                    logMoney.setCreatedTime(Calendar.getInstance().getTime());
                    logMoney.setUid(logCz.getUid());
                    logMoney.setType(0);
                    logMoney.setIncome(logCz.getMoney());
                    logMoneyMapper.save(logMoney);
                    UserMoney userMoney = userMoneyMapper.getUserMoney(logCz.getUid());
                    userMoney.setZmoney(userMoney.getZmoney().add(logCz.getMoney()));
                    userMoney.setKymoney(userMoney.getKymoney().add(logCz.getMoney()));
                    userMoneyMapper.update(userMoney);
                    logCzMapper.save(logCz);
                    return ServerResponse.createBySuccess("充值成功");
                }
        return ServerResponse.createByError("充值失败,余额不足");
}
}

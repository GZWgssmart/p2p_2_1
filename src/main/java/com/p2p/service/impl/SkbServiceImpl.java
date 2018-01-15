package com.p2p.service.impl;

import com.p2p.bean.Skb;
import com.p2p.bean.UserMoney;
import com.p2p.common.ServerResponse;
import com.p2p.dao.SkbMapper;
import com.p2p.dao.UserMoneyMapper;
import com.p2p.service.SkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class SkbServiceImpl extends AbstractServiceImpl implements SkbService {

    private SkbMapper skbMapper;
    private UserMoneyMapper userMoneyMapper;

    @Autowired
    public void setSkbMapper(SkbMapper skbMapper) {
        super.setBaseDAO(skbMapper);
        this.skbMapper = skbMapper;
    }

    @Autowired
    public void setUserMoneyMapper(UserMoneyMapper userMoneyMapper) {
        this.userMoneyMapper = userMoneyMapper;
    }

    @Override
    @Transactional
    public ServerResponse confirm(Skb skb) {
        UserMoney userMoney = userMoneyMapper.getUserMoney(skb.getUid());
        if(skb.getSktime().compareTo(Calendar.getInstance().getTime()) == 1) {
            return ServerResponse.createByError("未到收款时间");
        }
        userMoney.setKymoney(userMoney.getKymoney().add(skb.getYbx()));
        userMoney.setDsmoney(userMoney.getDsmoney().subtract(skb.getYbx()));
        // 更新单个
        skb.setRbj(skb.getYbj());
        skb.setRbx(skb.getYbx());
        skb.setRlx(skb.getYlx());
        skbMapper.update(skb);
        // 更新此标所有
        Skb skb1 = new Skb();
        skb1.setBaid(skb.getBaid());
        skb1.setUid(skb.getUid());
        skb1.setRnum(skb.getRnum() + 1);
        skbMapper.updateByBaid(skb1);
        return ServerResponse.createBySuccess("收款成功");
    }
}

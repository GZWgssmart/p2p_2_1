package com.p2p.service.impl;

import com.p2p.bean.Hkb;
import com.p2p.bean.UserMoney;
import com.p2p.common.ServerResponse;
import com.p2p.dao.HkbMapper;
import com.p2p.dao.UserMoneyMapper;
import com.p2p.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class HkbServiceImpl extends AbstractServiceImpl implements HkbService {

    private HkbMapper hkbMapper;
    private UserMoneyMapper userMoneyMapper;

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        super.setBaseDAO(hkbMapper);
        this.hkbMapper = hkbMapper;
    }

    @Autowired
    public void setUserMoneyMapper(UserMoneyMapper userMoneyMapper) {
        this.userMoneyMapper = userMoneyMapper;
    }

    @Override
    public ServerResponse saveList(List hkbList) {
        if(hkbMapper.saveList(hkbList) == 1) {
            ServerResponse.createBySuccess("保存成功");
        }
        return ServerResponse.createByError("保存失败");
    }

    @Override
    @Transactional
    public ServerResponse confirm(Hkb hkb) {
        UserMoney userMoney = userMoneyMapper.getUserMoney(hkb.getUid());
        if(Calendar.getInstance().getTimeInMillis() < hkb.getYtime().getTime()) {
            return ServerResponse.createByError("还未到还款时间");
        }
        if(userMoney.getKymoney().compareTo(hkb.getYbx()) == -1) {
            return ServerResponse.createByError("余额不足，请充值后操作");
        }
        userMoney.setKymoney(userMoney.getKymoney().subtract(hkb.getYbx()));
        userMoney.setZmoney(userMoney.getZmoney().subtract(hkb.getYbx()));
        userMoneyMapper.update(userMoney);
        // 更新单个
        hkb.setRbj(hkb.getYbj());
        hkb.setRbx(hkb.getYbx());
        hkb.setRlx(hkb.getYlx());
        hkb.setRtime(Calendar.getInstance().getTime());
        hkb.setStatus(1);
        hkbMapper.update(hkb);
        // 更新此标所有
        Hkb hkb1 = new Hkb();
        hkb1.setBaid(hkb.getBaid());
        hkb1.setUid(hkb.getUid());
        hkb1.setRnum(hkb.getRnum() + 1);
        hkbMapper.updateByBaid(hkb1);
        return ServerResponse.createBySuccess("收款成功");
    }
}

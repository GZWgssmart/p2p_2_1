package com.p2p.service.impl;

import com.p2p.bean.BorrowDetail;
import com.p2p.bean.Reward;
import com.p2p.bean.Tzb;
import com.p2p.bean.UserMoney;
import com.p2p.common.ServerResponse;
import com.p2p.dao.*;
import com.p2p.service.TzbService;
import com.p2p.vo.BorrowApplyDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Calendar;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService {

    private TzbMapper tzbMapper;

    private BorrowApplyMapper borrowApplyMapper;

    private BorrowDetailMapper borrowDetailMapper;

    private UserMoneyMapper userMoneyMapper;

    private RewardMapper rewardMapper;

    private RewardSettingMapper rewardSettingMapper;

    @Override
    @Transactional
    public ServerResponse<Integer> save(Object obj) {
        Tzb tzb = (Tzb)obj;
        BorrowApplyDetail bAD = (BorrowApplyDetail)borrowApplyMapper.getById(tzb.getBaid());
        if(bAD.getUid().equals(tzb.getUid())) {
            return ServerResponse.createByError("投资失败！不能给自己投资");
        }
        tzb.setJuid(bAD.getUid());
        tzb.setNprofit(bAD.getNprofit());
        tzb.setCpname(bAD.getCpname());
        tzb.setTztime(Calendar.getInstance().getTime());
        //修改投资人的资产
        UserMoney userMoney = userMoneyMapper.getUserMoney(tzb.getUid());
        if(userMoney.getKymoney().compareTo(tzb.getMoney()) == -1) {
            return ServerResponse.createByError("余额不足！请充值");
        }
        userMoney.setTzmoney(userMoney.getTzmoney().add(tzb.getMoney()));
        //获取投资总额所对应的投资奖励百分比
        Double percent = rewardSettingMapper.getPercent(userMoney.getTzmoney());
        BigDecimal rewardMoney = userMoney.getTzmoney().multiply(BigDecimal.valueOf(percent / 100));
        //添加投资奖励记录
        Reward reward = new Reward();
        reward.setMoney(rewardMoney);
        reward.setUid(tzb.getUid());
        reward.setTmoney(userMoney.getTzmoney());
        rewardMapper.save(reward);
        //修改借款详情里的已筹金额
        BorrowDetail borrowDetail = new BorrowDetail();
        borrowDetail.setBaid(tzb.getBaid());
        borrowDetail.setMoney(tzb.getMoney());
        borrowDetailMapper.update(borrowDetail);
        // 更新用户资产
        userMoney.setKymoney(userMoney.getKymoney().subtract(rewardMoney));
        userMoney.setDsmoney(userMoney.getDsmoney().add(tzb.getMoney()));
        userMoneyMapper.update(userMoney);
        //修改借款人的资产
        UserMoney juserMoney = userMoneyMapper.getUserMoney(tzb.getJuid());
        juserMoney.setZmoney(juserMoney.getZmoney().add(tzb.getMoney()));
        juserMoney.setDjmoney(juserMoney.getDjmoney().add(tzb.getMoney()));
        userMoneyMapper.update(juserMoney);
        tzbMapper.save(tzb);
        return ServerResponse.createBySuccess("投资成功");
    }

    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseDAO(tzbMapper);
        this.tzbMapper = tzbMapper;
    }

    @Autowired
    public void setBorrowApplyMapper(BorrowApplyMapper borrowApplyMapper) {
        this.borrowApplyMapper = borrowApplyMapper;
    }

    @Autowired
    public void setBorrowDetailMapper(BorrowDetailMapper borrowDetailMapper) {
        this.borrowDetailMapper = borrowDetailMapper;
    }

    @Autowired
    public void setUserMoneyMapper(UserMoneyMapper userMoneyMapper) {
        this.userMoneyMapper = userMoneyMapper;
    }

    @Autowired
    public void setRewardMapper(RewardMapper rewardMapper) {
        this.rewardMapper = rewardMapper;
    }

    @Autowired
    public void setRewardSettingMapper(RewardSettingMapper rewardSettingMapper) {
        this.rewardSettingMapper = rewardSettingMapper;
    }
}

package com.p2p.service.impl;

import com.p2p.bean.*;
import com.p2p.common.Constants;
import com.p2p.common.ServerResponse;
import com.p2p.dao.*;
import com.p2p.enums.BorrowStatusEnum;
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
        tzbMapper.save(tzb);
        //修改投资人的资产
        UserMoney userMoney = userMoneyMapper.getUserMoney(tzb.getUid());
        //可用余额小于投资金额
        if(userMoney.getKymoney().compareTo(tzb.getMoney()) == -1) {
            return ServerResponse.createByError("余额不足！请充值");
        }
        userMoney.setTzmoney(userMoney.getTzmoney().add(tzb.getMoney()));
        //获取投资总额所对应的投资奖励百分比
        Double percent = rewardSettingMapper.getPercent(userMoney.getTzmoney());
        BigDecimal rewardMoney = userMoney.getTzmoney().multiply(BigDecimal.valueOf(percent / 100)).setScale(2, BigDecimal.ROUND_HALF_UP);
        //添加投资奖励记录
        Reward reward = new Reward();
        reward.setMoney(rewardMoney);
        reward.setUid(tzb.getUid());
        reward.setTmoney(userMoney.getTzmoney());
        rewardMapper.save(reward);
        // 更新用户资产
        userMoney.setKymoney(userMoney.getKymoney().subtract(tzb.getMoney()));
        //用户待收总额等于原待收加（投资乘以（年利率+1））   .setScale(2, BigDecimal.ROUND_HALF_UP)设置精度为两位小数点
        userMoney.setDsmoney(userMoney.getDsmoney().add(tzb.getMoney().multiply(BigDecimal.valueOf(bAD.getNprofit()/100 + 1)).setScale(2, BigDecimal.ROUND_HALF_UP)));
        //用户收益总额等于原收益总额加（投资乘以年利率）
        userMoney.setSymoney(userMoney.getSymoney().add(tzb.getMoney().multiply(BigDecimal.valueOf(bAD.getNprofit()/100)).setScale(2, BigDecimal.ROUND_HALF_UP)));
        // 用户总资产等于原先总资产加投资收益
        userMoney.setZmoney(userMoney.getZmoney().add(tzb.getMoney().multiply(BigDecimal.valueOf(bAD.getNprofit()/100)).setScale(2, BigDecimal.ROUND_HALF_UP)));
        userMoneyMapper.update(userMoney);
        // 如果已筹金额等于目标金额,则更新借款表中的状态为还款中、更新借款人冻结金额为可用余额
        BorrowDetail borrowDetail = new BorrowDetail();
        //修改借款人的资产
        UserMoney juserMoney = userMoneyMapper.getUserMoney(tzb.getJuid());
        juserMoney.setZmoney(juserMoney.getZmoney().add(tzb.getMoney()));
        if((bAD.getMoneyCount().add(tzb.getMoney())).compareTo(bAD.getMoney()) == 0) {
            BorrowApply borrowApply = new BorrowApply();
            borrowApply.setBaid(tzb.getBaid());
            borrowApply.setCkstatus(BorrowStatusEnum.REPAYMENT.getCode());
            borrowApplyMapper.update(borrowApply);
            //满标时将借款人的冻结金额变成可用余额
            juserMoney.setDjmoney(juserMoney.getDjmoney().add(tzb.getMoney()).subtract(bAD.getMoney()));
            juserMoney.setKymoney(juserMoney.getKymoney().add(bAD.getMoney()));
        } else {
            juserMoney.setDjmoney(juserMoney.getDjmoney().add(tzb.getMoney()));
        }
        userMoneyMapper.update(juserMoney);
        //修改借款详情里的已筹金额
        borrowDetail.setBaid(tzb.getBaid());
        borrowDetail.setMoney(bAD.getMoneyCount().add(tzb.getMoney()));
        borrowDetailMapper.update(borrowDetail);
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

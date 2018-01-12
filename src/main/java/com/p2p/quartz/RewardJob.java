package com.p2p.quartz;

import com.p2p.bean.Reward;
import com.p2p.bean.UserMoney;
import com.p2p.dao.RewardMapper;
import com.p2p.dao.UserMoneyMapper;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by 7025 on 2018/1/12.
 * 奖励发放的定时任务
 */
@Component
public class RewardJob implements Job {

    @Autowired
    private RewardMapper rewardMapper;
    @Autowired
    private UserMoneyMapper userMoneyMapper;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        // 查出所有未发放奖励的用户
        List<Reward> rewards = rewardMapper.getAllReward();
        // 更新奖励发放状态为已发放
        rewardMapper.batchUpdate(rewards);
        for(Reward reward : rewards) {
            // 如果奖励金额大于0
            if(reward.getMoney().compareTo(BigDecimal.valueOf(0))==1) {
                // 获取用户资金
                UserMoney userMoney = userMoneyMapper.getUserMoney(reward.getUid());
                userMoney.setZmoney(userMoney.getZmoney().add(reward.getMoney()));
                userMoney.setKymoney(userMoney.getKymoney().add(reward.getMoney()));
                userMoney.setJlmoney(userMoney.getJlmoney().add(reward.getMoney()));
                // 插入新的奖励记录
                reward = new Reward();
                reward.setUid(userMoney.getUid());
                rewardMapper.save(reward);
            }
        }
    }
}

package com.p2p.quartz;

import com.p2p.bean.Reward;
import com.p2p.bean.UserMoney;
import com.p2p.service.RewardService;
import com.p2p.service.UserMoneyService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by 7025 on 2018/1/12.
 * 奖励发放的定时任务
 */
public class RewardJob implements Job {

    private RewardService rewardService;
    private UserMoneyService userMoneyService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        rewardService = (RewardService) jobExecutionContext.getJobDetail().getJobDataMap().get("rewardService");
        userMoneyService = (UserMoneyService) jobExecutionContext.getJobDetail().getJobDataMap().get("userMoneyService");
        // 查出所有未发放奖励的用户
        List<Reward> rewards = rewardService.getAllReward();
        // 更新奖励发放状态为已发放
        if(rewards != null && rewards.size() > 0) {
            rewardService.batchUpdate(rewards);
            for(Reward reward : rewards) {
                // 如果奖励金额大于0
                if(reward.getMoney().compareTo(BigDecimal.valueOf(0))==1) {
                    // 获取用户资金
                    UserMoney userMoney = userMoneyService.getUserMoney(reward.getUid());
                    userMoney.setZmoney(userMoney.getZmoney().add(reward.getMoney()));
                    userMoney.setKymoney(userMoney.getKymoney().add(reward.getMoney()));
                    userMoney.setJlmoney(userMoney.getJlmoney().add(reward.getMoney()));
                    userMoneyService.update(userMoney);
                }
            }
        }
    }
}

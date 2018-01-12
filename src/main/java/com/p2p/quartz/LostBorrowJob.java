package com.p2p.quartz;

import com.p2p.bean.Reward;
import com.p2p.bean.UserMoney;
import com.p2p.dao.*;
import com.p2p.enums.BorrowStatusEnum;
import com.p2p.service.impl.TzbServiceImpl;
import com.p2p.vo.BorrowingVO;
import com.p2p.vo.TzCountVO;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2018/1/12.
 * 检测是否已经流标
 * 每天凌晨自动执行
 */
@Component
public class LostBorrowJob implements Job {

    @Autowired
    private BorrowApplyMapper borrowApplyMapper;
    @Autowired
    private TzbMapper tzbMapper;
    @Autowired
    private UserMoneyMapper userMoneyMapper;
    @Autowired
    private RewardMapper rewardMapper;
    @Autowired
    private RewardSettingMapper rewardSettingMapper;


    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        // 查出所有投标中的标
        List<BorrowingVO> borrowingVOS = borrowApplyMapper.borrowingList();
        BigDecimal syMoney = BigDecimal.valueOf(0);
        for(BorrowingVO borrowingVO : borrowingVOS) {
            // 如果标的截止时间小于当前时间，则流标
            if(borrowingVO.getDeadline().compareTo(Calendar.getInstance().getTime()) == -1) {
                //更新借款状态为已流标
                borrowApplyMapper.updateChecked(borrowingVO.getBaid(), BorrowStatusEnum.BORROW_FAIL.getCode(), borrowingVO.getCktime());
                // 将借款人的冻结金额减去已筹金额，总资产减去已筹金额
                UserMoney juserMoney = userMoneyMapper.getUserMoney(borrowingVO.getJuid());
                juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(borrowingVO.getMoneyCount()));
                juserMoney.setZmoney(juserMoney.getZmoney().subtract(borrowingVO.getMoneyCount()));
                userMoneyMapper.update(juserMoney);
                // 将原先所有投资人的投资金额减去投资金额，待收总额减去收益，可用余额增加投资金额，总资产减利息，收益总额减去利息
                List<TzCountVO> tzCounts = tzbMapper.getTotalTzMoney(borrowingVO.getBaid());
                for(TzCountVO tzCount : tzCounts) {
                    // 算出投资利息
                    syMoney = TzbServiceImpl.getSyMoney(borrowingVO.getWay(), tzCount.getTotalMoney(), borrowingVO.getTerm(), borrowingVO.getNprofit());
                    UserMoney userMoney1 = userMoneyMapper.getUserMoney(tzCount.getUid());
                    // 获取投资总额对应的投资奖励额度
                    Double percent = rewardSettingMapper.getPercent(userMoney1.getTzmoney());
                    userMoney1.setTzmoney(userMoney1.getTzmoney().subtract(tzCount.getTotalMoney()));
                    userMoney1.setDsmoney(userMoney1.getDsmoney().subtract(syMoney.add(tzCount.getTotalMoney())));
                    userMoney1.setKymoney(userMoney1.getKymoney().add(tzCount.getTotalMoney()));
                    userMoney1.setZmoney(userMoney1.getZmoney().subtract(syMoney));
                    userMoney1.setSymoney(userMoney1.getSymoney().subtract(syMoney));
                    userMoneyMapper.update(userMoney1);
                    // 减去投资奖励
                    Reward reward = rewardMapper.getByUid(tzCount.getUid());
                    reward.setTmoney(reward.getTmoney().subtract(tzCount.getTotalMoney()));
                    // 重新计算投资奖励
                    BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                            .setScale(2, BigDecimal.ROUND_HALF_UP);
                    reward.setMoney(rewardMoney);
                    rewardMapper.update(reward);
                }
            }
        }
    }
}

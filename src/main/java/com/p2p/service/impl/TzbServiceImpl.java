package com.p2p.service.impl;

import com.p2p.bean.*;
import com.p2p.calc.*;
import com.p2p.common.BeanCopyUtils;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.*;
import com.p2p.enums.BorrowStatusEnum;
import com.p2p.enums.HKStatusEnum;
import com.p2p.enums.WayEnum;
import com.p2p.service.TzbService;
import com.p2p.vo.BorrowApplyDetail;
import com.p2p.vo.TzCountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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

    private HkbMapper hkbMapper;

    private ShborrowMapper shborrowMapper;

    private UserTicketMapper userTicketMapper;

    private TicketMapper ticketMapper;

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(tzbMapper.listPagerCriteria(pager, obj));
        pager.setTotal(tzbMapper.countCriteria(obj));
        return pager;
    }

    @Override
    public Pager getUserInvest(Integer page, Integer limit, Object obj) {
        Pager pager = new Pager(page, limit);
        pager.setRows(tzbMapper.getUserInvest(pager, obj));
        pager.setTotal(tzbMapper.countUserInvest(obj));
        return pager;
    }

    @Override
    public List<TzCountVO> getTotalTzMoney(Integer baid) {
        return tzbMapper.getTotalTzMoney(baid);
    }

    @Override
    @Transactional
    public ServerResponse<Integer> save(Object obj) {
        Tzb tzb = (Tzb)obj;
        BorrowApplyDetail bAD = (BorrowApplyDetail)borrowApplyMapper.getById(tzb.getBaid());
        if(bAD.getUid().equals(tzb.getUid())) {
            return ServerResponse.createByError("投资失败！不能给自己投资");
        }
        //如果已经满标
        if(bAD.getMoneyCount().compareTo(bAD.getMoney()) == 0) {
            return ServerResponse.createByError("已满标");
        }
        // 查出投资人的资产
        UserMoney userMoney = userMoneyMapper.getUserMoney(tzb.getUid());
        //可用余额小于投资金额
        if(userMoney.getKymoney().compareTo(tzb.getMoney()) == -1) {
            return ServerResponse.createByError("余额不足！请充值");
        }
        // 查出借款人的资产
        UserMoney juserMoney = userMoneyMapper.getUserMoney(bAD.getUid());
        BigDecimal syMoney = BigDecimal.valueOf(0);
        // 如果投标时间超过截止时间,则流标
        if(bAD.getDeadline().compareTo(Calendar.getInstance().getTime()) == -1) {
            //更新借款状态为已流标
            borrowApplyMapper.updateChecked(tzb.getBaid(), BorrowStatusEnum.BORROW_FAIL.getCode(), bAD.getCktime());
            // 将借款人的冻结金额减去已筹金额，总资产减去已筹金额
            juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(bAD.getMoneyCount()));
            juserMoney.setZmoney(juserMoney.getZmoney().subtract(bAD.getMoneyCount()));
            userMoneyMapper.update(juserMoney);
            // 将原先所有投资人的投资金额减去投资金额，待收总额减去收益，可用余额增加投资金额，总资产减利息，收益总额减去利息
            List<TzCountVO> tzCounts = tzbMapper.getTotalTzMoney(tzb.getBaid());
            for(TzCountVO tzCount : tzCounts) {
                syMoney = getSyMoney(bAD.getWay(), tzCount.getTotalMoney(), bAD.getTerm(), bAD.getNprofit());
                UserMoney userMoney1 = userMoneyMapper.getUserMoney(tzCount.getUid());
                Double percent = rewardSettingMapper.getPercent(userMoney1.getTzmoney());
                userMoney1.setTzmoney(userMoney1.getTzmoney().subtract(tzCount.getTotalMoney()));
                userMoney1.setDsmoney(userMoney1.getDsmoney().subtract(syMoney.add(tzCount.getTotalMoney())));
                userMoney1.setKymoney(userMoney1.getKymoney().add(tzCount.getTotalMoney()));
                userMoney1.setZmoney(userMoney1.getZmoney().subtract(syMoney));
                userMoney1.setSymoney(userMoney1.getSymoney().subtract(syMoney));
                userMoneyMapper.update(userMoney1);
                // 减去投资奖励
                Reward reward = rewardMapper.getByUid(tzb.getUid());
                reward.setTmoney(reward.getTmoney().subtract(tzCount.getTotalMoney()));
                BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                        .setScale(2, BigDecimal.ROUND_HALF_UP);
                reward.setMoney(rewardMoney);
                rewardMapper.update(reward);
            }
            return ServerResponse.createByError("投标已截止");
        }
        tzb.setJuid(bAD.getUid());
        tzb.setNprofit(bAD.getNprofit());
        tzb.setCpname(bAD.getCpname());
        tzb.setTztime(Calendar.getInstance().getTime());
        Integer ukid = tzb.getResint2();
        tzb.setResint2(Integer.valueOf(bAD.getWay()));
        tzbMapper.save(tzb);
        // tzb.getResint1()为还款期数
        Integer month = tzb.getResint1();
        //用户券id 用户如果使用券，则把券删除
        BigDecimal ticketMoney = BigDecimal.valueOf(0);
        if(ukid != null && ukid != 0) {
            UserTicket userTicket = (UserTicket) userTicketMapper.getById(ukid);
            Ticket ticket = (Ticket)ticketMapper.getById(userTicket.getKid());
            ticketMoney = ticket.getTkmoney();
            userTicketMapper.removeById(ukid);
        }
        //修改投资人的资产
        userMoney.setTzmoney(userMoney.getTzmoney().add(tzb.getMoney()));
        //获取投资总额所对应的投资奖励百分比
        Double percent = rewardSettingMapper.getPercent(userMoney.getTzmoney());
        //添加投资奖励记录
        Reward reward = rewardMapper.getByUid(tzb.getUid());
        if(reward == null) {
            reward = new Reward();
            reward.setTmoney(tzb.getMoney());
            BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
            reward.setMoney(rewardMoney);
            reward.setUid(tzb.getUid());
            rewardMapper.save(reward);
        } else {
            reward.setTmoney(reward.getTmoney().add(tzb.getMoney()));
            BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
            reward.setMoney(rewardMoney);
            rewardMapper.update(reward);
        }
        // 更新用户资产 可用余额减（投资总额减券价值）
        userMoney.setKymoney(userMoney.getKymoney().subtract(tzb.getMoney().subtract(ticketMoney)));
        //初始化收益
        Float yearNpro = bAD.getNprofit();
        //月利率
        Float monthNpro = yearNpro / 12;
        // 获取用户总利息
        syMoney = getSyMoney(bAD.getWay(), tzb.getMoney(), month, yearNpro);
        //用户待收总额等于原待收加（投资加用户利息收益）   .setScale(2, BigDecimal.ROUND_HALF_UP)设置精度为两位小数点
        userMoney.setDsmoney(userMoney.getDsmoney().add(tzb.getMoney().add(syMoney)));
        //用户收益总额等于原收益总额加（用户利息）
        userMoney.setSymoney(userMoney.getSymoney().add(syMoney));
        // 用户总资产等于原先总资产加投资利息
        userMoney.setZmoney(userMoney.getZmoney().add(syMoney).add(ticketMoney));
        userMoneyMapper.update(userMoney);
        // 如果已筹金额等于目标金额,则更新借款表中的状态为还款中、更新借款人冻结金额为可用余额
        BorrowDetail borrowDetail = new BorrowDetail();
        //修改借款人的资产
        juserMoney.setZmoney(juserMoney.getZmoney().add(tzb.getMoney()));
        juserMoney.setDjmoney(juserMoney.getDjmoney().add(tzb.getMoney()));
        //如果已经满标
        if((bAD.getMoneyCount().add(tzb.getMoney())).compareTo(bAD.getMoney()) == 0) {
            BorrowApply borrowApply = new BorrowApply();
            borrowApply.setBaid(tzb.getBaid());
            borrowApply.setCkstatus(BorrowStatusEnum.REPAYMENT.getCode());
            borrowApplyMapper.update(borrowApply);
            //满标时将借款人的冻结金额变成可用余额
            juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(bAD.getMoney()));
            juserMoney.setKymoney(juserMoney.getKymoney().add(bAD.getMoney()));
            // 生成还款清单
            //查找贷后负责人id
            Integer huid = shborrowMapper.getIdByBaid(tzb.getBaid());
            //一次还清的还款清单
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(Calendar.getInstance().getTime());
            if(bAD.getWay().equals(WayEnum.PAYOFF_ONCE.getCode())) {
                Hkb hkb = new Hkb();
                try {
                    BeanCopyUtils.copy(hkb, bAD);
                    hkb.setYbj(bAD.getMoney());
                    hkb.setYlx(syMoney);
                    hkb.setYbx(bAD.getMoney().add(syMoney));
                    hkb.setTnum(1);
                    calendar.add(Calendar.MONTH, month);
                    hkb.setYtime(calendar.getTime());
                    hkb.setHuid(huid);
                    hkb.setBaid(tzb.getBaid());
                    hkbMapper.save(hkb);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                List<Hkb> hkbList = new ArrayList<>();
                for(int i = 1; i <= month; i++) {
                    Hkb hkb = new Hkb();
                    try {
                        //拷贝uid,cpname,rname,bzname字段的值
                        BeanCopyUtils.copy(hkb, bAD);
                        hkb.setStatus(HKStatusEnum.UNREPAY.getCode());
                        hkb.setHuid(huid);
                        hkb.setTnum(month);
                        calendar.add(Calendar.MONTH, 1);
                        hkb.setYtime(calendar.getTime());
                        //每月利息金额
                        BigDecimal bigMonthNpro = BigDecimal.valueOf(monthNpro/100);
                        //先息后本还款表
                        if(bAD.getWay().equals(WayEnum.XIAN_XI.getCode())) {
                            //每月利息等于总借款乘以月利率
                            hkb.setYlx(bAD.getMoney().multiply(bigMonthNpro));
                            hkb.setYbj(BigDecimal.valueOf(0));
                            //最后一个月还本金加利息
                            if(i == month) {
                                //应还本金
                                hkb.setYbj(bAD.getMoney());
                            }
                        }
                        // 等额本金还款算法
                        else if(bAD.getWay().equals(WayEnum.EQUAL_BJ.getCode())) {
                            LoanByMonth loanByMonth = new ACMLoanCalculator().calLoan(bAD.getMoney(), month, yearNpro, LoanUtil.RATE_TYPE_YEAR)
                                    .getAllLoans().get(i-1);
                            // 月还本金
                            hkb.setYbj(loanByMonth.getPayPrincipal());
                            // 月利息
                            hkb.setYlx(loanByMonth.getInterest());

                        }
                        // 等额本息还款算法
                        else if(bAD.getWay().equals(WayEnum.EQUAL_BX.getCode())) {
                            LoanByMonth loanByMonth = new ACPIMLoanCalculator().calLoan(bAD.getMoney(), month, yearNpro, LoanUtil.RATE_TYPE_YEAR)
                                    .getAllLoans().get(i-1);
                            //每月利息
                            hkb.setYlx(loanByMonth.getInterest());
                            //每月还款本金
                            hkb.setYbj(loanByMonth.getPayPrincipal());
                        }
                        hkb.setYbx(hkb.getYlx().add(hkb.getYbj()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    hkb.setBaid(tzb.getBaid());
                    hkbList.add(hkb);
                }
                //批量保存
                hkbMapper.saveList(hkbList);
            }
        }
        userMoneyMapper.update(juserMoney);
        //修改借款详情里的已筹金额
        borrowDetail.setBaid(tzb.getBaid());
        borrowDetail.setMoney(bAD.getMoneyCount().add(tzb.getMoney()));
        borrowDetailMapper.update(borrowDetail);
        return ServerResponse.createBySuccess("投资成功");
    }

    /**
     * 计算用户投资利息
     * @param way 计息方式
     * @param tzMoney 投资金额
     * @param month 回款月数
     * @param yearNpro 年利率
     * @return 利息
     */
    public static BigDecimal getSyMoney(String way, BigDecimal tzMoney, Integer month, Float yearNpro) {
        //一次还清和先息后本的用户收益计息方式
        if(way.equals(WayEnum.PAYOFF_ONCE.getCode())|| way.equals(WayEnum.XIAN_XI.getCode())) {
            //投资金额乘以年利率
            return tzMoney.multiply(BigDecimal.valueOf(yearNpro/100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        // 等额本金的用户收益计息
        if(way.equals(WayEnum.EQUAL_BJ.getCode())) {
            return new ACMLoanCalculator().calLoan(tzMoney, month, yearNpro, LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        //等额本息的用户收益计息
        if(way.equals(WayEnum.EQUAL_BX.getCode())) {
            return new ACPIMLoanCalculator().calLoan(tzMoney, month,yearNpro,LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        return BigDecimal.valueOf(0);
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

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        this.hkbMapper = hkbMapper;
    }

    @Autowired
    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        this.shborrowMapper = shborrowMapper;
    }

    @Autowired
    public void setTicketMapper(TicketMapper ticketMapper) {
        this.ticketMapper = ticketMapper;
    }

    @Autowired
    public void setUserTicketMapper(UserTicketMapper userTicketMapper) {
        this.userTicketMapper = userTicketMapper;
    }
}

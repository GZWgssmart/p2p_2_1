package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应投资奖励总额
 */
public class Reward {
    private Integer rwid;

    private Integer uid;

    private BigDecimal tmoney;

    private BigDecimal money;

    private String status;

    private Date rewardTime;

    public Reward(Integer rwid, Integer uid, BigDecimal tmoney, BigDecimal money, String status, Date rewardTime) {
        this.rwid = rwid;
        this.uid = uid;
        this.tmoney = tmoney;
        this.money = money;
        this.status = status;
        this.rewardTime = rewardTime;
    }

    public Reward() {
        super();
    }

    public Integer getRwid() {
        return rwid;
    }

    public void setRwid(Integer rwid) {
        this.rwid = rwid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getRewardTime() {
        return rewardTime;
    }

    public void setRewardTime(Date rewardTime) {
        this.rewardTime = rewardTime;
    }
}
package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应资金流向记录
 */
public class LogMoney {
    private Integer lmid;

    private Integer uid;

    private Integer type;

    private BigDecimal income;

    private BigDecimal outlay;

    private Date createdTime;

    public LogMoney(Integer lmid, Integer uid, Integer type, BigDecimal income, BigDecimal outlay, Date createdTime) {
        this.lmid = lmid;
        this.uid = uid;
        this.type = type;
        this.income = income;
        this.outlay = outlay;
        this.createdTime = createdTime;
    }

    public LogMoney() {
        super();
    }

    public Integer getLmid() {
        return lmid;
    }

    public void setLmid(Integer lmid) {
        this.lmid = lmid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getIncome() {
        return income;
    }

    public void setIncome(BigDecimal income) {
        this.income = income;
    }

    public BigDecimal getOutlay() {
        return outlay;
    }

    public void setOutlay(BigDecimal outlay) {
        this.outlay = outlay;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应充值日志
 */
public class LogCz {
    private Integer czid;

    private Integer uid;

    private String bankcard;

    private String banktype;

    private BigDecimal money;

    private Date createdTime;

    private Integer status;

    public LogCz(Integer czid, Integer uid, String bankcard, String banktype, BigDecimal money, Date createdTime, Integer status) {
        this.czid = czid;
        this.uid = uid;
        this.bankcard = bankcard;
        this.banktype = banktype;
        this.money = money;
        this.createdTime = createdTime;
        this.status = status;
    }

    public LogCz() {
        super();
    }

    public Integer getCzid() {
        return czid;
    }

    public void setCzid(Integer czid) {
        this.czid = czid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getBankcard() {
        return bankcard;
    }

    public void setBankcard(String bankcard) {
        this.bankcard = bankcard == null ? null : bankcard.trim();
    }

    public String getBanktype() {
        return banktype;
    }

    public void setBanktype(String banktype) {
        this.banktype = banktype == null ? null : banktype.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
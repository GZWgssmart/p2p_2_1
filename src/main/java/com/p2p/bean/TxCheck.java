package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应提现审核
 */
public class TxCheck {
    private Integer tcid;

    private Integer txid;

    private Integer huid;

    private Integer isok;

    private String excuse;

    private Date createdTime;

    public TxCheck(Integer tcid, Integer txid, Integer huid, Integer isok, String excuse, Date createdTime) {
        this.tcid = tcid;
        this.txid = txid;
        this.huid = huid;
        this.isok = isok;
        this.excuse = excuse;
        this.createdTime = createdTime;
    }

    public TxCheck() {
        super();
    }

    public Integer getTcid() {
        return tcid;
    }

    public void setTcid(Integer tcid) {
        this.tcid = tcid;
    }

    public Integer getTxid() {
        return txid;
    }

    public void setTxid(Integer txid) {
        this.txid = txid;
    }

    public Integer getHuid() {
        return huid;
    }

    public void setHuid(Integer huid) {
        this.huid = huid;
    }

    public Integer getIsok() {
        return isok;
    }

    public void setIsok(Integer isok) {
        this.isok = isok;
    }

    public String getExcuse() {
        return excuse;
    }

    public void setExcuse(String excuse) {
        this.excuse = excuse == null ? null : excuse.trim();
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
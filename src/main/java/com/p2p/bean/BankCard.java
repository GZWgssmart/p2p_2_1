package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应银行卡表
 */
public class BankCard {
    private Integer bcid;

    private Integer uid;

    private String cardno;

    private String rname;

    private String idno;

    private String type;

    private Integer status;

    private Date bktime;

    public BankCard(Integer bcid, Integer uid, String cardno, String rname, String idno, String type, Integer status, Date bktime) {
        this.bcid = bcid;
        this.uid = uid;
        this.cardno = cardno;
        this.rname = rname;
        this.idno = idno;
        this.type = type;
        this.status = status;
        this.bktime = bktime;
    }

    public BankCard() {
        super();
    }

    public Integer getBcid() {
        return bcid;
    }

    public void setBcid(Integer bcid) {
        this.bcid = bcid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno == null ? null : cardno.trim();
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno == null ? null : idno.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getBktime() {
        return bktime;
    }

    public void setBktime(Date bktime) {
        this.bktime = bktime;
    }
}
package com.p2p.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2018/1/10.
 * 投资记录的vo
 */
public class LogTzVO {
    private Integer tzid;
    private String rname;
    private Integer uid;
    private Double nprofit;
    private Integer term;
    private String cpname;
    private Integer baid;
    private BigDecimal money;
    private Date tztime;
    private Integer ckstatus;

    public Integer getTzid() {
        return tzid;
    }

    public void setTzid(Integer tzid) {
        this.tzid = tzid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Double getNprofit() {
        return nprofit;
    }

    public void setNprofit(Double nprofit) {
        this.nprofit = nprofit;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getTztime() {
        return tztime;
    }

    public void setTztime(Date tztime) {
        this.tztime = tztime;
    }

    public Integer getCkstatus() {
        return ckstatus;
    }

    public void setCkstatus(Integer ckstatus) {
        this.ckstatus = ckstatus;
    }
}

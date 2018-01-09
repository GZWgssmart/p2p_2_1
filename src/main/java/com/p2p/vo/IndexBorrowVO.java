package com.p2p.vo;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2018/1/8.
 * 首页显示借款时使用的vo对象
 */
public class IndexBorrowVO {
    private Integer baid;
    private String cpname;
    private Double nprofit;
    private BigDecimal money;
    private BigDecimal moneyCount;
    private Integer term;
    private Integer ckstatus;
    private Integer bzid;

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public Double getNprofit() {
        return nprofit;
    }

    public void setNprofit(Double nprofit) {
        this.nprofit = nprofit;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getMoneyCount() {
        return moneyCount;
    }

    public void setMoneyCount(BigDecimal moneyCount) {
        this.moneyCount = moneyCount;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getCkstatus() {
        return ckstatus;
    }

    public void setCkstatus(Integer ckstatus) {
        this.ckstatus = ckstatus;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }
}

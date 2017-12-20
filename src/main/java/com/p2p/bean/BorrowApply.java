package com.p2p.bean;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应申请借款
 */
public class BorrowApply {
    private Integer baid;

    private String rname;

    private Integer money;

    private Integer uid;

    private Integer bzid;

    private Date cktime;

    private Integer ckstatus;

    private Integer type;

    private Integer term;

    private Date deadline;

    private Integer resint1;

    private Integer resint2;

    private String resstr1;

    private String resstr2;

    public BorrowApply(Integer baid, String rname, Integer money, Integer uid, Integer bzid, Date cktime, Integer ckstatus, Integer type, Integer term, Date deadline, Integer resint1, Integer resint2, String resstr1, String resstr2) {
        this.baid = baid;
        this.rname = rname;
        this.money = money;
        this.uid = uid;
        this.bzid = bzid;
        this.cktime = cktime;
        this.ckstatus = ckstatus;
        this.type = type;
        this.term = term;
        this.deadline = deadline;
        this.resint1 = resint1;
        this.resint2 = resint2;
        this.resstr1 = resstr1;
        this.resstr2 = resstr2;
    }

    public BorrowApply() {
        super();
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public Date getCktime() {
        return cktime;
    }

    public void setCktime(Date cktime) {
        this.cktime = cktime;
    }

    public Integer getCkstatus() {
        return ckstatus;
    }

    public void setCkstatus(Integer ckstatus) {
        this.ckstatus = ckstatus;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Integer getResint1() {
        return resint1;
    }

    public void setResint1(Integer resint1) {
        this.resint1 = resint1;
    }

    public Integer getResint2() {
        return resint2;
    }

    public void setResint2(Integer resint2) {
        this.resint2 = resint2;
    }

    public String getResstr1() {
        return resstr1;
    }

    public void setResstr1(String resstr1) {
        this.resstr1 = resstr1 == null ? null : resstr1.trim();
    }

    public String getResstr2() {
        return resstr2;
    }

    public void setResstr2(String resstr2) {
        this.resstr2 = resstr2 == null ? null : resstr2.trim();
    }
}
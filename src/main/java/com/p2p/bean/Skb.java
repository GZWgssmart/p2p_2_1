package com.p2p.bean;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应收款表
 */
public class Skb {
    private Integer skid;

    private Integer uid;

    private Integer juid;

    private BigDecimal ybx;

    private BigDecimal rbx;

    private BigDecimal ylx;

    private BigDecimal rlx;

    private BigDecimal ybj;

    private BigDecimal rbj;

    private Integer rnum;

    private Integer tnum;

    private Date sktime;

    private Integer baid;

    private Integer resint1;

    private Integer resint2;

    private String resstr1;

    private String resstr2;

    public Skb(Integer skid, Integer uid, Integer juid, BigDecimal ybx, BigDecimal rbx, BigDecimal ylx, BigDecimal rlx, BigDecimal ybj, BigDecimal rbj, Integer rnum, Integer tnum, Date sktime, Integer baid, Integer resint1, Integer resint2, String resstr1, String resstr2) {
        this.skid = skid;
        this.uid = uid;
        this.juid = juid;
        this.ybx = ybx;
        this.rbx = rbx;
        this.ylx = ylx;
        this.rlx = rlx;
        this.ybj = ybj;
        this.rbj = rbj;
        this.rnum = rnum;
        this.tnum = tnum;
        this.sktime = sktime;
        this.baid = baid;
        this.resint1 = resint1;
        this.resint2 = resint2;
        this.resstr1 = resstr1;
        this.resstr2 = resstr2;
    }

    public Skb() {
        super();
    }

    public Integer getSkid() {
        return skid;
    }

    public void setSkid(Integer skid) {
        this.skid = skid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getJuid() {
        return juid;
    }

    public void setJuid(Integer juid) {
        this.juid = juid;
    }

    public BigDecimal getYbx() {
        return ybx;
    }

    public void setYbx(BigDecimal ybx) {
        this.ybx = ybx;
    }

    public BigDecimal getRbx() {
        return rbx;
    }

    public void setRbx(BigDecimal rbx) {
        this.rbx = rbx;
    }

    public BigDecimal getYlx() {
        return ylx;
    }

    public void setYlx(BigDecimal ylx) {
        this.ylx = ylx;
    }

    public BigDecimal getRlx() {
        return rlx;
    }

    public void setRlx(BigDecimal rlx) {
        this.rlx = rlx;
    }

    public BigDecimal getYbj() {
        return ybj;
    }

    public void setYbj(BigDecimal ybj) {
        this.ybj = ybj;
    }

    public BigDecimal getRbj() {
        return rbj;
    }

    public void setRbj(BigDecimal rbj) {
        this.rbj = rbj;
    }

    public Integer getRnum() {
        return rnum;
    }

    public void setRnum(Integer rnum) {
        this.rnum = rnum;
    }

    public Integer getTnum() {
        return tnum;
    }

    public void setTnum(Integer tnum) {
        this.tnum = tnum;
    }

    public Date getSktime() {
        return sktime;
    }

    public void setSktime(Date sktime) {
        this.sktime = sktime;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
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
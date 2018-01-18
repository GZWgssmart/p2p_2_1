package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应运营数据
 */
public class Ydata {
    private Integer yid;

    private BigDecimal tmoney;

    private BigDecimal mmoney;

    private Integer tuser;

    private Integer muser;

    private Integer ttzno;

    private Integer mtzno;

    private Integer tdkno;

    private Integer mdkno;

    private Integer tdkbno;

    private Integer mdkbno;

    private Date createdTime;

    public Ydata(Integer yid, BigDecimal tmoney, BigDecimal mmoney, Integer tuser, Integer muser, Integer ttzno, Integer mtzno, Integer tdkno, Integer mdkno, Integer tdkbno, Integer mdkbno, Date createdTime) {
        this.yid = yid;
        this.tmoney = tmoney;
        this.mmoney = mmoney;
        this.tuser = tuser;
        this.muser = muser;
        this.ttzno = ttzno;
        this.mtzno = mtzno;
        this.tdkno = tdkno;
        this.mdkno = mdkno;
        this.tdkbno = tdkbno;
        this.mdkbno = mdkbno;
        this.createdTime = createdTime;
    }

    public Ydata() {
        super();
    }

    public Integer getYid() {
        return yid;
    }

    public void setYid(Integer yid) {
        this.yid = yid;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public BigDecimal getMmoney() {
        return mmoney;
    }

    public void setMmoney(BigDecimal mmoney) {
        this.mmoney = mmoney;
    }

    public Integer getTuser() {
        return tuser;
    }

    public void setTuser(Integer tuser) {
        this.tuser = tuser;
    }

    public Integer getMuser() {
        return muser;
    }

    public void setMuser(Integer muser) {
        this.muser = muser;
    }

    public Integer getTtzno() {
        return ttzno;
    }

    public void setTtzno(Integer ttzno) {
        this.ttzno = ttzno;
    }

    public Integer getMtzno() {
        return mtzno;
    }

    public void setMtzno(Integer mtzno) {
        this.mtzno = mtzno;
    }

    public Integer getTdkno() {
        return tdkno;
    }

    public void setTdkno(Integer tdkno) {
        this.tdkno = tdkno;
    }

    public Integer getMdkno() {
        return mdkno;
    }

    public void setMdkno(Integer mdkno) {
        this.mdkno = mdkno;
    }

    public Integer getTdkbno() {
        return tdkbno;
    }

    public void setTdkbno(Integer tdkbno) {
        this.tdkbno = tdkbno;
    }

    public Integer getMdkbno() {
        return mdkbno;
    }

    public void setMdkbno(Integer mdkbno) {
        this.mdkbno = mdkbno;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应还款表
 */
public class Hkb {
    private Integer hkid;

    private Integer uid;

    private String rname;

    private String cpname;

    private Integer rnum;

    private Integer tnum;

    private Date ytime;

    private Date rtime;

    private String bzname;

    private BigDecimal ybx;

    private BigDecimal rbx;

    private BigDecimal ylx;

    private BigDecimal rlx;

    private BigDecimal ybj;

    private BigDecimal rbj;

    private BigDecimal yfc;

    private BigDecimal rfc;

    private Integer yucount;

    private Integer status;

    private Integer baid;

    private Date yustartime;

    private Integer huid;

    private Integer resint1;

    private Integer resint2;

    private String resstr1;

    private String resstr2;

    public Hkb(Integer hkid, Integer uid, String rname, String cpname, Integer rnum, Integer tnum, Date ytime, Date rtime, String bzname, BigDecimal ybx, BigDecimal rbx, BigDecimal ylx, BigDecimal rlx, BigDecimal ybj, BigDecimal rbj, BigDecimal yfc, BigDecimal rfc, Integer yucount, Integer status, Integer baid, Date yustartime, Integer huid, Integer resint1, Integer resint2, String resstr1, String resstr2) {
        this.hkid = hkid;
        this.uid = uid;
        this.rname = rname;
        this.cpname = cpname;
        this.rnum = rnum;
        this.tnum = tnum;
        this.ytime = ytime;
        this.rtime = rtime;
        this.bzname = bzname;
        this.ybx = ybx;
        this.rbx = rbx;
        this.ylx = ylx;
        this.rlx = rlx;
        this.ybj = ybj;
        this.rbj = rbj;
        this.yfc = yfc;
        this.rfc = rfc;
        this.yucount = yucount;
        this.status = status;
        this.baid = baid;
        this.yustartime = yustartime;
        this.huid = huid;
        this.resint1 = resint1;
        this.resint2 = resint2;
        this.resstr1 = resstr1;
        this.resstr2 = resstr2;
    }

    public Hkb() {
        super();
    }

    public Integer getHkid() {
        return hkid;
    }

    public void setHkid(Integer hkid) {
        this.hkid = hkid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname == null ? null : cpname.trim();
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

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getYtime() {
        return ytime;
    }

    public void setYtime(Date ytime) {
        this.ytime = ytime;
    }

    public Date getRtime() {
        return rtime;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname == null ? null : bzname.trim();
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

    public BigDecimal getYfc() {
        return yfc;
    }

    public void setYfc(BigDecimal yfc) {
        this.yfc = yfc;
    }

    public BigDecimal getRfc() {
        return rfc;
    }

    public void setRfc(BigDecimal rfc) {
        this.rfc = rfc;
    }

    public Integer getYucount() {
        return yucount;
    }

    public void setYucount(Integer yucount) {
        this.yucount = yucount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getYustartime() {
        return yustartime;
    }

    public void setYustartime(Date yustartime) {
        this.yustartime = yustartime;
    }

    public Integer getHuid() {
        return huid;
    }

    public void setHuid(Integer huid) {
        this.huid = huid;
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
package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应借款审核
 */
public class Shborrow {
    private Integer shid;

    private Integer huid;

    private Integer isok;

    private String excuse;

    private Date cktime;

    private Integer baid;

    public Shborrow(Integer shid, Integer huid, Integer isok, String excuse, Date cktime, Integer baid) {
        this.shid = shid;
        this.huid = huid;
        this.isok = isok;
        this.excuse = excuse;
        this.cktime = cktime;
        this.baid = baid;
    }

    public Shborrow() {
        super();
    }

    public Integer getShid() {
        return shid;
    }

    public void setShid(Integer shid) {
        this.shid = shid;
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
    public Date getCktime() {
        return cktime;
    }

    public void setCktime(Date cktime) {
        this.cktime = cktime;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }
}
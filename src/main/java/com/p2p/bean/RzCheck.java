package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应认证审核
 */
public class RzCheck {
    private Integer rcid;

    private Integer uid;

    private Integer huid;

    private Integer isok;

    private String excuse;

    private Date createdTime;

    public RzCheck(Integer rcid, Integer uid, Integer huid, Integer isok, String excuse, Date createdTime) {
        this.rcid = rcid;
        this.uid = uid;
        this.huid = huid;
        this.isok = isok;
        this.excuse = excuse;
        this.createdTime = createdTime;
    }

    public RzCheck() {
        super();
    }

    public Integer getRcid() {
        return rcid;
    }

    public void setRcid(Integer rcid) {
        this.rcid = rcid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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
package com.p2p.bean;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应推荐管理
 */
public class Recommend {
    private Integer rmid;

    private Integer tid;

    private String tname;

    private Integer uid;

    private String rname;

    private Date createdTime;

    public Recommend(Integer rmid, Integer tid, String tname, Integer uid, String rname, Date createdTime) {
        this.rmid = rmid;
        this.tid = tid;
        this.tname = tname;
        this.uid = uid;
        this.rname = rname;
        this.createdTime = createdTime;
    }

    public Recommend() {
        super();
    }

    public Integer getRmid() {
        return rmid;
    }

    public void setRmid(Integer rmid) {
        this.rmid = rmid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
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

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
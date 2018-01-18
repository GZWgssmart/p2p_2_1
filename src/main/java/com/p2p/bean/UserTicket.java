package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应领券表
 */
public class UserTicket {
    private Integer ukid;

    private Integer uid;

    private Integer kid;

    private Date tktime;

    public UserTicket(Integer ukid, Integer uid, Integer kid, Date tktime) {
        this.ukid = ukid;
        this.uid = uid;
        this.kid = kid;
        this.tktime = tktime;
    }

    public UserTicket() {
        super();
    }

    public Integer getUkid() {
        return ukid;
    }

    public void setUkid(Integer ukid) {
        this.ukid = ukid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }
}
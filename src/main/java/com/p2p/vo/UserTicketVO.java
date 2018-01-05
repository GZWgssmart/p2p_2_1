package com.p2p.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 娃娃鱼 on 2018/1/4.
 */
public class UserTicketVO {

    private Integer ukid;

    private Integer uid;

    private Integer kid;

    private String name;

    private Integer type;

    private BigDecimal tkmoney;

    private Date tktime;

    private Date lqtime;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getTkmoney() {
        return tkmoney;
    }

    public void setTkmoney(BigDecimal tkmoney) {
        this.tkmoney = tkmoney;
    }

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }

    public Date getLqtime() {
        return lqtime;
    }

    public void setLqtime(Date lqtime) {
        this.lqtime = lqtime;
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }
}

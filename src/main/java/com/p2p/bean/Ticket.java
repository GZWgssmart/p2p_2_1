package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应券
 */
public class Ticket {
    private Integer kid;

    private String name;

    private Integer type;

    private BigDecimal tkmoney;

    private Date tktime;

    private Integer status;

    public Ticket(Integer kid, String name, Integer type, BigDecimal tkmoney, Date tktime) {
        this.kid = kid;
        this.name = name;
        this.type = type;
        this.tkmoney = tkmoney;
        this.tktime = tktime;
    }

    public Ticket() {
        super();
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
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

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
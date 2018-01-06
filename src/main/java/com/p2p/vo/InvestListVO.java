package com.p2p.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2018/1/6.
 */
public class InvestListVO {

    private String rname;
    private BigDecimal money;
    private Date tztime;

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getTztime() {
        return tztime;
    }

    public void setTztime(Date tztime) {
        this.tztime = tztime;
    }
}

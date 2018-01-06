package com.p2p.vo;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2018/1/5.
 * @author  ChuYiming
 */
public class UserMoneyVO {
    private Integer uid;
    private BigDecimal kyMoney;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public BigDecimal getKyMoney() {
        return kyMoney;
    }

    public void setKyMoney(BigDecimal kyMoney) {
        this.kyMoney = kyMoney;
    }
}

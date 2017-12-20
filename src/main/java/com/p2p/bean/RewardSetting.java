package com.p2p.bean;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2017/12/19.
 * 对应投资奖励总额设置
 */
public class RewardSetting {
    private Integer rwsid;

    private BigDecimal minmoney;

    private BigDecimal maxmoney;

    private Double percent;

    public RewardSetting(Integer rwsid, BigDecimal minmoney, BigDecimal maxmoney, Double percent) {
        this.rwsid = rwsid;
        this.minmoney = minmoney;
        this.maxmoney = maxmoney;
        this.percent = percent;
    }

    public RewardSetting() {
        super();
    }

    public Integer getRwsid() {
        return rwsid;
    }

    public void setRwsid(Integer rwsid) {
        this.rwsid = rwsid;
    }

    public BigDecimal getMinmoney() {
        return minmoney;
    }

    public void setMinmoney(BigDecimal minmoney) {
        this.minmoney = minmoney;
    }

    public BigDecimal getMaxmoney() {
        return maxmoney;
    }

    public void setMaxmoney(BigDecimal maxmoney) {
        this.maxmoney = maxmoney;
    }

    public Double getPercent() {
        return percent;
    }

    public void setPercent(Double percent) {
        this.percent = percent;
    }
}
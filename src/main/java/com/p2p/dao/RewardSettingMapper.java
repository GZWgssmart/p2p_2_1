package com.p2p.dao;

import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface RewardSettingMapper extends BaseDAO {

    Double getPercent(BigDecimal money);
}
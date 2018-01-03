package com.p2p.dao;

import java.math.BigDecimal;

public interface RewardSettingMapper extends BaseDAO {

    Double getPercent(BigDecimal money);
}
package com.p2p.service;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2018/1/2.
 */
public interface RewardSettingService extends BaseService {

    Double getPercent(BigDecimal money);
}

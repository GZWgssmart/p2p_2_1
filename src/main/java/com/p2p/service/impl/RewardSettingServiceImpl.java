package com.p2p.service.impl;

import com.p2p.dao.RewardSettingMapper;
import com.p2p.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2018/1/2.
 */
@Service
public class RewardSettingServiceImpl extends AbstractServiceImpl implements RewardSettingService {

    private RewardSettingMapper rewardSettingMapper;

    @Override
    public Double getPercent(BigDecimal money) {
        return rewardSettingMapper.getPercent(money);
    }

    @Autowired
    public void setRewardSettingMapper(RewardSettingMapper rewardSettingMapper) {
        super.setBaseDAO(rewardSettingMapper);
        this.rewardSettingMapper = rewardSettingMapper;
    }
}

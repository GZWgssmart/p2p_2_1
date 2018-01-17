package com.p2p.service.impl;

import com.p2p.bean.Reward;
import com.p2p.dao.RewardMapper;
import com.p2p.service.RewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 7025 on 2018/1/17.
 */
@Service
public class RewardServiceImpl extends AbstractServiceImpl implements RewardService {

    private RewardMapper rewardMapper;

    @Autowired
    public void setRewardSettingMapper(RewardMapper rewardMapper) {
        super.setBaseDAO(rewardMapper);
        this.rewardMapper = rewardMapper;
    }

    @Override
    public Reward getByUid(Integer uid) {
        return rewardMapper.getByUid(uid);
    }

    @Override
    public List<Reward> getAllReward() {
        return rewardMapper.getAllReward();
    }

    @Override
    public void batchUpdate(List<Reward> rewards) {
        rewardMapper.batchUpdate(rewards);
    }
}

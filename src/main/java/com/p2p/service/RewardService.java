package com.p2p.service;

import com.p2p.bean.Reward;

import java.util.List;

/**
 * Created by 7025 on 2018/1/17.
 */
public interface RewardService extends BaseService{
    Reward getByUid(Integer uid);

    List<Reward> getAllReward();

    void batchUpdate(List<Reward> rewards);
}

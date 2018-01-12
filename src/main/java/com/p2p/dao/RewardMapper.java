package com.p2p.dao;

import com.p2p.bean.Reward;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RewardMapper extends BaseDAO {

    Reward getByUid(Integer uid);

    List<Reward> getAllReward();

    void batchUpdate(List<Reward> rewards);
}
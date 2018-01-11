package com.p2p.dao;

import com.p2p.bean.Reward;
import org.springframework.stereotype.Repository;

@Repository
public interface RewardMapper extends BaseDAO {

    Reward getByUid(Integer uid);
}
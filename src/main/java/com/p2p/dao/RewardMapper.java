package com.p2p.dao;

import com.p2p.bean.Reward;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RewardMapper extends BaseDAO {

    Reward getByUid(Integer uid);

    List<Reward> getAllReward();

    void batchUpdate(List<Reward> rewards);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);
}
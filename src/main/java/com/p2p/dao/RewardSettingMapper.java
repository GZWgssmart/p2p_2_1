package com.p2p.dao;

import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface RewardSettingMapper extends BaseDAO {

    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    Double getPercent(BigDecimal money);
}
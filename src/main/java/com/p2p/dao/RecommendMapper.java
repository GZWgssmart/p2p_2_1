package com.p2p.dao;


import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecommendMapper extends BaseDAO {
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("recommend") Object obj);

    @Override
    Long countCriteria(@Param("recommend") Object obj);
}
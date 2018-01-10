package com.p2p.dao;

import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TzbMapper extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    List<Object> getUserInvest(@Param("pager") Pager pager, @Param("query") Object obj);

    List<Object> getAdminInvest(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    Long countAdminInvest(@Param("query") Object obj);

    Long countUserInvest(@Param("query") Object obj);
}
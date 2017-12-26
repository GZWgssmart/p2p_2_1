package com.p2p.dao;

import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface BorrowApplyMapper extends BaseDAO {

    int updateChecked(@Param("baid")Integer baid, @Param("status")Integer status, @Param("cktime")Date cktime);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);
}
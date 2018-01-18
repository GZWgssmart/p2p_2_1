package com.p2p.dao;

import com.p2p.bean.Letter;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface LetterMapper extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager,@Param("letter") Object obj);

    @Override
    Long countCriteria(@Param("letter") Object obj);

    @Override
    List<Object> listPagerCriteriaStatus(@Param("pager") Pager pager,@Param("letter")Object obj);

    @Override
    Long countCriteriaStatus(@Param("letter") Object obj);

}
package com.p2p.dao;

import com.p2p.bean.Hkb;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HkbMapper extends BaseDAO {

    Integer saveList(List hkbList);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    int updateByBaid(Hkb hkb);

    List<Hkb> getSkTime(Integer baid);
}
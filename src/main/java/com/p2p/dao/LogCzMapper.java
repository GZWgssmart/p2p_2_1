package com.p2p.dao;

import com.p2p.bean.LogCz;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ChuYiming
 */
@Repository
public interface LogCzMapper extends BaseDAO {

   @Override
   List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

   @Override
   Long countCriteria(@Param("query") Object obj);

}
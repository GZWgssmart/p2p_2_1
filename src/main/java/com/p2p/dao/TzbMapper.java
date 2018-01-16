package com.p2p.dao;

import com.p2p.bean.Tzb;
import com.p2p.common.Pager;
import com.p2p.vo.TzCountVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TzbMapper extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    List<Object> getUserInvest(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    Long countUserInvest(@Param("query") Object obj);

    List<TzCountVO> getTotalTzMoney(Integer baid);

    List<Tzb> listTzb(@Param("uid") Integer uid, @Param("baid") Integer baid);
}
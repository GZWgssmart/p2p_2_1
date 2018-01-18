package com.p2p.dao;

import com.p2p.bean.Ticket;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketMapper extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("ticket") Object obj);

    @Override
    Long countCriteria(@Param("ticket") Object obj);

    List<Object> listUserTicket(@Param("pager") Pager pager, @Param("query") Object obj);

    Long countUserTicket(@Param("query") Object obj);

    int updateStatus(String[] kid);

    List<Ticket> getYesTicket();
}
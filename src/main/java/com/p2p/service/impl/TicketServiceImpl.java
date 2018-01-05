package com.p2p.service.impl;

import com.p2p.common.Pager;
import com.p2p.dao.TicketMapper;
import com.p2p.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class TicketServiceImpl extends AbstractServiceImpl implements TicketService {

    private TicketMapper ticketMapper;

    @Override
    public Pager listUserTicket(int page, int limit, Object obj) {
        Pager pager = new Pager(page, limit);
        pager.setRows(ticketMapper.listUserTicket(pager, obj));
        pager.setTotal(ticketMapper.countUserTicket(obj));
        return pager;
    }

    @Autowired
    public void setTicketMapper(TicketMapper ticketMapper) {
        super.setBaseDAO(ticketMapper);
        this.ticketMapper = ticketMapper;
    }
}

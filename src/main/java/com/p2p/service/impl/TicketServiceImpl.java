package com.p2p.service.impl;

import com.p2p.dao.TicketMapper;
import com.p2p.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class TicketServiceImpl extends AbstractServiceImpl implements TicketService {

    private TicketMapper ticketMapper;

    @Autowired
    public void setTicketMapper(TicketMapper ticketMapper) {
        super.setBaseDAO(ticketMapper);
        this.ticketMapper = ticketMapper;
    }
}

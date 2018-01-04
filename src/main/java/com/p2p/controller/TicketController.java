package com.p2p.controller;

import com.p2p.bean.Ticket;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.TicketService;
import com.p2p.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 娃娃鱼 on 2018/1/4.
 */
@Controller
@RequestMapping("/data/ticket")
public class TicketController {

    @Autowired
    private TicketService ticketService;

    @RequestMapping("save")
    @ResponseBody
    public ServerResponse saveTicke(Ticket ticket, String whatTime) {
        ticket.setTktime(DateUtil.parseDate(whatTime, "yyyy-MM-dd HH:mm:ss"));
        return ticketService.save(ticket);
    }

    @RequestMapping("all")
    @ResponseBody
    public Pager all(int page, int limit, Ticket ticket) {
        return ticketService.listPagerCriteria(page, limit, ticket);
    }

}

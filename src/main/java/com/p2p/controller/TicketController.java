package com.p2p.controller;

import com.p2p.bean.Ticket;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.UserTicketMapper;
import com.p2p.service.TicketService;
import com.p2p.utils.DateUtil;
import com.p2p.vo.UserTicketVO;
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

    @RequestMapping("userAll")
    @ResponseBody
    public Pager userAll(int page, int limit, UserTicketVO userTicket) {
        return ticketService.listUserTicket(page,limit,userTicket);
    }

    @RequestMapping("getById")
    @ResponseBody
    public Ticket getById(int kid) {
        Object obj = ticketService.getById(kid);
        Ticket ticket = (Ticket) obj;
        return ticket;
    }

    @RequestMapping("status")
    @ResponseBody
    public ServerResponse vip(String kid) {
        System.out.println("kid:" + kid);
        String[] strings = kid.split(",");
        return ticketService.updateStatus(strings);
    }

    @RequestMapping("remove")
    @ResponseBody
    public ServerResponse remove(Integer kid) {
        return ticketService.removeById(kid);
    }

}

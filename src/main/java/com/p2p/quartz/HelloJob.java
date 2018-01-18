package com.p2p.quartz;

import com.p2p.bean.Ticket;
import com.p2p.service.TicketService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Master on 2017/11/10.
 */
public class HelloJob implements Job{

    private TicketService ticketService;

    @Override
    @Transactional
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ticketService = (TicketService) jobExecutionContext.getJobDetail().getJobDataMap().get("ticketService");
        List<Ticket> tickets = ticketService.getYesTicket();
        int length = tickets.size();
        String[] kid = new String[length];
        if(tickets != null && length > 0) {
            for(int i = 0;i<length;i++) {
                Ticket ticket = tickets.get(i);
                if(ticket.getTktime().compareTo(Calendar.getInstance().getTime()) == -1) {
                    kid[i] = String.valueOf(ticket.getKid());
                }
            }
            ticketService.updateStatus(kid);
        }
    }
}

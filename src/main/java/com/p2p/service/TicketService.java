package com.p2p.service;

import com.p2p.bean.Ticket;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;

import java.util.List;


/**
 * Created by 7025 on 2017/12/25.
 */
public interface TicketService extends BaseService {

    Pager listUserTicket(int page, int limit, Object obj);

    ServerResponse<Integer> updateStatus(String[] kid);

    List<Ticket> getYesTicket();

}

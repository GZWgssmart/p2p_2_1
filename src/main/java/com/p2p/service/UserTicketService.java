package com.p2p.service;

import com.p2p.common.ServerResponse;
import com.p2p.vo.UserTicketVO;

import java.util.List;

/**
 * Created by 娃娃鱼 on 2018/1/5.
 */
public interface UserTicketService extends BaseService {

    ServerResponse<Integer> getByUidKid(int uid, int kid);

    List<UserTicketVO> userAllTicket(Integer uid);

}

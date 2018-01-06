package com.p2p.service.impl;

import com.p2p.common.ServerResponse;
import com.p2p.dao.TicketMapper;
import com.p2p.dao.UserTicketMapper;
import com.p2p.service.UserTicketService;
import com.p2p.vo.UserTicketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class UserTicketServiceImpl extends AbstractServiceImpl implements UserTicketService {

    private UserTicketMapper userTicketMapper;

    @Autowired
    public void setUserTicketMapper(UserTicketMapper userTicketMapper) {
        super.setBaseDAO(userTicketMapper);
        this.userTicketMapper = userTicketMapper;
    }

    @Override
    public ServerResponse<Integer> getByUidKid(int uid, int kid) {
        try {
            if(userTicketMapper.getByUidKid(uid, kid) != 0) {
                return ServerResponse.createBySuccess("您已领过券！");
            }
        } catch (RuntimeException e) {
            return ServerResponse.createByError("您未领过券");
        }
        return ServerResponse.createByError("您未领过券");
    }

    @Override
    public List<UserTicketVO> userAllTicket(Integer uid) {
        return userTicketMapper.userAllTicket(uid);
    }
}

package com.p2p.controller;

import com.p2p.bean.UserTicket;
import com.p2p.common.ServerResponse;
import com.p2p.service.UserTicketService;
import com.p2p.vo.UserTicketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by 娃娃鱼 on 2018/1/5.
 */
@Service
@RequestMapping("/data/userticket")
public class UserTicketController {

    @Autowired
    private UserTicketService userTicketService;

    @RequestMapping("get")
    @ResponseBody
    public ServerResponse get(int uid, int kid) {
        return userTicketService.getByUidKid(uid, kid);
    }

    @RequestMapping("save")
    @ResponseBody
    public ServerResponse save(UserTicket userTicket) {
        userTicket.setTktime(new Date());
        return userTicketService.save(userTicket);
    }

    @RequestMapping("myticket")
    @ResponseBody
    public List<UserTicketVO> all(int uid) {
        if(uid == 0) {
            return null;
        } else {
            return userTicketService.userAllTicket(uid);
        }

    }

}

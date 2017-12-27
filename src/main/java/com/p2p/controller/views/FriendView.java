package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ccf on 2017/12/26.
 */
@Controller
@RequestMapping("/page/message")
public class FriendView {
    @RequestMapping("allFriend")
    public String allFriend(){
        return "message/allFriend";
    }

    @RequestMapping("addFriend")
    public String addFriend(){
        return "message/addFriend";
    }
}

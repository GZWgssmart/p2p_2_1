package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ccf on 2017/12/26.
 */
@Controller
@RequestMapping("/page/message")
public class NoticeView {

    @RequestMapping("allNotice")
    public String allNotie(){
        return "message/allNotice";
    }
    @RequestMapping("addNotice")
    public String addNotice(){
        return "message/addNotice";
    }
}

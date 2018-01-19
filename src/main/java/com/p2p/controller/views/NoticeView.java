package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ccf on 2017/12/26.
 */
@Controller
@RequestMapping("/page/message")
public class NoticeView {
    @RequestMapping("indexNotice")
    public String pageNotice(){
        return"index/aboutwe/notice";
    }
    @RequestMapping
    public String noticeDetail(){
        return"message/noticeDetail";
    }
    @RequestMapping("allNotice")
    public String allNotice(){
        return "message/allNotice";
    }
    @RequestMapping("addNotice")
    public String addNotice(){
        return "message/addNotice";
    }

    @RequestMapping("editNotice")
    public String editNotice(){
        return "message/editNotice";
    }


}

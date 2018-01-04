package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2018/1/4.
 */
@Controller
@RequestMapping("/page/about")
public class AboutWeView {

    @RequestMapping("aboutwe")
    public String aboutwe(){
        return "index/aboutwe/aboutWe";
    }

    @RequestMapping("borrowmessage")
    public String borrowmessage(){
        return "index/aboutwe/borrowMessage";
    }

    @RequestMapping("partner")
    public String partner(){
        return "index/aboutwe/partnerBackground";
    }

    @RequestMapping("company")
    public String company(){
        return "index/aboutwe/companySummary";
    }

    @RequestMapping("team")
    public String team(){
        return "index/aboutwe/team";
    }

    @RequestMapping("findfriend")
    public String findFriend(){
        return "index/aboutwe/findFriend";
    }

}

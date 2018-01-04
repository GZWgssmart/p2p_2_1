package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2018/1/3.
 */
@Controller
@RequestMapping("/index/help")
public class HelpView {

    @RequestMapping("helpPage")
    public String helpPage(){
        return "index/help/help";
    }

    @RequestMapping("questions")
    public String questions(){
        return "index/help/questions";
    }

    @RequestMapping("message")
    public String message(){
        return "index/help/message";
    }

    @RequestMapping("name")
    public String name(){
        return "index/help/name";
    }
}

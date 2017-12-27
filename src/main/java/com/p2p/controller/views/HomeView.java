package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 娃娃鱼 on 2017/12/20.
 */
@Controller
@RequestMapping("/page/home")
public class HomeView {

    @RequestMapping("loginPage")
    public String login() {
        return "home/login";
    }

    @RequestMapping("homePage")
    public String home() {
        return "home/home";
    }

    @RequestMapping("mainPage")
    public String main() {
        return "home/main";
    }

    @RequestMapping("addIndexMsgPage")
    public String addIndexPage(){
        return "message/addIndexMsg";
    }
    @RequestMapping("indexMsg")
    public String indexMsg(){
        return "message/indexMsg";
    }

}

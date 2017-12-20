package com.p2p.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 娃娃鱼 on 2017/12/20.
 */
@Controller
@RequestMapping("/test")
public class testController {

    @RequestMapping("loginPage")
    public String login() {
        return "test/login";
    }

    @RequestMapping("homePage")
    public String home() {
        return "test/home";
    }

    @RequestMapping("mainPage")
    public String main() {
        return "test/main";
    }

}

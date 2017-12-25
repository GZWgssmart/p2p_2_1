package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 娃娃鱼 on 2017/12/22.
 */
@Controller
@RequestMapping("/page/user")
public class UserView {

    @RequestMapping("reg")
    public String userReg() {
        return "user/userReg";
    }

    @RequestMapping("login")
    public String userLogin() {
        return "user/userLogin";
    }

    @RequestMapping("account")
    public String account() {
        return "user/account";
    }

}

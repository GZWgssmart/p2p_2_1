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

    @RequestMapping("safe")
    public String safe() {
        return "user/safe";
    }

    @RequestMapping("taste")
    public String taste() {
        return "user/taste";
    }

    @RequestMapping("fund")
    public String fund() {
        return "user/fund";
    }

    @RequestMapping("recommend")
    public String recommend(){
        return "user/recommendPage";
    }

    @RequestMapping("notice")
    public String notice(){
        return "user/notice";
    }

    @RequestMapping("adminLogin")
    public String adminLogin() {
        return "home/login";
    }
}
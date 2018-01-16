package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created  qingfeng on 2017/12/27.
 */
@Controller
@RequestMapping("/page/admin")
public class AdminView {

    @RequestMapping("login")
    public String adminLogin() {
        return "home/login";
    }

    @RequestMapping("add")
    public String userReg() {
        return "Admin/addhuser";
    }

    @RequestMapping("update")
    public String upHuser() {
        return "Admin/upHuser";
    }

    @RequestMapping("List")
    public String huserList() {
        return "Admin/huserList";
    }

}

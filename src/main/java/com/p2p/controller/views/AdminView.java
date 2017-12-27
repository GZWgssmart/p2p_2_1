package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created  qingfeng on 2017/12/27.
 */
@Controller
@RequestMapping("/page/admin")
public class AdminView {
    @RequestMapping("add")
    public String userReg() {
        return "Admin/addhuser";
    }
}

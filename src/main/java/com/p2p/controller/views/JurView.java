package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created  qingfeng on 2017/12/25.
 */

@Controller
@RequestMapping("/page/Jur")
public class JurView {

    @RequestMapping("add")
    public String addJurPage(){
        return "JurRole/addJur";
    }

    @RequestMapping("update")
    public String updateJurPage(){
        return "JurRole/upJur";
    }

    @RequestMapping("List")
    public String jurList() {
        return "Admin/jurList";
    }

}

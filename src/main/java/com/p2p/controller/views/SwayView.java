package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/sway")
public class SwayView {

    @GetMapping("swayList")
    public String swayList(){
        return "borrow/sway";
    }

    @RequestMapping("addsway")
    public String addSway(){
        return "borrow/addSway";
    }

    @RequestMapping("updateSway")
    public String updateSway(){
        return "borrow/updateSway";

    }
}

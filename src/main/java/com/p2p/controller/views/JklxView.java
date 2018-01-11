package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/jklx")
public class JklxView {
    @GetMapping("jklxTypeList")
    public String jklxType(){
        return "borrow/jklxType";
    }

    @RequestMapping("addjklx")
    public String addjklx(){
        return "borrow/addJklx";
    }
    @RequestMapping("update")
    public String update(){
        return "borrow/updateJklx";
    }


}

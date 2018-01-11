package com.p2p.controller.views;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/bz")
public class BzView {
    @GetMapping("bzList")
    public String Bz(){
        return "borrow/bz";
    }
    @RequestMapping("addBz")
    public String addBz(){
        return "borrow/addBz";
    }
    @RequestMapping("update")
    public String ypdateBz(){
        return "borrow/updateBz";
    }
}

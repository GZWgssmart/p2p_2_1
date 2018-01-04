package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2018/1/2.
 */
@Controller
@RequestMapping("/page/check")
public class CheckView {

    @RequestMapping("userVip")
    public String allVip(){
        return "checkmanage/allVip";
    }
}

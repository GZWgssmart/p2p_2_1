package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2018/1/8.
 */
@Controller
@RequestMapping("/page/vip")
public class rzvipView {

    @RequestMapping("userVipPage")
    public String userVipPage(){
        return "checkmanage/allVip";
    }

    @RequestMapping("vip")
    public String isvip() {
        return "checkmanage/vipCheck";
    }

    @RequestMapping("quan")
    public String quan() {
        return "setting/quan";
    }

    @RequestMapping("reward")
    public String reward() {
        return "setting/reward";
    }
}

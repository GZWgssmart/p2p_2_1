package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2018/1/9.
 */
@Controller
@RequestMapping("/page/ydata")
public class ydataView {

    @RequestMapping("ydataPage")
    public String ydataPage(){
        return "index/aboutwe/ydata";
    }
}

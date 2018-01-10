package com.p2p.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 娃娃鱼 on 2017/12/9.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("")
    public String index() {
        return "index";
    }

    @RequestMapping("statically/insurance")
    public String insurance(){
        return "statically/insurance";
    }

    @RequestMapping("calc/calc")
    public String jis(){
        return "index/Calc";
    }

    @RequestMapping("test")
    public String test(){
        return "test";
    }


}

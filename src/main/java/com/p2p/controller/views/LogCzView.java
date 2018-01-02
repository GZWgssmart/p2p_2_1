package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * Created by Administrator on 2017/12/28.
 * @author ChuYiming
 */
@Controller
@RequestMapping("/page/logCz")
public class LogCzView {

    @RequestMapping("userLogCz")
    public String logCz() {
        return "logCz/userLogCz";
    }

    @RequestMapping("userCzHistory")
    public String czHistory(){
        return "logCz/userCzHistory";
    }
}

package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created  qingfeng on 2017/12/25.
 */
@Controller
@RequestMapping("/page/company")
public class JurView {
    @RequestMapping("addJurPage")
    public String addMediaReportPage(){
        return "company/addJur";
    }
}

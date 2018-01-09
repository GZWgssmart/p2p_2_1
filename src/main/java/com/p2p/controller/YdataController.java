package com.p2p.controller;

import com.p2p.bean.Ydata;
import com.p2p.service.YdataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 娃娃鱼 on 2018/1/9.
 */
@Controller
@RequestMapping("/data/ydata")
public class YdataController {

    @Autowired
    private YdataService ydataService;

    @RequestMapping("new")
    @ResponseBody
    public Ydata one() {
        return ydataService.selectEnd();
    }

}

package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/message")
public class DxmodelView {
    @RequestMapping("addDx")
    public String addDx(){
        return "message/addDxmodel";
    }
}

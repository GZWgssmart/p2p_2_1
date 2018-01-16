package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/message")
public class DxmodelView {
    @RequestMapping("addDxmodel")
    public String addDx(){
        return "message/addDxmodel";
    }

    @RequestMapping("Dxmodel")
    public String dxModel(){
        return "message/allDxmodel";
    }

    @RequestMapping("updayteDxmodel")
    public String updateDxmodel(){
        return "message/updateDxmodel";
    }
}

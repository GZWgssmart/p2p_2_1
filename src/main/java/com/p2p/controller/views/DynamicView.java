package com.p2p.controller.views;

import com.p2p.bean.Dynamic;
import com.p2p.common.ServerResponse;
import com.p2p.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2017/12/22.
 */
@Controller
@RequestMapping("/page/dynamic")
public class DynamicView {

    @RequestMapping("addDynamicPage")
    public String addDynamicPage(){
        return "company/addDynamic" ;
    }
}

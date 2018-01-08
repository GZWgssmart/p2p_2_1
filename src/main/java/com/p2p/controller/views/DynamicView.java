package com.p2p.controller.views;

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

    @RequestMapping("dynamicPage")
    public String dynamicPage(){
        return "company/dynamic";
    }

    @RequestMapping("dynamicDetail")
    public String dynamicDetail(){
        return "company/dynamicDetail";
    }

    @RequestMapping("editPage")
    public String editPage(){
        return "company/editDynamic";
    }

    @RequestMapping("indexDynamic")
    public String indexDynamic(){
        return "index/aboutwe/dynamic";
    }
}

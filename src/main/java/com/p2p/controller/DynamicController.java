package com.p2p.controller;

import com.p2p.bean.Dynamic;
import com.p2p.common.DateUtil;
import com.p2p.common.ServerResponse;
import com.p2p.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2017/12/22.
 */
@Controller
@RequestMapping("/data/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    @RequestMapping("addDynamic")
    public ServerResponse save(Dynamic dynamic, String whatTime){
        dynamic.setCreatedTime(DateUtil.parseDate(whatTime, "yyyy-MM-dd HH:mm:ss"));
        return dynamicService.save(dynamic);
    }
}

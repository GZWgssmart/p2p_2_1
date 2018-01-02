package com.p2p.controller;

import com.p2p.bean.Dynamic;
import com.p2p.utils.DateUtil;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by yao on 2017/12/22.
 */
@Controller
@RequestMapping("/data/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    @RequestMapping("addDynamic")
    @ResponseBody
    public ServerResponse save(Dynamic dynamic, String whatTime){
        dynamic.setCreatedTime(DateUtil.parseDate(whatTime, "yyyy-MM-dd HH:mm:ss"));
        return dynamicService.save(dynamic);
    }

    @RequestMapping("pagerCriteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int limit, Dynamic dynamic){
        return dynamicService.listPagerCriteria(page,limit,dynamic);
    }

    @RequestMapping("details")
    @ResponseBody
    public Dynamic details(int dynamicId){
        Object obj=dynamicService.getById(dynamicId);
        return (Dynamic)obj;
    }

    @RequestMapping("editDynamic")
    @ResponseBody
    public ServerResponse editDynamic(Dynamic dynamic, String time){
        dynamic.setCreatedTime(DateUtil.parseDate(time,"yyyy-MM-dd HH:mm:ss"));
        return dynamicService.update(dynamic);
    }
}

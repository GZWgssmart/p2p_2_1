package com.p2p.controller;

import com.p2p.common.Pager;
import com.p2p.bean.Sway;
import com.p2p.common.ServerResponse;
import com.p2p.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/data/sway")
public class SwayController {

    @Autowired
    private SwayService swayService;

    @RequestMapping("addSway")
    @ResponseBody
    public ServerResponse addSway(Sway sway){
        return swayService.save(sway);
    }

    @RequestMapping("swayPage")
    @ResponseBody
    public Pager bzList(int page, int limit, Sway sway){
        return swayService.listPagerCriteria(page,limit,sway);
    }

    @RequestMapping("updateSway")
    @ResponseBody
    public ServerResponse updateSway(Sway sway){
        return swayService.update(sway);

    }
    @RequestMapping("swayDetail")
    @ResponseBody
    public Sway updateSway(Integer huankuanId){
        Object obj = swayService.getById(huankuanId);
        return (Sway) obj;
    }

    @RequestMapping("delete")
    @ResponseBody
    public ServerResponse delecte(int swayId){
        return swayService.removeById(swayId);
    }
}

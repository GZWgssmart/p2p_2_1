package com.p2p.controller;


import com.p2p.bean.Jklx;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/data/jklx")
public class JklxController {

    @Autowired
    private JklxService jklxService;


    @RequestMapping("jklxPage")
    @ResponseBody
    public Pager jklxTypeList(int page, int limit, Jklx jklx){
        return jklxService.listPagerCriteria(page,limit,jklx);
    }

    @RequestMapping("addJklx")
    @ResponseBody
    public ServerResponse addJklx(Jklx jklx){
        return jklxService.save(jklx);
    }

    @RequestMapping("jklxDetail")
    @ResponseBody
    public Jklx jklxDetail(Integer leixingId){
        Object obj = jklxService.getById(leixingId);
        return (Jklx) obj;
    }

    @RequestMapping("updateJklx")
    @ResponseBody
    public ServerResponse updateJklx(Jklx jklx){
        return jklxService.update(jklx);
    }

    @RequestMapping("delete")
    @ResponseBody
    public ServerResponse delete(int jklxId){
        return jklxService.removeById(jklxId);

    }




}

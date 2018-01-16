package com.p2p.controller;

import com.p2p.bean.Dxmodel;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.DxmodelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("data/message")
public class DxmodelConteller {
    @Autowired
    private DxmodelService dxmodelService;

    @RequestMapping("dxmodelPage")
    @ResponseBody
    public Pager demodelList(int page, int limit, Dxmodel dxmodel){

        return dxmodelService.listPagerCriteria(page,limit,dxmodel);
    }

    @RequestMapping("addDx")
    @ResponseBody
    public ServerResponse addDx(Dxmodel dxmodel){
        return dxmodelService.save(dxmodel);
    }
}

package com.p2p.controller;

import com.p2p.bean.Bz;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("data")
public class BzController {
    @Autowired
    private BzService bzService;

    @RequestMapping("addBz")
    @ResponseBody
    public ServerResponse addBz(Bz bz){
        return bzService.save(bz);
    }

    @RequestMapping("bzPage")
    @ResponseBody
    public Pager bzList(int page, int limit, Bz bz){
        return bzService.listPagerCriteria(page,limit,bz);
    }
}

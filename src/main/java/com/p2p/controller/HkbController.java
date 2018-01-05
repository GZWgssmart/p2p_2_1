package com.p2p.controller;

import com.p2p.bean.Hkb;
import com.p2p.common.Pager;
import com.p2p.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 7025 on 2018/1/5.
 */
@RestController
@RequestMapping("/data/hkb")
public class HkbController {

    @Autowired
    private HkbService hkbService;

    @RequestMapping("planList")
    public Pager getUserPlan(Integer page, Integer limit, Hkb hkb) {
        return hkbService.listPagerCriteria(page, limit, hkb);
    }
}

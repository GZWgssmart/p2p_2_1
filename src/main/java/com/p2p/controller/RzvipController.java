package com.p2p.controller;

import com.p2p.common.Pager;
import com.p2p.service.RzvipService;
import com.p2p.vo.UserRzvipVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 娃娃鱼 on 2018/1/2.
 */
@RestController
@RequestMapping("/data/vip")
public class RzvipController {

    @Autowired
    private RzvipService rzvipService;



    @RequestMapping("novip")
    @ResponseBody
    public Pager allNOvip(int page, int limit, UserRzvipVO userRzvipVO) {
        return rzvipService.listPagerCriteria(page,limit,userRzvipVO);
    }

}

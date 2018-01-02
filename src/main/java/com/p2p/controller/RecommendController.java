package com.p2p.controller;

import com.p2p.bean.Recommend;
import com.p2p.common.Pager;
import com.p2p.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by yao on 2017/12/26.
 */
@Controller
@RequestMapping("/data/recommend")
public class RecommendController {
    @Autowired
    public RecommendService recommendService;

    @RequestMapping("pagerCriteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int limit, Recommend recommend){
        System.out.println(recommend.getFirst() + "-----------------_________");
        return recommendService.listPagerCriteria(page,limit,recommend);
    }

}

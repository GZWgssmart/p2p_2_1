package com.p2p.controller;

import com.p2p.bean.Skb;
import com.p2p.common.ServerResponse;
import com.p2p.service.SkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 7025 on 2018/1/15.
 */
@RestController
@RequestMapping("/data/skb")
public class SkbController {

    @Autowired
    private SkbService skbService;

    /**
     * 用户点击确认收款
     * @param skid
     * @return
     */
    @RequestMapping("confirm")
    public ServerResponse confirmSK(Integer skid) {
        return skbService.confirm((Skb) skbService.getById(skid));
    }
}

package com.p2p.controller;

import com.p2p.bean.RewardSetting;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 娃娃鱼 on 2018/1/8.
 */
@Controller
@RequestMapping("/data/reward")
public class RewardController {

    @Autowired
    private RewardSettingService rewardSettingService;

    @RequestMapping("save")
    @ResponseBody
    private ServerResponse save(RewardSetting rewardSetting) {
        return rewardSettingService.save(rewardSetting);
    }

    @RequestMapping("all")
    @ResponseBody
    public Pager all(int page, int limit) {
        return rewardSettingService.listPager(page, limit);
    }

    @RequestMapping("edit")
    public ServerResponse updata(RewardSetting rewardSetting) {
        return rewardSettingService.update(rewardSetting);
    }

}

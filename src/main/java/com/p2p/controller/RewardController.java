package com.p2p.controller;

import com.p2p.bean.Reward;
import com.p2p.bean.RewardSetting;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.RewardService;
import com.p2p.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 娃娃鱼 on 2018/1/8.
 */
@RestController
@RequestMapping("/data/reward")
public class RewardController {

    @Autowired
    private RewardSettingService rewardSettingService;
    @Autowired
    private RewardService rewardService;

    @RequestMapping("save")
    private ServerResponse save(RewardSetting rewardSetting) {
        return rewardSettingService.save(rewardSetting);
    }

    @RequestMapping("all")
    public Pager all(int page, int limit) {
        return rewardSettingService.listPager(page, limit);
    }

    @RequestMapping("edit")
    public ServerResponse updata(RewardSetting rewardSetting) {
        return rewardSettingService.update(rewardSetting);
    }

    @RequestMapping("rewardList")
    public Pager rewardList(int page, int limit, String status) {
        Reward reward = new Reward();
        reward.setStatus(status);
        return rewardService.listPagerCriteria(page, limit, reward);
    }

}

package com.p2p.controller;

import com.p2p.bean.RewardSetting;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ccf on 2018/1/2.
 */
@Controller
@RequestMapping("/data/rewardSet")
public class RewardSettingController {
    @Autowired
    private RewardSettingService rewardSettingService;

    @RequestMapping("pagerRewardSet")
    @ResponseBody
    public Pager pagerRewardSet(int page, int limit, RewardSetting rewardSetting){
        return rewardSettingService.listPagerCriteria(page,limit,rewardSetting);
    }
    @RequestMapping("addRewardSet")
    @ResponseBody
    public ServerResponse addRewardSet(RewardSetting rewardSetting){
        if(rewardSetting.getMaxmoney().doubleValue() > rewardSetting.getMinmoney().doubleValue()) {
            return rewardSettingService.save(rewardSetting);
        }else {
            return ServerResponse.createByError("最大金额不能小于最小金额");
        }
    }
    @RequestMapping("editRewardSet")
    @ResponseBody
    public ServerResponse editRewardSet(RewardSetting rewardSetting){
        if(rewardSetting.getMaxmoney().doubleValue() > rewardSetting.getMinmoney().doubleValue()) {
            return rewardSettingService.update(rewardSetting);
        }else {
            return ServerResponse.createByError("最大金额不能小于最小金额");
        }
    }

    @RequestMapping("rewardSetById")
    @ResponseBody
    public RewardSetting rewardSetting(Integer rewardSetId){
        Object obj = rewardSettingService.getById(rewardSetId);
        return (RewardSetting) obj;
    }

    @RequestMapping("removeRewardSet")
    @ResponseBody
    public ServerResponse removeRewardSet(RewardSetting rewardSetting){
        return rewardSettingService.removeById(rewardSetting.getRwsid());
    }
}

package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ccf on 2018/1/2.
 */
@Controller
@RequestMapping("/page/rewardSet")
public class RewardSettingView {

   @RequestMapping("rewardSet")
    public String rewardSet(){
      return "rewardSet/rewardSet";
   }

   @RequestMapping("addRewardSet")
    public String addRewardSet(){
        return "rewardSet/addRewardSet";
   }
   @RequestMapping("editRewardSet")
    public String editRewardSet(){
        return "rewardSet/editRewardSet";
   }

    @RequestMapping("rewardList")
    public String rewardList(){
        return "rewardSet/rewardList";
    }
}

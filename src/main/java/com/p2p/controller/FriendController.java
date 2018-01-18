package com.p2p.controller;

import com.p2p.bean.Friend;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/12/26.
 */
@Controller
@RequestMapping("/data/message")
public class FriendController {
    @Autowired
    private FriendService friendService;

    @RequestMapping("pagerFriend")
    @ResponseBody
    public Pager pagerFriend(int page, int limit,Friend friend){
        return friendService.listPagerCriteria(page,limit,friend);
    }
    @RequestMapping("addFriend")
    @ResponseBody
    public ServerResponse addFriend(Friend friend){
        return friendService.save(friend);
    }

    @RequestMapping("allIndexfriend")
    @ResponseBody
    public List<Friend> allIndexfriend(){
        List<Friend> friends = new ArrayList<>();
        List<Object> objects =  friendService.listAll();
        for(Object obj : objects) {
            Friend friend = (Friend) obj;
            friends.add(friend);
        }
        return friends;
    }
    @RequestMapping("removeFriend")
    @ResponseBody
    public ServerResponse removeFriend(Friend friend){
        return friendService.removeById(friend.getFid());
    }

}

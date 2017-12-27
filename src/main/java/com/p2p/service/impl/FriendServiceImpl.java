package com.p2p.service.impl;

import com.p2p.bean.Friend;
import com.p2p.dao.FriendMapper;
import com.p2p.service.BaseService;
import com.p2p.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ccf on 2017/12/25.
 */
@Service
public class FriendServiceImpl extends AbstractServiceImpl implements FriendService {
    private FriendMapper friendMapper;

    @Autowired
    public void setFriendMapper(FriendMapper friendMapper){
        super.setBaseDAO(friendMapper);
        this.friendMapper = friendMapper;
    }
}

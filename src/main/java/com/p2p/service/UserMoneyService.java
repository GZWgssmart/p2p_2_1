package com.p2p.service;

import com.p2p.bean.UserMoney;

/**
 * Created by 7025 on 2017/12/25.
 */
public interface UserMoneyService extends BaseService {

    UserMoney getUserMoney(Integer uid);
}

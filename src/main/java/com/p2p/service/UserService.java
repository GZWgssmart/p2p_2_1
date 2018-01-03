package com.p2p.service;

import com.p2p.bean.Recommend;
import com.p2p.bean.Rzvip;
import com.p2p.bean.User;
import com.p2p.common.ServerResponse;

/**
 * Created by 娃娃鱼 on 2017/12/21.
 */
public interface UserService extends BaseService {

    User getByPhonePwd(String phone, String upwd);

    ServerResponse<Integer> getByPhone(String phone);

    ServerResponse saveBorrow(User user, Rzvip rzvip);

    ServerResponse saveRecommend(User user, Recommend recommend);

    ServerResponse<Integer> updateVip(String[] uid);

}

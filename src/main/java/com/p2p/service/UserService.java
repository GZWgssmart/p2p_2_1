package com.p2p.service;

import com.p2p.bean.User;

/**
 * Created by 娃娃鱼 on 2017/12/21.
 */
public interface UserService extends BaseService {

    User getByPhonePwd(String phone, String upwd);

}

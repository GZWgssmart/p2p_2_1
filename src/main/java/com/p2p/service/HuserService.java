package com.p2p.service;

import com.p2p.bean.Huser;
import com.p2p.common.ServerResponse;

/**
 * Created by qingfeng on 2017/12/27.
 */
public interface HuserService extends BaseService {

    Huser getByPhonePwd(String phone, String pwd);

    ServerResponse<Integer> getByPhone(String phone);

}

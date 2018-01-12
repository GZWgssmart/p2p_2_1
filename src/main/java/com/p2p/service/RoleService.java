package com.p2p.service;

import com.p2p.bean.Role;
import com.p2p.bean.Rolejur;
import com.p2p.common.ServerResponse;

/**
 * Created by qingfeng on 2017/12/26.
 */
public interface RoleService extends BaseService {
    ServerResponse saveRolejur(Role role, Rolejur rolejur);
}

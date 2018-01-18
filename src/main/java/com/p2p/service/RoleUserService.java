package com.p2p.service;

import com.p2p.bean.Role;

import java.util.List;

/**
 * Created by qingfeng on 2017/12/26.
 */
public interface RoleUserService extends BaseService {
    List<Role> getRoleUser(Integer huid);
}

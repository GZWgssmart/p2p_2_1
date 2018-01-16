package com.p2p.service;

import com.p2p.bean.Jur;

import java.util.List;

/**
 * Created by qingfeng on 2017/12/26.
 */
public interface RoleJurService extends BaseService {

    List<Jur> getRoleJur(Integer rid);

}

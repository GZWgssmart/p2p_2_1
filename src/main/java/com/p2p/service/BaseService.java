package com.p2p.service;

import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;

import java.util.List;

/**
 * Created by 7025 on 2017/12/20.
 */
public interface BaseService {

    ServerResponse<String> save(Object obj);
    ServerResponse<String> remove(Object obj);
    ServerResponse<String> removeById(Long id);
    ServerResponse<String> active(Long id, Byte status);
    ServerResponse<String> update(Object obj);

    Object getById(Long id);
    List<Object> listAll();
    Pager listPager(int pageNo, int pageSize);

    Pager listPagerCriteria(int pageNo, int pageSize, Object obj);
}

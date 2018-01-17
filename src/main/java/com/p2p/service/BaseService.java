package com.p2p.service;

import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;

import java.util.List;

/**
 * Created by 7025 on 2017/12/20.
 */
public interface BaseService {

    ServerResponse<Integer> save(Object obj);
    ServerResponse<Integer> remove(Object obj);
    ServerResponse<Integer> removeById(Integer id);
    ServerResponse<Integer> active(Integer id, Integer status);
    ServerResponse<Integer> update(Object obj);

    Object getById(Integer id);
    List<Object> listAll();
    Pager listPager(int pageNo, int pageSize);

    Pager listPagerCriteria(int pageNo, int pageSize, Object obj);

    //根据需求，自定义的分页
    Pager listPagerStatus(int pageNo, int pageSize);

    Pager listPagerCriteriaStatus(int pageNo, int pageSize, Object obj);

}

package com.p2p.dao;

import com.p2p.common.Pager;

import java.util.List;

/**
 * Created by 7025 on 2017/12/20.
 */
public interface BaseDAO {
    int save(Object obj);
    int remove(Object obj);
    int removeById(Integer id);

    /**
     * 更改状态
     * @param id
     * @param status
     */
    int active(Integer id, Integer status);
    int update(Object obj);

    Object getById(Integer id);
    List<Object> listAll();
    List<Object> listPager(Pager pager);
    Long count();

    /**
     * 按条件分页查询
     * @param pager
     * @param obj
     * @return
     */
    List<Object> listPagerCriteria(Pager pager, Object obj);

    /**
     * 按条件分页计数
     * @param obj
     * @return
     */
    Long countCriteria(Object obj);
    //自定义分页
    List<Object> listPagerCriteriaStatus (Pager pager,Object obj);
    Long countCriteriaStatus(Object obj);
}

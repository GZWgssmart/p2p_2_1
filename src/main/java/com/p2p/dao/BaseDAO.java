package com.p2p.dao;

import com.p2p.common.Pager;

import java.util.List;

/**
 * Created by 7025 on 2017/12/20.
 */
public interface BaseDAO {
    void save(Object obj);
    void remove(Object obj);
    void removeById(Long id);

    /**
     * 更改状态
     * @param id
     * @param status
     */
    void active(Long id, Byte status);
    void update(Object obj);

    Object getById(Long id);
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
}

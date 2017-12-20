package com.p2p.dao;

/**
 * Created by 7025 on 2017/12/20.
 */
public interface BaseDAO {
    int deleteById(Integer fid);

    int insert(Object obj);

    int insertSelective(Object obj);

    Object selectById(Integer fid);

    int updateByIdSelective(Object obj);

    int updateById(Object obj);
}

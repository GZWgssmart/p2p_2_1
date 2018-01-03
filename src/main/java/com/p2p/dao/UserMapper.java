package com.p2p.dao;

import com.p2p.bean.User;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseDAO {

    User getByPhonePwd(@Param("phone") String phone, @Param("upwd") String upwd);

    int getByPhone(String phone);

    @Override
    List<Object> listPagerCriteria(@Param("pager")Pager pager, @Param("user") Object obj);
    int updateVip(String[] uid);

}
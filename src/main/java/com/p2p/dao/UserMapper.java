package com.p2p.dao;

import com.p2p.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends BaseDAO {

    User getByPhonePwd(@Param("phone") String phone, @Param("upwd") String upwd);

}
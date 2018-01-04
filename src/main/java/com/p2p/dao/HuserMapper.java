package com.p2p.dao;

import com.p2p.bean.Huser;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HuserMapper extends BaseDAO {


    Huser getByPhonePwd(@Param("phone") String phone, @Param("pwd") String pwd);

    int getByPhone(String phone);

    @Override
    List<Object> listPagerCriteria(@Param("pager")Pager pager, @Param("obj")Object obj);

    @Override
    Long countCriteria(@Param("obj")Object obj);
}
package com.p2p.dao;

import com.p2p.bean.Huser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HuserMapper extends BaseDAO {


    Huser getByPhonePwd(@Param("phone") String phone, @Param("pwd") String pwd);

    int getByPhone(String phone);


}
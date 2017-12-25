package com.p2p.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface BorrowApplyMapper extends BaseDAO {

    int updateChecked(@Param("baid")Integer baid, @Param("status")Integer status, @Param("cktime")Date cktime);
}
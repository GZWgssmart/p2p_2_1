package com.p2p.dao;

import com.p2p.bean.Jur;
import com.p2p.bean.Rolejur;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RolejurMapper extends BaseDAO {

    List<Jur> getRoleJur(@Param("rid") Integer rid);

}
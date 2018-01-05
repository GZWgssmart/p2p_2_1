package com.p2p.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface ShborrowMapper extends BaseDAO {

    Integer getIdByBaid(Integer baid);

}
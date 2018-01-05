package com.p2p.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HkbMapper extends BaseDAO {

    Integer saveList(List hkbList);

}
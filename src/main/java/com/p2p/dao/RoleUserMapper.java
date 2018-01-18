package com.p2p.dao;

import com.p2p.bean.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleUserMapper extends BaseDAO {

    List<Role> getRoleUser(@Param("huid") Integer huid);

}
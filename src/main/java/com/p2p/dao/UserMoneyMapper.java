package com.p2p.dao;

import com.p2p.bean.UserMoney;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMoneyMapper extends BaseDAO {

    UserMoney getUserMoney(Integer uid);
}
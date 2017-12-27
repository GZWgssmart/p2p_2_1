package com.p2p.dao;

import com.p2p.bean.BankCard;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankCardMapper extends BaseDAO {
    List<BankCard> bankCardsByUid(Integer uid);
}
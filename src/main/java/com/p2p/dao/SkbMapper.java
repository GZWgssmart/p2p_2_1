package com.p2p.dao;

import com.p2p.bean.Skb;

public interface SkbMapper extends BaseDAO {

    int updateByBaid(Skb skb);
}
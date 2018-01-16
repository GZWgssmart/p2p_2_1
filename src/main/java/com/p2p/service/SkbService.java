package com.p2p.service;

import com.p2p.bean.Skb;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;

/**
 * Created by 7025 on 2017/12/25.
 */
public interface SkbService extends BaseService {

    ServerResponse confirm(Skb skb);

    Pager skblist(int pageNo, int pageSize, Integer uid, Integer baid);
}

package com.p2p.service;

import com.p2p.bean.Ydata;
import com.p2p.common.ServerResponse;

/**
 * Created by 娃娃鱼 on 2018/1/8.
 */
public interface YdataService{

    Ydata getById(Integer yid);

    ServerResponse<Integer> update(Ydata ydata);

    ServerResponse<Integer> save(Ydata ydata);

    Ydata selectEnd();
}

package com.p2p.service;

import com.p2p.bean.Hkb;
import com.p2p.common.ServerResponse;

import java.util.List;

/**
 * Created by 7025 on 2017/12/25.
 */
public interface HkbService extends BaseService {

    ServerResponse saveList(List hkbList);

    ServerResponse confirm(Hkb hkb);
}

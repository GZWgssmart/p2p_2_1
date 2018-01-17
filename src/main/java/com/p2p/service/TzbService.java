package com.p2p.service;

import com.p2p.common.Pager;
import com.p2p.vo.TzCountVO;

import java.util.List;

/**
 * Created by 7025 on 2017/12/25.
 */
public interface TzbService extends BaseService {

    Pager getUserInvest(Integer page, Integer limit, Object obj);

    List<TzCountVO> getTotalTzMoney(Integer baid);

}

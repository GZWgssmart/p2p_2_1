package com.p2p.service.impl;

import com.p2p.common.Pager;
import com.p2p.dao.LogMoneyMapper;
import com.p2p.service.LogMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/22.
 *
 * @author ChuYIming
 */
@Service
public class LogMoneyServiceImpl extends AbstractServiceImpl implements LogMoneyService {

    private LogMoneyMapper logMoneyMapper;

    @Autowired
    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        super.setBaseDAO(logMoneyMapper);
        this.logMoneyMapper = logMoneyMapper;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logMoneyMapper.listPagerCriteria(pager, obj));
        pager.setTotal(logMoneyMapper.countCriteria(obj));
        return pager;
    }
}

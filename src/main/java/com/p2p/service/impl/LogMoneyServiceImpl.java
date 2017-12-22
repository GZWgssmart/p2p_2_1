package com.p2p.service.impl;

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

    @Autowired
    private LogMoneyMapper logMoneyMapper;

    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        super.setBaseDAO(logMoneyMapper);
        this.logMoneyMapper = logMoneyMapper;
    }
}

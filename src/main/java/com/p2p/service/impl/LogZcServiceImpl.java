package com.p2p.service.impl;

import com.p2p.dao.LogCzMapper;
import com.p2p.service.LogCzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/22.
 *
 * @author ChuYiming
 */
@Service
public class LogZcServiceImpl extends AbstractServiceImpl implements LogCzService {

    @Autowired
    private LogCzMapper logCzMapper;

    public void setLogCzMapper(LogCzMapper logCzMapper) {
        super.setBaseDAO(logCzMapper);
        this.logCzMapper = logCzMapper;
    }
}

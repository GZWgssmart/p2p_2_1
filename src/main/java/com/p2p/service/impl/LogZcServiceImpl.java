package com.p2p.service.impl;

import com.p2p.bean.LogCz;
import com.p2p.common.Pager;
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

    private LogCzMapper logCzMapper;

    @Autowired
    public void setLogCzMapper(LogCzMapper logCzMapper) {
        super.setBaseDAO(logCzMapper);
        this.logCzMapper = logCzMapper;
    }


    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logCzMapper.listPagerCriteria(pager, obj));
        pager.setTotal(logCzMapper.countCriteria(obj));
        return pager;
    }
}

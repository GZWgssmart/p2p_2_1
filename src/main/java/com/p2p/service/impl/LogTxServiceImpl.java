package com.p2p.service.impl;

import com.p2p.common.Pager;
import com.p2p.dao.LogTxMapper;
import com.p2p.service.LogTxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by Administrator on 2017/12/22.
 *
 * @author ChuYiming
 */
@Service
public class LogTxServiceImpl extends AbstractServiceImpl implements LogTxService {
    /**
     * 提现记录 记录永远保存 不支持删除 不支持修改  允许用户管理了查看记录
     * 提现状态 1 yu 0
     */
    private LogTxMapper logTxMapper;

    @Autowired
    public void setLogTxMapper(LogTxMapper logTxMapper) {
        super.setBaseDAO(logTxMapper);
        this.logTxMapper = logTxMapper;
    }
    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logTxMapper.listPagerCriteria(pager, obj));
        pager.setTotal(logTxMapper.countCriteria(obj));
        return pager;
    }

}

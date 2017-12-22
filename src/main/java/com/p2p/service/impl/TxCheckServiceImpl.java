package com.p2p.service.impl;

import com.p2p.dao.TxCheckMapper;
import com.p2p.service.TxCheckService;
import com.sun.xml.internal.txw2.TXW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/22.
 *
 * @author ChuYiming
 */
@Service
public class TxCheckServiceImpl extends AbstractServiceImpl implements TxCheckService {

    @Autowired
    private TxCheckMapper txCheckMapper;

    public void setTxCheckMapper(TxCheckMapper txCheckMapper) {
        super.setBaseDAO(txCheckMapper);
        this.txCheckMapper = txCheckMapper;
    }
}

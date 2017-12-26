package com.p2p.service.impl;

import com.p2p.dao.BzMapper;
import com.p2p.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author CMY
 * 
 */
@Service
public class BzServiceImpl extends AbstractServiceImpl implements BzService{

    private BzMapper bzMapper;

    @Autowired
    private void setBzMapper(BzMapper bzMapper){
        super.setBaseDAO(bzMapper);
        this.bzMapper = bzMapper;
    }


}

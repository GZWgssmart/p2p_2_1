package com.p2p.service.impl;

import com.p2p.dao.RzCheckMapper;
import com.p2p.service.RzCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RzCheckServiceImpl extends AbstractServiceImpl  implements RzCheckService {
    private RzCheckMapper rzCheckMapper;

    @Autowired
    public void setRzCheckMapper(RzCheckMapper rzCheckMapper) {
        super.setBaseDAO(rzCheckMapper);
        this.rzCheckMapper = rzCheckMapper;
    }
}
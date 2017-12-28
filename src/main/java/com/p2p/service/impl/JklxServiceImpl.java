package com.p2p.service.impl;

import com.p2p.dao.JklxMapper;
import com.p2p.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JklxServiceImpl extends AbstractServiceImpl implements JklxService {

    private JklxMapper jklxMapper;
    @Autowired
    public void setJklxMapper(JklxMapper jklxMapper){
        super.setBaseDAO(jklxMapper);
        this.jklxMapper = jklxMapper;

    }
}

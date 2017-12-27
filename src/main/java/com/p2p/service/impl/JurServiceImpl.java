package com.p2p.service.impl;

import com.p2p.dao.JurMapper;
import com.p2p.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JurServiceImpl extends AbstractServiceImpl implements JurService {

    private JurMapper jurMapper;

    @Autowired
    public void setJurMapper(JurMapper jurMapper){
        super.setBaseDAO(jurMapper);
        this.jurMapper = jurMapper;
    }
}

package com.p2p.service.impl;

import com.p2p.bean.Jur;
import com.p2p.bean.Rolejur;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.JurMapper;
import com.p2p.dao.RolejurMapper;
import com.p2p.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class JurServiceImpl extends AbstractServiceImpl implements JurService {

    private JurMapper jurMapper;
    private RolejurMapper rolejurMapper;

    @Autowired
    public void setJurMapper(JurMapper jurMapper){
        super.setBaseDAO(jurMapper);
        this.jurMapper = jurMapper;
    }

    @Autowired
    public void setRolejurMapper(RolejurMapper rolejurMapper) {
        this.rolejurMapper = rolejurMapper;
    }
}

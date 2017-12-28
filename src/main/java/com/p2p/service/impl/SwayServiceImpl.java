package com.p2p.service.impl;

import com.p2p.dao.SwayMapper;
import com.p2p.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SwayServiceImpl extends AbstractServiceImpl implements SwayService {

    private SwayMapper swayMapper;

    @Autowired
    private void setSwayMapper(SwayMapper swayMapper){
        super.setBaseDAO(swayMapper);
        this.swayMapper = swayMapper;

    }

}

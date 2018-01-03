package com.p2p.service.impl;

import com.p2p.dao.RzvipMapper;
import com.p2p.service.RzvipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 娃娃鱼 on 2018/1/2.
 */
@Service
public class RzvipServiceImpl extends AbstractServiceImpl implements RzvipService{

    private RzvipMapper rzvipMapper;

    @Autowired
    public void setRolejurMapper(RzvipMapper rzvipMapper){
        super.setBaseDAO(rzvipMapper);
        this.rzvipMapper = rzvipMapper;
    }

}

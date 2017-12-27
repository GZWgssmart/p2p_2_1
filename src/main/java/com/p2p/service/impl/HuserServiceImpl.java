package com.p2p.service.impl;

import com.p2p.dao.HuserMapper;
import com.p2p.service.HkbService;
import com.p2p.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qingfeng on 2017/12/27.
 */
@Service
public class HuserServiceImpl extends AbstractServiceImpl implements HuserService {

    private HuserMapper huserMapper;

    @Autowired
    public void setHuserMapper(HuserMapper huserMapper){
        super.setBaseDAO(huserMapper);
        this.huserMapper = huserMapper;
    }

}

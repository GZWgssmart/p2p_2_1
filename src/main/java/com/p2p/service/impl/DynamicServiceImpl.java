package com.p2p.service.impl;

import com.p2p.dao.DynamicMapper;
import com.p2p.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yao on 2017/12/22.
 */
@Service
public class DynamicServiceImpl extends AbstractServiceImpl implements DynamicService{


    private DynamicMapper dynamicMapper;

    @Autowired
    public void setDynamicMapper(DynamicMapper dynamicMapper) {
        super.setBaseDAO(dynamicMapper);
        this.dynamicMapper = dynamicMapper;
    }
}

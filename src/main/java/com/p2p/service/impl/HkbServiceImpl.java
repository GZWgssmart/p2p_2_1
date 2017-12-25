package com.p2p.service.impl;

import com.p2p.dao.HkbMapper;
import com.p2p.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class HkbServiceImpl extends AbstractServiceImpl implements HkbService {

    private HkbMapper hkbMapper;

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        super.setBaseDAO(hkbMapper);
        this.hkbMapper = hkbMapper;
    }
}

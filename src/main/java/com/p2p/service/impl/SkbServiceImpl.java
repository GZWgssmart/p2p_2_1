package com.p2p.service.impl;

import com.p2p.dao.SkbMapper;
import com.p2p.service.SkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class SkbServiceImpl extends AbstractServiceImpl implements SkbService {

    private SkbMapper skbMapper;

    @Autowired
    public void setSkbMapper(SkbMapper skbMapper) {
        super.setBaseDAO(skbMapper);
        this.skbMapper = skbMapper;
    }
}

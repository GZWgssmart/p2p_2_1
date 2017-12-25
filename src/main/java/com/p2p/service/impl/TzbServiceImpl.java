package com.p2p.service.impl;

import com.p2p.dao.TzbMapper;
import com.p2p.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService {

    private TzbMapper tzbMapper;

    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseDAO(tzbMapper);
        this.tzbMapper = tzbMapper;
    }
}

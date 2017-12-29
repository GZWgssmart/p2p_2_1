package com.p2p.service.impl;

import com.p2p.dao.HomeMapper;
import com.p2p.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yao on 2017/12/27.
 */
@Service
public class HomeServiceImpl extends AbstractServiceImpl implements HomeService {
    private HomeMapper homeMapper;

    @Autowired
    public void setHomeMapper(HomeMapper homeMapper) {
        super.setBaseDAO(homeMapper);
        this.homeMapper = homeMapper;
    }
}

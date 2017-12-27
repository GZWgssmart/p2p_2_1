package com.p2p.service.impl;

import com.p2p.dao.RecommendMapper;
import com.p2p.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendServiceImpl extends AbstractServiceImpl implements RecommendService {

    private RecommendMapper recommendMapper;

    @Autowired
    public void setRecommendMapper(RecommendMapper recommendMapper) {
        super.setBaseDAO(recommendMapper);
        this.recommendMapper = recommendMapper;
    }
}
package com.p2p.service.impl;

import com.p2p.dao.BorrowDetailMapper;
import com.p2p.service.BorrowDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/24.
 */
@Service
public class BorrowDetailServiceImpl extends AbstractServiceImpl implements BorrowDetailService {

    private BorrowDetailMapper borrowDetailMapper;

    @Autowired
    public void setBorrowDetailMapper(BorrowDetailMapper borrowDetailMapper) {
        super.setBaseDAO(borrowDetailMapper);
        this.borrowDetailMapper = borrowDetailMapper;
    }
}
